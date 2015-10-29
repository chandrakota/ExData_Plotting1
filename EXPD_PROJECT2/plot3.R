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
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregateTotalEmissionsByYear <- aggregate(Emissions~year+type,subsetNEI,sum)

library(ggplot2)

png('plot3.png')
g <- ggplot(aggregateTotalEmissionsByYear,aes(Emissions,year,col=type))
g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()
