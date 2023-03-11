# Import the data in 

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# For this analysis, we only need data from 1/2/2007 - 2/2/2007
# Let's strip the time to the wanted time spand

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#Create a margin to fit all 4 plots (by mfrow =c(2,2) -> we will have 2x2 layout)
par(mfrow = c(2,2))

plot(time_line, data$Global_active_power, xlab='', ylab = 'Global Active Power (kilowatts)', type='l')
plot(time_line, data$Voltage, xlab='datetime', ylab = 'Voltage', type='l')

plot(time_line, as.numeric(data$Sub_metering_1), type="l", xlab="", ylab="Energy Sub Metering")
lines(time_line, as.numeric(data$Sub_metering_2), type='l', col='red')
lines(time_line, data$Sub_metering_3, type='l', col='blue')

legend('topright', c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), 
       col= c('black','red','blue'), cex = 0.8, lty = 1)

plot(time_line, data$Global_reactive_power, xlab='datetime', ylab = 'Global_reactive_power', type='l')

dev.copy(png, file='plot4.png', width = 480, height=480)
dev.off()