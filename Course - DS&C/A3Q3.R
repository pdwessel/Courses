A3Q3 <- function() {
        
        library(dplyr)
        
        fileUrl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        fileUrl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
        
        if(!file.exists("./data/a3q3a.csv")) {
                download.file(fileUrl1,destfile="./data/a3q3a.csv",method="curl")
        }
        if(!file.exists("./data/a3q3b.csv")) {
                download.file(fileUrl2,destfile="./data/a3q3b.csv",method="curl")
        }
        Adata = read.csv("./data/a3q3a.csv", stringsAsFactors = FALSE)
        Bdata = read.csv("./data/a3q3b.csv", stringsAsFactors = FALSE)
        
        Adata <- Adata %>% select(GDP = Gross.domestic.product.2012, ID = X) %>% mutate(GDP = strtoi(GDP)) %>% select(ID, GDP) %>% filter(GDP > 0)
        #BData <- select(Bdata, CountryCode)

        #return(Adata)
        return(merge(Adata, Bdata, by.x="ID", by.y="CountryCode", all=FALSE))
        
               
}