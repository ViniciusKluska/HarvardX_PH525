# Getting Started: Exercises
#--------------------------------
# Open R using radian (only for those who use radian)

# Get Data - Using downloader package - delete teh "#" to use the code :)

    install.packages("downloader")
    library(downloader) 
    #url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
    #filename <- "femaleMiceWeights.csv" 
    #download(url, destfile=filename)

# Getting Started Exercises #1
    #Read in the file femaleMiceWeights.csv and report the exact name of the column containing the weights.

    dat <- read.csv("C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/femaleMiceWeights.csv")

print(dat)

# Getting Started Exercises #2
    #The [ and ] symbols can be used to extract specific rows and specific columns of the table. What is the entry in the 12th row and second column?

    answer_2 <- dat[12,2]

print(answer_2)

# Getting Started Exercises #3
    #You should have learned how to use the $ character to extract a column from a table and return it as a vector. Use $ to extract the weight column and report the weight of the mouse in the 11th row.

    answer_3 <- dat$Bodyweight[11]

print(answer_3)

# Getting Started Exercises #4
    #The length() function returns the number of elements in a vector. How many mice are included in our dataset?

    answer_4 <- length(dat$Bodyweight)

print(answer_4)

# Getting Started Exercises #5
    #To create a vector with the numbers 3 to 7, we can use seq(3,7) or, because they are consecutive, 3:7. View the data and determine what rows are associated with the high fat or hf diet. Then use the mean() function to compute the average weight of these mice. What is the average weight of mice on the high fat diet?

    answer_5 <- mean(dat$Bodyweight[13:24])

print(answer_5)

# Getting Started Exercises #6
    # One of the functions we will be using often is sample(). Read the help file for sample() using ?sample. Now take a random sample of size 1 from the numbers 13 to 24 and report back the weight of the mouse represented by that row. Make sure to type set.seed(1) to ensure that everybody gets the same answer.

                set.seed(1)
    answer_6 <- sample(13:24, size=1, replace=FALSE)

print(answer_6)