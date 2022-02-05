# Load Data

library(downloader) 

    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/babies.txt"
    download(url, destfile=filename)
    babies <- read.table( filename, header=TRUE)

# Select Data

library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

# Question 1

N<-25
set.seed(1)
dat.ns=sample(bwt.nonsmoke,N)
dat.s=sample(bwt.smoke,N)

X.ns <- mean(dat.ns)
sd.ns <- sd(dat.ns) # note use of sd,not popsd since this is a sample.

X.s <- mean(dat.s)
sd.s <- sd(dat.s)

sd.diff <- sqrt(sd.ns^2/N+sd.s^2/N)

tval <- (X.ns - X.s)/sd.diff
print(tval)

tval<-t.test(dat.s,dat.ns)$statistic
print(tval)

ic <- 2*pt(-abs(tval),48)
print(ic)


print(qt(.995,48)*sd.diff)

# Question 2

    N<-5
    set.seed(1)
    dat.ns=sample(bwt.nonsmoke,N)
    dat.s=sample(bwt.smoke,N)
    tval<-t.test(dat.s,dat.ns)$p.value

print(tval)
