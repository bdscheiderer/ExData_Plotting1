## plot2.R

## load necessary library
library('lubridate')

## the data .txt file should already be in the working directory
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = "?", stringsAsFactors = FALSE)

## subset the data to just February 1 & 2, 2007
mydata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

## change Date and Time to POSIXct objects
mydata$Date <- dmy(mydata$Date)
mydata$Time <- hms(mydata$Time)
mydata$date_time <- ymd_hms(mydata$Date + mydata$Time)

## create the plot and save to a file
# start plot 2x2
par(mfrow = c(2,2))

# Plot 1 upper left
plot(mydata$date_time, mydata$Global_active_power, xlab = '', ylab ='Global Active Power', type = 'l', bg = 'white')

# Plot 2 upper right
plot(mydata$date_time, mydata$Voltage, xlab = 'datetime', ylab ='Voltage', type = 'l')

# Plot 3 lower left
plot(mydata$date_time, mydata$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
lines(mydata$date_time, mydata$Sub_metering_1, type = 'l', lwd = .75)
lines(mydata$date_time, mydata$Sub_metering_2, type = 'l', col = 'red', lwd = .75)
lines(mydata$date_time, mydata$Sub_metering_3, type = 'l', col = 'blue', lwd = .75)
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1,1,1), col = c('black', 'red', 'blue'), cex = 0.85, bty = 'n')

# Plot 4 lower right
plot(mydata$date_time, mydata$Global_reactive_power, xlab = 'datetime', ylab ='Global_reactive_power', type = 'l')

#save to file
dev.copy(png, file = 'plot4.png')
dev.off()