
#Read in the data (assumes that the two files are in a folder 'data')
NEI <- readRDS("data/summarySCC_PM25.rds")
SSC <- readRDS("data/Source_Classification_Code.rds")

#Calculate the total emissions by year for the US
total_emission <- tapply(NEI$Emission, as.factor(NEI$year), sum)
total_emission <- total_emission/1000000 #Scale down

#From the base graphics package use a bar plot
png(file = "plot1.png", width = 480, height = 480, units = "px")
barplot(total_emission, main = "Total US Emissions from all sources (1999 - 2008)", 
        xlab = "Year", ylab = "Total recorded Tonnage of PM2.5 Emissions (Million)", 
        col ="cadetblue3")
dev.off()
