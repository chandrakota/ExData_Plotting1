## Select summarySCC_PM25.rds file from the directory path 
## NEI - National Emission Information

if(!exists(NEI)) {
  NEI <- readRDS(file.choose())
}


## Select Source_Classification_Code.rds file from the directory path
## SCC - Source Classification Code

if(!exists(SCC)){
  SCC <- readRDS(file.choose())
}

aggregateTotalEmissionsByYear <- aggregate(Emissions~year,NEI,sum)

png('plot1.png')
barplot(height=aggregateTotalEmissionsByYear$Emissions, names.arg=aggregateTotalEmissionsByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()