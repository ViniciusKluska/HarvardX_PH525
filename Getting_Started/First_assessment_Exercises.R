# First assessment: Exercises
#--------------------------------
# Open R using radian (only for those who use radian)

# Installing and loading "swirl"

    install.packages("swirl")
    library(swirl)

# Exercise #2
    #Create a numeric vector containing the numbers 2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23.

    X1=c(2.23,3.45,1.87,2.11,7.33,18.34,19.23)    
    AVG=mean(X1)

print(AVG)

# Exercise #3
    #Use a for loop to determine the value of SUM (i=1 to 25) of i^2

    n = 25
    x = rep(0,n)
    for(i in 1:n)
    {x[i] = i^2}
    X2=sum(x)

print(X2)

# Exercise #7
    # The simplest way to extract the columns of a matrix or data.frame is using [. For example you can access the second column with cars[,2].
        #What is the average distance traveled in this dataset?

    X3 = mean(cars[,2])

print(X3)

# Exercise #8
    #Familiarize yourself with the which() function. Which row of cars has a a distance of 85?

    X4 = which (cars$dist == 85)

print(X4)