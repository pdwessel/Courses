a4q1 <- function(x){
 
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        
        if(!file.exists("./data/Idaho.csv")) {
                download.file(fileUrl, destfile="./data/idaho.csv", method="curl")
        }
        dat1 <- read.csv("./data/idaho.csv")
        nm <-  strsplit(names(dat1), "wgtp")
        return(nm[[x]])
}
        