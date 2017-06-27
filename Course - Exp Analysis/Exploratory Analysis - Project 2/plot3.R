
#Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

#Read in the data (assumes that the two files are in a folder 'data')
NEI <- readRDS("data/summarySCC_PM25.rds")
SSC <- readRDS("data/Source_Classification_Code.rds")

#Subset the data to the desired area
BaltData <- subset(NEI, fips=="24510")

#Calculate the emissions from each source for each year
BaltDataType <- BaltData %>% group_by(type, year) %>% summarize(Emissions = sum(Emissions))

#Plot using ggplot
png(file = "plot3.png", height = 480, width = 480, units = "px")


p1 <- ggplot(BaltDataType, aes(as.factor(year), Emissions))
p1 <- p1 + geom_bar(stat = "identity") + facet_wrap(~ type, nrow = 2) + labs(x = "Year", y = "Emissions (Tons)", title = "Baltimore City Emission by source (1999-2008)")
print(p1)

dev.off()
                                                                             