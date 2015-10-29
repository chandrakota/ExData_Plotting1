electricData <- read.table(file.choose(),header = T,sep=";",stringsAsFactors=FALSE)
subElectricData <- electricData[electricData$Date %in% c("1/2/2007","2/2/2007"),]

globalAvtivePower <- as.numeric(subElectricData$Global_active_power)
png("plot1.png",width = 480,height = 480)
hist(globalAvtivePower,col=2,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
