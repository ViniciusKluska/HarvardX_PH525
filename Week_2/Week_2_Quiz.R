# Pre exercise code:

    RNGkind("Mersenne-Twister", "Inversion", "Rejection")

# Question 1

    library(downloader) 
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/femaleControlsPopulation.csv"
    download(url, destfile=filename)
    x <- unlist( read.csv(filename) )

    set.seed(1)
    n <- 1000
    averages50 <- vector("numeric",n)
    for(i in 1:n){
    X <- sample(x,50)
    averages50[i] <- mean(X)
    }
   
    X_AVG <- mean(x)
    averages50_AVG <- mean(averages50)
    averages50_SD <- sd(averages50)
    diff <- averages50 - X_AVG
    gram_1_away <- mean(abs(diff)>1)
    print(gram_1_away)

# Question 2

    library(dplyr)
    library(gapminder)
    data(gapminder)
    head(gapminder)
    dat <- gapminder

    LE_1952 <- filter(dat, year == "1952") %>% select(lifeExp) %>% unlist

    a <- mean(LE_1952 <= "40")
    b <- mean(LE_1952 <= "60")
    answer <- mean(b-a)
    print(answer)