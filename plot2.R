power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
twoDayPower <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
twoDayPower$DateTime <- do.call(paste, c(twoDayPower[c("Date", "Time")], sep = " "))
twoDayPower$DateTime <- strptime(twoDayPower$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)
plot(twoDayPower$DateTime, twoDayPower$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()