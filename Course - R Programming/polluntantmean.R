pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        sum = 0
        count = 0
        
        #read all the file names into a vector my_files
        my_files <- list.files(path = directory, pattern = "*.csv")
        my_files <- paste(directory, "/",my_files, sep = "")
        
        #read each file and calaculate the mean for specificed pollutant
        for (i in id) {
                data <- read.csv(my_files[i])
                sum <- sum + sum(data[[pollutant]], na.rm = TRUE)
                count <- count + length(which(!is.na(data[[pollutant]])))
        }
                
        pol_mean <- sum/count
        return(pol_mean)
                
}

