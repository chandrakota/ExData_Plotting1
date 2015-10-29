electricData <- read.table(file.choose(),header = T,sep=";",stringsAsFactors=FALSE)
subElectricData <- electricData[electricData$Date %in% c("1/2/2007","2/2/2007"),]


datetime <- strptime(paste(subElectricData$Date, subElectricData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subElectricData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
