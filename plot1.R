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
hist(hw12$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()

