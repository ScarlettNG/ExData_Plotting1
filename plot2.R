# Import the data in 

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# For this analysis, we only need data from 1/2/2007 - 2/2/2007
# Let's strip the time to the wanted time spand

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Convert Date and Time into objects of POSIXlt and preferred date type 

time_line <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Let's plot the Global Active Power based on data
plot(time_line, as.numeric(data$Global_active_power), 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file='plot2.png', width = 480, height=480)
dev.off()