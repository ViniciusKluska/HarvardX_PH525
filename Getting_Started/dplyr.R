# How to use dplyr
    # Install dplyr
    
    #install.packages("dplyr")
    library(dplyr)

# Basic commands
    # Import data

    dat <- read.csv("C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/Data_HarvardX/femaleMiceWeights.csv")
print(dat)

    # Commands
    controls <- filter(dat, Diet=="chow") 
print(controls)
    select(controls, Bodyweight)

    controls <- select(controls, Bodyweight)
    unlist(controls)

    controls <- filter(dat, Diet == "chow") %>% select(Bodyweight) %>% unlist
    avg <- mean(controls)

print(controls)
print(avg)