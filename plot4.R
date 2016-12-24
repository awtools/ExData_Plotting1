## Read data (Need some time)
data <- read.csv("04_Exploratory_Data_Analysis/data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                 stringsAsFactors=FALSE, comment.char="", quote='\"')

## Subset data 
data_subset <- subset(data, subset=(Date %in% c("1/2/2007","2/2/2007")))

## Remove data from memory
rm(data)

## Convert date
datetime_str = paste(data_subset$Date, data_subset$Time, sep = " ") 
datetime = strptime(datetime_str, format = "%d/%m/%Y %H:%M:%S") 
data_subset$Datetime = as.POSIXct(datetime)

## Plot 4 as PNG (480x480)
png("04_Exploratory_Data_Analysis/plot4.png", width=480, height=480) 
##Set Plot to 2x2
par(mfrow = c(2,2))
##Plot1
plot(data_subset$Datetime, data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##Plot2
plot(data_subset$Datetime, data_subset$Voltage, type="l", xlab="datetime", ylab="Voltage")
##Plot3
plot(data_subset$Datetime, data_subset$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(data_subset$Datetime, data_subset$Sub_metering_2,col='Red')
lines(data_subset$Datetime, data_subset$Sub_metering_3,col='Blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5, bty="n") 
##Plot4
plot(data_subset$Datetime, data_subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()