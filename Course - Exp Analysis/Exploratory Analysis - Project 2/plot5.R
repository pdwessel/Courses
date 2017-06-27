
#Read in the data (assumes that the two files are in a folder 'data')
if(!exists("NEI")) {
  NEI <- readRDS("data/summarySCC_PM25.rds") }
if(!exists("SSC")) {
  SSC <- readRDS("data/Source_Classification_Code.rds") }

#Select the motor vehicle's, it took some experimenting to figure out which column best represented motor vehicles.
m0 <- grepl("[vV]eh", SSC[,3])
VehicleCodes = SSC[m0,1]

#Subset out the Emissions data with relevant SCC Codes and in Baltimore
VehData <- subset(NEI, SCC %in% VehicleCodes)
BaltData <- subset(VehData,fips=="24510") 
BaltVeh <- with(BaltData, tapply(Emissions, year, sum))


#Plot the results
png(file = "plot5.png", height = 480, width = 480, units = "px")

barplot(BaltVeh, main = "PM2.5 Emissions from motor vehicles in Baltimore (1999-2008)", 
        xlab = "Year", ylab = "Recorded Tonnage of PM2.5 Emissions", col = "dodgerblue")

dev.off()