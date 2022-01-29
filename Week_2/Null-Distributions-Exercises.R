# Load data base

    library(downloader) 
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/femaleControlsPopulation.csv"
    download(url, destfile=filename)
    x <- unlist(read.csv(filename))
    population <- unlist(x)

# Null Distributions Exercises #1
    
    set.seed(1)
    
    n <- 1000
    averages5 <- vector("numeric",n)
    for(i in 1:n) {
        X <- sample(population, size=5)
        averages5[i] <- mean(X)
    }
    print(hist(averages5))
    pop_average <- mean(abs(population - mean(x))>1)

    print(pop_average)

# Null Distributions Exercises #2

    set.seed(1)
    
    n <- 10000
    averages5 <- vector("numeric",n)
    for(i in 1:n) {
        X <- sample(x, size=5)
        averages5[i] <- mean(X)
    }
    hist(averages5)
    
        pop_average <- mean(abs(averages5 - mean(x))>1)

    print(pop_average)