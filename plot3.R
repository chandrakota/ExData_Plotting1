electricData <- read.table(file.choose(),header = T,sep=";",stringsAsFactors=FALSE)
subElectricData <- electricData[electricData$Date %in% c("1/2/2007","2/2/2007"),]


datetime <- strptime(paste(subElectricData$Date, subElectricData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subElectricData$Global_active_power)

subMetering1 <- as.numeric(subElectricData$Sub_metering_1)
subMetering2 <- as.numeric(subElectricData$Sub_metering_2)
subMetering3 <- as.numeric(subElectricData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime,subMetering1,type="l",ylab="Energy Sub metering",xlab="")
lines(datetime,subMetering2,type = "l",col="red")
lines(datetime,subMetering3,type = "l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()


?read.table
