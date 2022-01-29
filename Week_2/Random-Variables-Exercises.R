# Load data base

    library(downloader) 
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/femaleControlsPopulation.csv"
    download(url, destfile=filename)
    x <- unlist( read.csv(filename) )

# Correct RNG - not kidding
    
    RNGkind("Mersenne-Twister", "Inversion", "Rejection")

# Random Variables Exercises #1

    avg_population <- mean(x)
    print(mean(x))

# Random Variables Exercises #2

    set.seed(1)
    avg_sample_1 <- mean(sample(x, size=5))
    answer_2 <- abs(avg_sample_1 - avg_population)
    print(answer_2)

# Random Variables Exercises #3

    set.seed(5)
    avg_sample_2 <- mean(sample(x, size=5))
    answer_3 <- abs(avg_sample_2 - avg_population)
    print(answer_3)