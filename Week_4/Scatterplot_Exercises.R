library(dplyr)
data(nym.2002, package="UsingR")
males <- filter(nym.2002, gender=="Male")
females <- filter(nym.2002, gender=="Female")

CorMales<-cor(males$age,males$time)
CorFemales<-cor(females$age,females$time)

library(rafalib)
mypar(2,2)
plot(females$age, females$time)
plot(males$age, males$time)
group <- floor(females$age/5) * 5
boxplot(females$time~group)
group <- floor(males$age/5) * 5
boxplot(males$time~group)

print(CorMales)
print(CorFemales)