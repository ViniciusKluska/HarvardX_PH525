# Power Calcularions Exercises

    ## POWER CALCULATIONS

library(downloader)
    
    url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
    filename <- "C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/babies.txt"
    download(url, destfile=filename)
    babies <- read.table( filename, header=TRUE)

library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

numTrials<-10000
N<-5
set.seed(1)
reject <- function(N, alpha=0.05){
  dat.ns=sample(bwt.nonsmoke,N) 
  dat.s=sample(bwt.smoke,N)
  pval<-t.test(dat.s,dat.ns)$p.value
  pval < alpha
}
rejections <- replicate(numTrials,reject(N))
proportions <- mean(rejections)

numTrials<-10000
Ns<-c(30,60,90,120)
set.seed(1)
power<-sapply(Ns,function(N){
  rejections<-replicate(numTrials,reject(N))
  mean (rejections)
  })

plot(Ns,power,type="b")

print(proportions)
print(power)