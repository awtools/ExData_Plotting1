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

## Plot 3 as PNG (480x480)
png("04_Exploratory_Data_Analysis/plot3.png", width=480, height=480) 
plot(data_subset$Datetime, data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(data_subset$Datetime, data_subset$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(data_subset$Datetime, data_subset$Sub_metering_2,col='Red')
lines(data_subset$Datetime, data_subset$Sub_metering_3,col='Blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5) 
dev.off()