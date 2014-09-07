data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringAsFactor=FALSE)
dates<-c("1/2/2007","2/2/2007")
dataInRange <- data[data$Date == dates,]
rm(data)

dataInRange$Date <- as.Date(dataInRange$Date, format="%d/%m/%Y")
dataInRange$DateTime <- as.POSIXct(paste(as.Date(dataInRange$Date), dataInRange$Time), tz="GMT")

png("plot2.png", height=480, width=480)

par(mfrow=c(1,1))
with(dataInRange, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()