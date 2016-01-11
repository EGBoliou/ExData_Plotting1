library(dplyr)
hw1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hw11 <- mutate(hw1, DateTime = paste(Date,Time, sep = " "))
hw12 <- select(hw11, -(Date:Time))
hw11 <- strptime(hw12$DateTime, "%d/%m/%Y %H:%M:%S")
hw12 <- cbind(hw11,hw12)
hw12 <- select(hw12, -(DateTime))
hw12 <- rename(hw12, DateTime = hw11)
hw12 <- filter(hw12, DateTime >= "2007-02-01")
hw12 <- filter(hw12, DateTime <= "2007-02-03")
class(hw12$Global_active_power) <- "numeric"
class(hw12$Global_reactive_power) <- "numeric"
class(hw12$Voltage) <- "numeric"
class(hw12$Global_intensity) <- "numeric"
class(hw12$Sub_metering_1) <- "numeric"
class(hw12$Sub_metering_2) <- "numeric"
class(hw12$Sub_metering_3) <- "numeric"
dev.off()
par(mfrow = c(2,2))
plot(hw12$DateTime, hw12$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(hw12$DateTime, hw12$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(hw12$DateTime, hw12$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(hw12, points(DateTime, Sub_metering_1, type = "l"))
with(hw12, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(hw12, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hw12$DateTime, hw12$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()

