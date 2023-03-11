# Import the data in 

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# For this analysis, we only need data from 1/2/2007 - 2/2/2007
# Let's strip the time to the wanted time spand

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Create plot for sub Metering 1 and gradually add line for sub metering 2 and 3
# Add legends following the description

plot(time_line, as.numeric(data$Sub_metering_1), type="l", xlab="", ylab="Energy Sub Metering")
lines(time_line, as.numeric(data$Sub_metering_2), type='l', col='red')
lines(time_line, data$Sub_metering_3, type='l', col='blue')

legend('topright', c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), 
       col= c('black','red','blue'), lty = 1)

dev.copy(png, file='plot3.png', width = 480, height=480)
dev.off()