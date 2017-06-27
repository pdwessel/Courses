baltdata <- function(url = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD", 
                     destfile = "./data/cameras.xlsx") {
 
        if (!file.exists("data")) {dir.create("data")}
        download.file(url, destfile, method = "wininet")
        dataDownloaded <- data()
               
}