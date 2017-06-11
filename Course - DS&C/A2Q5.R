A2Q5 <- function() {
        
        file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
        
        wid<- c(15,4,4,9,4,9,4,9,4)
        dat <- read.fwf(file,wid,skip=4)
        head(dat)
        sum(dat$V4)

}