# dplyr Exercises
    # Data

    library(dplyr)
    library(downloader)
    url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
    filename <- basename(url)
    #download(url,filename)
    dat <- read.csv("C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/Data_HarvardX/msleep_ggplot2.csv")

print(dat)

# dplyr Exercises #1
    X1 <- class(dat)
    print(X1)

# dplyr Exercises #2
    X2 <- filter(dat, order == "Primates")
    print(nrow(X2))
    
# dplyr Exercises #3
    print(class(X2))

# dplyr Exercises #4
    X3 <- select(X2, sleep_total)
    print(class(X3))

# dplyr Exercises #5
    X4 <- select(X2, sleep_total) %>% unlist %>% mean
    print(X4)

# dplyr Exercises #6
    X5 <- select(X2, sleep_total) %>% summarize(mean=mean(sleep_total))
    print(X5)