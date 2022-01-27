#   Boxplot Exercises #1

    library(dplyr)
    dat <- InsectSprays
    print(dat)

    A <- filter(dat, spray == "A") %>% select(count) %>% unlist
    B <- filter(dat, spray == "B") %>% select(count) %>% unlist
    C <- filter(dat, spray == "C") %>% select(count) %>% unlist
    D <- filter(dat, spray == "D") %>% select(count) %>% unlist
    E <- filter(dat, spray == "E") %>% select(count) %>% unlist

boxplot(A, B, C, D, E, main = "Insect Sprays", xlab = "Spray", ylab = "Count", names.arg = c("A", "B", "C", "D", "E"))
boxplot(InsectSprays$count ~ InsectSprays$spray)

#   Boxplot Exercises #2
    
    library(dplyr)
    data(nym.2002, package="UsingR")
    dat <- nym.2002
    print(dat)

    male <- filter(dat, gender == "Male") %>% select(time) %>% unlist
    female <- filter(dat, gender == "Female") %>% select(time) %>% unlist

    boxplot(male,female)
    qqnorm(female)
    qqline(female)
    

males <- filter(nym.2002, gender=="Male") %>% select(time) %>% unlist
females <- filter(nym.2002, gender=="Female") %>% select(time) %>% unlist
boxplot(females, males)
hist(females,xlim=c(range( nym.2002$time)))
hist(males,xlim=c(range( nym.2002$time)))

#   Boxplot Exercises #3
    
    library(dplyr)
    dat <- InsectSprays
    print(dat)

boxplot(InsectSprays$count ~ InsectSprays$spray)