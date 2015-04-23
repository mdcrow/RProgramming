pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE)
  #files_list <- list.files(c("C:/Users/pc/Documents/RTraining/Coursera/R_Programming/Prgrm_Assign_1/",directory), full.names=TRUE)
  dat <- data.frame()
  for (i in id){
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[, pollutant]
  mean(dat_subset, na.rm=TRUE)
}