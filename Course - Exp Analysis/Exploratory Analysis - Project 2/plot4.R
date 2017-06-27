
#Read in the data (assumes that the two files are in a folder 'data')
if(!exists("NEI")) {
    NEI <- readRDS("data/summarySCC_PM25.rds") }
if(!exists("SSC")) {
    SSC <- readRDS("data/Source_Classification_Code.rds") }

#Pick out the SCC Codes which contian a reference to Coal *I check column 3, 9, 10 and found column 3 to have the most instances 
#and incorpated the all instances of the other columns as well
c0 <- grepl("[cC]oal", SSC[,3])
Coalcodes = SSC[c0,1]

#Subset the data corresponding to Coal
CoalData <- subset(NEI, SCC %in% Coalcodes)
CoalEmissions <- with(CoalData, tapply(Emissions, year, sum))
CoalEmissions <- CoalEmissions/1000

#Plot the results
png(file = "plot4.png", height = 480, width = 480, units = "px")

barplot(CoalEmissions, main = "Total Emissions from Coal (1999-2008)", 
        xlab = "Year", ylab = "Recorded Tonnage of PM2.5 Emissions ('000)", col = "dodgerblue")

dev.off()