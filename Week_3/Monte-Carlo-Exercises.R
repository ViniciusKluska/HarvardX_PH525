# Monte Carlo Exercise 1

set.seed(1)
n<-5
B<-1
ttestgenerator <- function(n) {
  X<-rnorm(n)
  tstat<-sqrt(n)*mean(X)/sd(X)
  return(tstat)
}
ttests <- replicate(B, ttestgenerator(n))

print(ttests)

# Monte Carlo Exercise 2

set.seed(1)
n<-5
B<-1000
ttestgenerator <- function(n) {
  X<-rnorm(n)
  tstat<-sqrt(n)*mean(X)/sd(X)
  return(tstat)
}
ttests <- replicate(B, ttestgenerator(n))

print(mean(ttests>2))

ps = seq(1/(B+1), 1-1/(B+1),len=B)
qs = qt(ps,df=n-1)
qsn =qnorm(ps)
mypar(1,2)
qqplot(qs,ttests)
abline(0,1)
qqplot(qsn,ttests)
abline(0,1)

library(rafalib)
mypar(3,2)

Ns<-seq(5,30,5)
B <- 1000
mypar(3,2)
LIM <- c(-4.5,4.5)
for(N in Ns){
  ts <- replicate(B, {
    X <- rnorm(N)
    sqrt(N)*mean(X)/sd(X)
  })
  ps <- seq(1/(B+1),1-1/(B+1),len=B)
  qqplot(qt(ps,df=N-1),ts,main=N,
         xlab="Theoretical",ylab="Observed",
         xlim=LIM, ylim=LIM)
  abline(0,1)
} 

Ns<-seq(5,30,5)
B <- 1000
mypar(3,2)
LIM <- c(-4.5,4.5)
for(N in Ns){
  tstats <- replicate(B, {
    X1 <- rnorm(N)
    X2 <- rnorm(N)
    t.test(X1,X2,var.equal=TRUE)$stat
  })
  ps <- seq(1/(B+1),1-1/(B+1),len=B)
  qqplot(qt(ps,df=2*N-2),tstats,main=N,
         xlab="Theoretical",ylab="Observed",
         xlim=LIM, ylim=LIM)
  abline(0,1)
} 

set.seed(1)
N <- 15
B <- 10000
tstats <- replicate(B,{
  X <- sample(c(-1,1), N, replace=TRUE)
  sqrt(N)*mean(X)/sd(X)
})
ps=seq(1/(B+1), 1-1/(B+1), len=B) 
qqplot(qt(ps,N-1), tstats, xlim=range(tstats))
abline(0,1)
#The population data is not normal thus the theory does not apply.
#We check with a Monte Carlo simulation. The qqplot shows a large tail. 
#Note that there is a small but positive chance that all the X are the same.
##In this case the denominator is 0 and the t-statistics is not defined

set.seed(1)
N <- 1000
B <- 10000
tstats <- replicate(B,{
  X <-  sample(c(-1,1), N, replace=TRUE)
  sqrt(N)*mean(X)/sd(X)
})
qqnorm(tstats)
abline(0,1)
#With N=1000, CLT kicks in and the t-statistic is approximated with normal 0,1
##Furthermore, t-distribution with df=999 and normal are practically the same.

mypar(3,2)
set.seed(1)
Ns <- seq(5,45,5)
library(rafalib)
mypar(3,3)
for(N in Ns){
  medians <- replicate(10000, median ( rnorm(N) ) )
  title <- paste("N=",N,", avg=",round( mean(medians), 2) , ", sd*sqrt(N)=", round( sd(medians)*sqrt(N),2) )
  qqnorm(medians, main = title )
  qqline(medians)
}
##there is an asymptotic result that says SD is sqrt(N*4*dnorm(0)^2)