# Pre exercise instructions:
    # 1. Download the data file from the following link: http://courses.edx.org/c4x/HarvardX/PH525.1x/asset/skew.RData
        
        library(downloader) 
        url <- "http://courses.edx.org/c4x/HarvardX/PH525.1x/asset/skew.RData"
        filename <- "skew.RData"
        destfile <- "C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/Data_HarvardX/skew.RData"
        #download(url, destfile) (remove "#" to download the file)

    # 2. Load the data file into R using the following command: dat <- load("C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/Data_HarvardX/skew.RData")
        
        load("C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/Data_HarvardX/skew.RData")
        dim(dat) 

    # 3. Create a data frame called "skew" using the following command: skew <- data.frame(dat)

        skew <- data.frame(dat)
        dim(skew)

print(dim(skew))

    # 4. for loop to calculate the skewness of each column in the data frame.

        par(mfrow = c(3,3))
        for (i in 1:9) {
            qqnorm(skew[,i], main = paste("Skewness of column ", i, ": ", skew$names[i]), xlab = "Skewness", ylab = "Frequency")
        }