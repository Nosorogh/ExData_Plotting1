data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
dates<-c("1/2/2007","2/2/2007")
dataInRange <- data[data$Date == dates,]

png("plot1.png", height=480, width=480)
par(mfrow=c(1,1))
hist(dataInRange$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()