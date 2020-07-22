library(datasets)

data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
retval <- subset(data,Date %in% c("1/2/2007","2/2/2007"))
retval$Date <- as.Date(retval$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(retval$Date), retval$Time)
retval$Datetime <- as.POSIXct(datetime)
png("plot3.png", width=480, height=480)
plot(as.numeric(as.character(retval$Sub_metering_1))~retval$Datetime,type="l", xlab="",ylab="Energy sub metering",col="black")
lines(as.numeric(as.character(retval$Sub_metering_2))~retval$Datetime,type="l",col="red")
lines(as.numeric(as.character(retval$Sub_metering_3))~retval$Datetime,type="l",col="blue")
legend('topright','groups'
       ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1,
       col=c('black','red','blue'))

dev.off()
