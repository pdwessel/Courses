
#Read in the data (assumes that the two files are in a folder 'data')
NEI <- readRDS("data/summarySCC_PM25.rds")
SSC <- readRDS("data/Source_Classification_Code.rds")

#Subset the data to the desired area
BaltData <- subset(NEI, fips=="24510")

#Caluclate total emissions in Baltimare from all sources
BaltEmissions <- tapply(BaltData$Emission, as.factor(BaltData$year), sum)


#From the base graphics package use a bar plot
png(file = "plot2.png", width = 480, height = 480, units = "px")
barplot(BaltEmissions, main = "Total Emissions from Baltimore City (1999-2008)", 
        xlab = "Year", ylab = "Recorded Tonnage of PM2.5 Emissions", col = "cadetblue3")

dev.off()
