## Select summarySCC_PM25.rds file from the directory path 
## NEI - National Emission Information

if(!exists("NEI")) {
  NEI <- readRDS(file.choose())
}


## Select Source_Classification_Code.rds file from the directory path
## SCC - Source Classification Code

if(!exists("SCC")){
  SCC <- readRDS(file.choose())
}

if(!exists("NEISCC")){
  NEISCC <- merge(NEI,SCC,by = "SCC")
}
library(ggplot2)

motorVehicleMatches  <- grep("Motor Vehicle", NEISCC$Short.Name)

subsetNEISCC <- NEISCC[motorVehicleMatches, ]
subsetNEIBaltimoreCity <- subsetNEISCC[subsetNEISCC$fips=="24510",]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEIBaltimoreCity, sum)



png("plot5.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Motor Vehicles from 1999 to 2008')
print(g)
dev.off()


