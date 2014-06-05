#Author: Sayan Maity
#plot3.R - Plotting the time series representation of Global Active Power by submeter

# Read the data in R
data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')
#Convert the Date and Time variables to Date/Time classes in R 
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          "%d/%m/%Y %H:%M:%S")
#Subset the data from the dates 2007-02-01 and 2007-02-02 from the whole dataset
data <- subset(data, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))

# Initializing the plot3.png
png("plot3.png", height=480, width=480)

# Plotting the time series representation of Global Active Power by submeter
plot(data$DateTime, 
     data$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

# Close the "plot3.png" file
dev.off()
