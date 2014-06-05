#Author: Sayan Maity

# plot1.R - Plot histogram of Global Active Power

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

# Initializing the plot1.png
png("plot1.png", height=480, width=480)

# Plotting the  histogram
hist(data$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close the "plot1.png" file
dev.off()
