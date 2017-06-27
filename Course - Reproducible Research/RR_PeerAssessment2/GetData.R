#Code to download the data for Course Project 2 - Reproducible Research

#Step 1 - Create a file to download the data to
if (!dir.exists("data")) {
        dir.create("data")
}

#Step 2 - Download the data
fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
destfile <- "data/Stormdata.csv.bz2"

if (!file.exists(destfile)) { 
        download.file(fileurl, destfile)
}

#Step 3 - Read in the data

RawData <- read.csv(destfile)
print(head(RawData))
