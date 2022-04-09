data(ChickWeight)
head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)

chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")
head(chick)
chick = na.omit(chick)

# add an outlier to day 4 and see its effect:
summary(chick$weight.4)
summary(c(chick$weight.4,3000))

answer_1<-mean(c(chick$weight.4,3000))/mean(chick$weight.4) # is NOT robust to outliers
answer_2<-median(c(chick$weight.4,3000))/median(chick$weight.4) # IS robust to outliers
answer_3<-sd(c(chick$weight.4,3000))/sd(chick$weight.4) # is NOT robust to outliers
answer_4<-mad(c(chick$weight.4,3000))/mad(chick$weight.4) # IS robust to outliers

mypar(1,1)
plot(chick$weight.4,chick$weight.21)

# calculate Pearson correlation
pearson_No_Outlier<-cor(chick$weight.4,chick$weight.21,method="pearson")
# now with outlier
pearson_With_Outlier<-cor(c(chick$weight.4,3000),c(chick$weight.21,3000),method="pearson")
answer_5<-pearson_With_Outlier/pearson_No_Outlier

# calculate Spearman correlation
spearman_No_Outlier<-cor(chick$weight.4,chick$weight.21,method="spearman")
# now with outlier
spearman_With_Outlier<-cor(c(chick$weight.4,3000),c(chick$weight.21,3000),method="spearman")
spearman_With_Outlier/spearman_No_Outlier

print(answer_1)
print(answer_2)
print(answer_3)
print(answer_4)
print(answer_5)