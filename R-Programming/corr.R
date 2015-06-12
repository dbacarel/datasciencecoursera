"
Daniele Bacarella 
R Programming
Programming Assignment 1
corr.R
12/06/2015
"
source("complete.R")

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    corr_list = vector()
    filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
    df_files <- lapply(filenames,read.csv)
    
    for(df in df_files){
        #Complete cases satisfy threashold?
        cp <-sum(complete.cases(df))
            if(cp>=threshold){
                
                
                #Obtain complete case rows
             
                
                #str(complete_case_rows)
                #Calculate correlation
                corr <- cor(df$sulfate, df$nitrate,"pairwise.complete.obs")
                #print(corr)
                #Add correlation list for this monitor location
                corr_list <- c(corr_list, corr)
            }
    }
    
    corr_list
    
}