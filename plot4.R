Sys.setlocale("LC_TIME", "C")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
dates<-c("1/2/2007","2/2/2007")
dataInRange <- data[data$Date == dates,]
rm(data)

dataInRange$Date <- as.Date(dataInRange$Date, format="%d/%m/%Y")
dataInRange$DateTime <- as.POSIXct(paste(as.Date(dataInRange$Date), dataInRange$Time), tz="GMT")

png("plot4.png", height=480, width=480)

par(mfrow=c(2,2))
with(dataInRange, {
    plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
    plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")
    plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(DateTime, Sub_metering_2,col='red')
    lines(DateTime, Sub_metering_3,col='blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")
})

dev.off()