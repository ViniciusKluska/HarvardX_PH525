# Load data base

    library(downloader) 
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/femaleMiceWeights.csv"
    download(url, destfile=filename)
    dat <- (read.csv(filename))
    

# CLT_and_T-distribution-Exercises #1
    
    set.seed(1)
    library(dplyr)
    library(rafalib)

    n=100
    sides <- 6 #harvard sugestion
    p <- 1/sides
    rolls <- replicate(10000, {
        x <- sample(1:sides, size=n, replace=TRUE)
        (mean(x==6) - p) / sqrt(p*(1-p)/n)
    })
    print(mean(abs(rolls)>2))
    
# CLT_and_T-distribution-Exercises #3

    X <- filter(dat, Diet == "chow") %>% select(Bodyweight) %>% unlist
    X_AVG <- mean(X)
    pop_SD <- popsd(X)
    Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist
    Y_AVG <- mean(Y)
    pop_SD <- popsd(Y)
    print(X_AVG)

# CLT_and_T-distribution-Exercises #6

    X <- filter(dat, Diet == "chow") %>% select(Bodyweight) %>% unlist
    Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist
    X_AVG <- mean(X)
    Y_AVG <- mean(Y)
    X_SD <- sd(X)
    Y_SD <- sd(Y)
    print(X_AVG)
    print(Y_AVG)
    print(X_SD)
    print(Y_SD)

# CLT_and_T-distribution-Exercises #7

    a <- X_AVG
    b <- X_AVG+2
    B <- X_AVG-2
    mu <- mean(X)
    sigma <- sd(X)
            pnorm_a <- pnorm(a,mu,sigma)
            pnorm_b_POSITIVE <- pnorm(b,mu,sigma)
            pnorm_b_NEGATIVE <- pnorm(B,mu,sigma)
            defined_integral <- (pnorm_b_POSITIVE)-(pnorm_a)
            defined_integral_2 <- (pnorm_a)-(pnorm_b_NEGATIVE)
            EXERCISE_ANSWER <- 1-(defined_integral+defined_integral_2)

print(pnorm_a)
print(pnorm_b_POSITIVE)
print(pnorm_b_NEGATIVE)
print(defined_integral)
print(EXERCISE_ANSWER)

    # Harvard answer
    
    Harvard_answer <- 2 * ( 1-pnorm(2/sd(X) * sqrt(12) ) )
    print(Harvard_answer)



# CLT_and_T-distribution-Exercises #8

    sigma_x <- sd(X)
    sigma_y <- sd(Y)
    N <- length(X)
    M <- length(Y)
    SE <- sqrt((sigma_y^2/M)+(sigma_x^2/N))
    print(SE)

# CLT_and_T-distribution-Exercises #9

    T_statistcs <- (Y_AVG-X_AVG)/SE
    print(T_statistcs)

# CLT_and_T-distribution-Exercises #10

    righttail <- 1 - pnorm(abs(T_statistcs))
    lefttail <- pnorm(-abs(T_statistcs))
    pval <- lefttail + righttail
    print(pval)

# CLT_and_T-distribution-Exercises #11

    ttest <- t.test(X, Y)
    print(ttest)