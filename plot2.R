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
plot(mydata$date_time, mydata$Global_active_power, xlab = '', ylab ='Global Active Power (kilowatts)', type = 'l')
dev.copy(png, file = 'plot2.png')
def.off()

