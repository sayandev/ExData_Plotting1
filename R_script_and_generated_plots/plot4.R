#Author: Sayan Maity
# plot4.R - Creating multiple time series plots of Global active power, Voltage,
#           Global Active Power by submeter and Global reactive power

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

# Initialize the plot4.png
png("plot4.png", height=480, width=480)

# Creating positions for multiple plots
par(mfrow=c(2,2))

# Plot Timeseries representation of Global Active Power 
plot(data$DateTime, 
     data$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# Plot Timeseries representation of Voltage 
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(data$DateTime, data$Voltage)

# Plot Timeseries representation of Global Active Power by submeter
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
       col = c('black', 'red', 'blue'),
       bty = 'n')

# Plot Timeseries representation of Global reactive power 
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

# Close the "plot4.png" file
dev.off()
