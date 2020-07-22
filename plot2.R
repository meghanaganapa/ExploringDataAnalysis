library(datasets)

data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
retval <- subset(data,Date %in% c("1/2/2007","2/2/2007"))
retval$Date <- as.Date(retval$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(retval$Date), retval$Time)
retval$Datetime <- as.POSIXct(datetime)
png("plot2.png", width=480, height=480)
with(retval,plot(as.numeric(as.character(Global_active_power))~Datetime,type="l", xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()

