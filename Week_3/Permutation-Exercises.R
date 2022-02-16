## PERMUTATIONS
library(downloader)
library(dplyr)
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/babies.txt"
    download(url, destfile=filename)
    babies <- read.table( filename, header=TRUE)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

N=10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- mean(smokers) - mean(nonsmokers)

dat <- c(smokers,nonsmokers)
set.seed(1)
null <- replicate(1000, {
  shuffle <- sample(dat)
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  return(mean(smokersstar)-mean(nonsmokersstar))
})
hist(null)
abline(v=obs, col="red", lwd=2)

#the proportion of permutations with larger difference
print(sum(abs(null) >= abs(obs)) + 1) / (length(null) + 1)


# Repeat the above exercise, but instead of the differences in mean, consider the differences
# in median obs <- median(smokers) - median(nonsmokers). What is the permutation based p-value?

N=10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- median(smokers) - median(nonsmokers)


set.seed(1)
null <- replicate(1000, {
  dat <- c(smokers,nonsmokers)
  shuffle <- sample(dat)
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  return(median(smokersstar)-median(nonsmokersstar))
})
hist(null)
abline(v=obs, col="red", lwd=2)

#the proportion of permutations with larger difference
print(sum(abs(null) >= abs(obs)) + 1) / (length(null) + 1)
print(sum(abs(null) >= abs(obs))) / (length(null))
