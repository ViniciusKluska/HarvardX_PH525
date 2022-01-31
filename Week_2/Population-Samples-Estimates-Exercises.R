# Load Data 

    library(downloader) 
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/mice_pheno.csv"
    download(url, destfile=filename)
    dat_rough <- (read.csv(filename))
        # pre exerccise process
        dat_clean <- na.omit(dat)

# Population, Samples, and Estimates Exercises #1

    library(dplyr)
    M_chow_Bodyweight <- filter(dat_clean, Sex == "M" & Diet == "chow") %>% select(Bodyweight) %>% unlist
    M_chow_Bodyweight_AVG <- mean(M_chow_Bodyweight)
    print(M_chow_Bodyweight_AVG)

# Population, Samples, and Estimates Exercises #2

    # install.packages("rafalib") - remove this line if you have already installed the package
    library(rafalib)
    print(popsd(M_chow_Bodyweight))

# Population, Samples, and Estimates Exercises #3

    set.seed(1)
    X <- sample(M_chow_Bodyweight, size=25)
    X_AVG <- mean(X)
    print(X_AVG)

# Population, Samples, and Estimates Exercises #4

    M_hf_Bodyweight <- filter(dat_clean, Sex == "M" & Diet == "hf") %>% select(Bodyweight) %>% unlist
    M_hf_Bodyweight_AVG <- mean(M_hf_Bodyweight)
    print(M_hf_Bodyweight_AVG)

# Population, Samples, and Estimates Exercises #5

    library(rafalib)
    print(popsd(M_hf_Bodyweight))

# Population, Samples, and Estimates Exercises #6

    set.seed(1)
    Y <- sample(M_hf_Bodyweight, size=25)
    Y_AVG <- mean(Y)
    print(Y_AVG)


# Population, Samples, and Estimates Exercises #7

    Y_X <- mean(abs(Y_AVG - X_AVG))
    y_x <- mean(abs(M_hf_Bodyweight_AVG - M_chow_Bodyweight_AVG))
    abs_diff <- abs(y_x - Y_X)
    print(abs_diff)

# Population, Samples, and Estimates Exercises #8

    F_chow_Bodyweight <- filter(dat_clean, Sex == "F" & Diet == "chow") %>% select(Bodyweight) %>% unlist
    F_chow_Bodyweight_AVG <- mean(F_chow_Bodyweight)
    set.seed(2)
    X <- sample(F_chow_Bodyweight, size=25)
    X_AVG <- mean(X)
    F_hf_Bodyweight <- filter(dat_clean, Sex == "F" & Diet == "hf") %>% select(Bodyweight) %>% unlist
    F_hf_Bodyweight_AVG <- mean(F_hf_Bodyweight)
    set.seed(2)
    Y <- sample(F_hf_Bodyweight, size=25)
    Y_AVG <- mean(Y)
    Y_X <- mean(abs(Y_AVG - X_AVG))
    y_x <- mean(abs(F_hf_Bodyweight_AVG - F_chow_Bodyweight_AVG))
    abs_diff <- abs(y_x - Y_X)
    print(abs_diff)