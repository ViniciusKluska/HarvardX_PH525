data(ChickWeight)
head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",direction="wide")

head(chick)
chick = na.omit(chick)

# Mann-Whitney robust to outliers, while t-test is not.
library(dplyr)
x<-chick %>% filter(Diet==1) %>% select(weight.4) %>%unlist
y<-chick %>% filter(Diet==4) %>% select(weight.4) %>%unlist
t.test(x,y)$p.value
wilcox.test(x,y)$p.value
answer_1<-t.test(c(x,200),y)$p.value
answer_2<-wilcox.test(c(x,200),y)$p.value

# possible downside to Mann-Whitney
library(rafalib)
mypar(1,3)
boxplot(x,y)
boxplot(x,y+10)
boxplot(x,y+100)

answer_3<-t.test(x,y+10)$statistic-t.test(x,y+100)$statistic
wilcox.test(x,y+10)$statistic-wilcox.test(x,y+100)$statistic

wilcox.test(c(1,2,3),c(4,5,6))$p.value
wilcox.test(c(1,2,3),c(400,500,600))$p.value

print(answer_1)
print(answer_2)
print(answer_3)