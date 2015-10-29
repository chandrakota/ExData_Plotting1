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

motorVehicleMatches  <- grep("[Mm]otor [Vv]ehicle", NEISCC$Short.Name)

subsetNEISCC <- NEISCC[motorVehicleMatches, ]
subsetNEIMotorVehicleByCity <- subsetNEISCC[subsetNEISCC$fips=="24510" | subsetNEISCC$fips=="06037",]
subsetNEIMotorVehicleByCity$fips[subsetNEIMotorVehicleByCity$fips=="24510"] <- "Baltimore, MD"
subsetNEIMotorVehicleByCity$fips[subsetNEIMotorVehicleByCity$fips=="06037"] <- "Los Angeles, CA"

aggregatedTotalByCity <- aggregate(Emissions ~ year+fips, subsetNEIMotorVehicleByCity, sum)



png("plot6.png", width=800, height=480)
g <- ggplot(aggregatedTotalByCity, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Motor Vehicles in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')

g <- g + facet_grid(.~fips)
print(g)
dev.off()


