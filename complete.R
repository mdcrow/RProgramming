#getwd()
#setwd("U:/Data Tools/R Code/RTraining/RProgramming/Prgrm_Assign_1")

#dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
#download.file(dataset_url, "specdata.zip")
#unzip("specdata.zip", exdir = "Prgrm_Assign_1")


complete <- function(directory,id = 1:332)      {
        files_list <- list.files("specdata", full.names=TRUE)    #creates a list of files
        dat <- data.frame()                                     #creates an empty data frame
        for (i in id)   {
                file <- read.csv(files_list[i])
                cleanfile <- file[complete.cases(file),]
                nobs <- nrow(cleanfile)
                df <- data.frame(i,nobs)
                dat <- rbind(dat, df)
        }
        names(dat)<-c("id","nobs")
        return(dat)
}
