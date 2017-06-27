#Load packages
library(ggplot2)
library(dplyr)

#Read in the data (assumes that the two files are in a folder 'data')
if(!exists("NEI")) {
  NEI <- readRDS("data/summarySCC_PM25.rds") }
if(!exists("SSC")) {
  SSC <- readRDS("data/Source_Classification_Code.rds") }

#Select the motor vehicle's, it took some experimenting to figure out which column best represented motor vehicles.
m0 <- grepl("[vV]eh", SSC[,3])
VehicleCodes = SSC[m0,1]

#Subset out the Emissions data with relevant SCC Codes
VehData <- subset(NEI, SCC %in% VehicleCodes)

#Subset the Baltimore City and LA data
BLData <- subset(VehData,fips %in% c("24510", "06037"))

#Group and summarize vehicle emissions
BLVeh <- BLData %>% group_by(fips, year) %>% summarize(Emissions = sum(Emissions))

#Plot the results
png(file = "plot6.png", height = 480, width = 480, units = "px")

p6 <- ggplot(BLVeh, aes(x = as.factor(year), y = Emissions, group = fips, colour = fips, shape = fips))
p6 <- p6 + geom_line(lwd = 1) + geom_point(cex = 3)
p6 <- p6 + scale_shape_discrete(name = "City", breaks = c("24510","06037"), labels = c("Baltimore", "L.A."))
p6 <- p6 + scale_colour_discrete(name = "City", breaks = c("24510","06037"), labels = c("Baltimore", "L.A."))
p6 <- p6 + labs(x = "Year", y = "PM2.5 Emissions (Ton)", title = "Motor Vehicle Emissions - Baltimore & L.A. (1999-2008)")
print(p6)

dev.off()
