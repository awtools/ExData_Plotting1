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

## Plot 1 as PNG (480x480)
png("04_Exploratory_Data_Analysis/plot1.png", width=480, height=480) 
hist(data_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off()