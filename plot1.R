# Import the data in 

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# For this analysis, we only need data from 1/2/2007 - 2/2/2007
# Let's strip the time to the wanted time spand

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

head(data, 10)

# Plot a histogram for Global Active Power 
library(ggplot2)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file='plot1.png', width = 480, height=480)
dev.off()