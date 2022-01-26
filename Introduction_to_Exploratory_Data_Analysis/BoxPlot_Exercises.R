#   Definir uma condição para a variável spray
    library(dplyr)
    dat <- InsectSprays
    print(dat)

    A <- filter(dat, spray == "A") %>% select(count) %>% unlist
    B <- filter(dat, spray == "B") %>% select(count) %>% unlist
    C <- filter(dat, spray == "C") %>% select(count) %>% unlist
    D <- filter(dat, spray == "D") %>% select(count) %>% unlist
    E <- filter(dat, spray == "E") %>% select(count) %>% unlist

boxplot(split(InsectSprays, f = names(InsectSprays)))
