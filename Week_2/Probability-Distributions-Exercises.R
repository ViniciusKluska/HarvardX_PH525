# Pre exercise

    #install.packages("gapminder")
    #install.packages("ggplot2")

    library(gapminder)
    library(ggplot2)
    library(dplyr)

    # Load the data

    data(gapminder)
    dat <- gapminder
    print(head(gapminder))
        LE_1952 <- filter(dat, year == "1952") %>% select(lifeExp) %>% unlist
    
    print(LE_1952)
    hist(LE_1952, breaks=20)

# Null Distributions Exercises #1

    print(mean(LE_1952 <= "40"))

# Null Distributions Exercises #2

    q <- 40
    prop = function(q) {
    mean(LE_1952 <= q)
    }
    print(prop(q))
    
    qs = seq(from=min(x), to=max(x), length=20)
    print(qs)
    props <- sapply(qs, prop)
        props = sapply(qs, function(q) mean(x <= q)) #shortened version of the above
    plot(qs, props, type="l", xlab="Life Expectancy", ylab="Proportion")
    plot(ecdf(LE_1952), xlab="Life Expectancy", ylab="Proportion", main="Life Expectancy Distribution")