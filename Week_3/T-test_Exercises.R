# Load data

    library(downloader) 
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/babies.txt"
    download(url, destfile=filename)
    babies <- read.table( filename, header=TRUE)

# Selecting data

    library(dplyr) #ALWAYS LOAD THIS LIBRARY
    bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
    bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

# Basic statistcs

    library(rafalib)
    diff_AVG <- mean(bwt.nonsmoke)-mean(bwt.smoke)
    nonsmoke_sd <- popsd(bwt.nonsmoke)
    smoke_sd <- popsd(bwt.smoke)

    print(diff_AVG)
    print(nonsmoke_sd)
    print(smoke_sd)

# Question 1

    set.seed(1)
    n <- 25
    bwt.nonsmoke_sample <- sample(bwt.nonsmoke,n)
    bwt.smoke_sample <- sample(bwt.smoke,n)

    # Calculate the t-statistic: MODE 1

        tval <- t.test(bwt.nonsmoke_sample, bwt.smoke_sample)$statistic
    
    print(tval)

    # Calculate the t-statistic: MODE 2
        
        X_ns <- mean(bwt.nonsmoke_sample)
        X_s <- mean(bwt.smoke_sample)
        sd_ns <- sd(bwt.nonsmoke_sample)
        sd_s <- sd(bwt.smoke_sample)
        N <- length(bwt.nonsmoke_sample)
        M <- length(bwt.smoke_sample)
        sd_diff <- sqrt((sd_s^2/M)+(sd_ns^2/N))
        T_statistcs <- (X_ns-X_s)/sd_diff

    print(T_statistcs)

# Question 2

    pval <- 1-(pnorm(abs(tval))-pnorm(-abs(tval)))
    print(pval)