library(datasets)

data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
retval <- subset(data,Date %in% c("1/2/2007","2/2/2007"))
newXa <- sapply(retval$Global_active_power, as.numeric)
hist(newXa, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=480, height=480)
dev.off()
