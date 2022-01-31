# Load Data 

    library(downloader) 
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/femaleControlsPopulation.csv"
    download(url, destfile=filename)
    x <- unlist(read.csv(filename))
    population <- unlist(x)

# pre exerccise process

    # make averages5
        set.seed(1)
        n <- 1000
        averages5 <- vector("numeric",n)
        for(i in 1:n){
        X <- sample(x,5)
        averages5[i] <- mean(X)
        }

    # make averages50
        set.seed(1)
        n <- 1000
        averages50 <- vector("numeric",n)
        for(i in 1:n){
        X <- sample(x,50)
        averages50[i] <- mean(X)
        }

# Normal Distribution Exercises #1

    #hist(averages5)
    #hist(averages50)

# Normal Distribution Exercises #2

    # define lenght of integral
        #Ugly but works
        a <- 23
        b <- 25
    averages50_a <- mean(abs(a<averages50))
    averages50_b <- mean(abs(b>averages50))
    defined_integral_Ugly <- 1-(2-(averages50_a+averages50_b))
        #better way
    defined_integral_beauty <- mean(averages50 < b & averages50 > a)


    print(defined_integral_Ugly)
    print(defined_integral_beauty)

# Normal Distribution Exercises #3

    # define lenght of integral
        # Perferct way - (a and b are the "cutoff points")
        a <- 23
        b <- 25
        mu <- mean(averages50)
        sigma <- sd(averages50)
        pnorm_a <- pnorm(a,mu,sigma)
        pnorm_b <- pnorm(b,mu,sigma)
        defined_integral_example <- (pnorm_b)-(pnorm_a)
print(pnorm_a)  
print(pnorm_b)
print(defined_integral_example)

    # define lenght of integral
        # Exercise indeed
        a <- 23
        b <- 25
        mu <- 23.9
        sigma <- 0.43
        pnorm_a <- pnorm(a,mu,sigma)
        pnorm_b <- pnorm(b,mu,sigma)
        defined_integral_exercise <- (pnorm_b)-(pnorm_a)
print(pnorm_a)
print(pnorm_b)
print(defined_integral_exercise)