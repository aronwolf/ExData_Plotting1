power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
twoDayPower <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
twoDayPower$DateTime <- do.call(paste, c(twoDayPower[c("Date", "Time")], sep = " "))
twoDayPower$DateTime <- strptime(twoDayPower$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(twoDayPower$DateTime, twoDayPower$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(twoDayPower$DateTime, twoDayPower$Voltage, type = "l", ylab = "voltage", xlab = "datetime")

plot(twoDayPower$DateTime, twoDayPower$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(twoDayPower$DateTime, twoDayPower$Sub_metering_2, col = "red", type = "l", ylab = "Energy sub metering", xlab = "")
points(twoDayPower$DateTime, twoDayPower$Sub_metering_3, col = "blue", type = "l", ylab = "Energy sub metering", xlab = "")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black", "blue","red"))

plot(twoDayPower$DateTime, twoDayPower$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()