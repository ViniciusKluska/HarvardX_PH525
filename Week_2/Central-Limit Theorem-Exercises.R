# Load Data 

    library(downloader) 
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/mice_pheno.csv"
    download(url, destfile=filename)
    dat_rough <- (read.csv(filename))
        # pre exerccise process
        dat_clean <- na.omit(dat_rough)

# Central-Limit-Theorem-Exercises #1

    print(pnorm(1)-pnorm(-1))

# Central-Limit-Theorem-Exercises #2

    print(pnorm(2)-pnorm(-2))

# Central-Limit-Theorem-Exercises #3

    print(pnorm(3)-pnorm(-3))

# Central-Limit-Theorem-Exercises #4

    library(dplyr)
    library(rafalib)
    M_chow_Bodyweight <- filter(dat_clean, Sex == "M" & Diet == "chow") %>% select(Bodyweight) %>% unlist
    M_chow_Bodyweight_AVG <- mean(M_chow_Bodyweight)
    pop_SD <- popsd(M_chow_Bodyweight)
    z <- (M_chow_Bodyweight - M_chow_Bodyweight_AVG) / pop_SD
    print(mean(abs(z)<=1))

# Central-Limit-Theorem-Exercises #5

    print(mean(abs(z)<=2))

# Central-Limit-Theorem-Exercises #6

    print(mean(abs(z)<=3))

# Central-Limit-Theorem-Exercises #8

    set.seed(1)
    avgs <- replicate(10000, mean(sample(M_chow_Bodyweight, size=25)))
    mypar(1,2)
    print(mean(avgs))
    print(popsd(avgs))