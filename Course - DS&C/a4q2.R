a4q2 <- function(){
        
        library(dplyr)
        
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        
        if(!file.exists("./data/GDP.csv")) {
                download.file(fileUrl, destfile="./data/GDP.csv", method="curl")
        }
        dat2 = read.csv("./data/GDP.csv", stringsAsFactors = FALSE)
        
        #For Q2
        dat3 <- select(dat2, Rank = Gross.domestic.product.2012, GDP = X.3)
        dat3 <- dat3 %>% mutate(Rank = strtoi(Rank)) %>% filter(Rank>0)
        dat3$GDP <- as.numeric(gsub(",", "", dat3$GDP))
        #return(mean(dat3$GDP))
        
        #For Q3
        dat4 <- select(dat2, CountryName = X.2)
        
        return(dat4)
}
