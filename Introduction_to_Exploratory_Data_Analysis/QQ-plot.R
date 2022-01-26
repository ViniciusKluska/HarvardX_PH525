install.packages("UsingR")
library(UsingR)
x <- father.son$fheight
round(sample(x, 20), 1)
hist <- hist(x, breaks=seq(floor(min(x)), ceiling(max(x))), main="Height histogram", xlab="Height (in)", ylab="Frequency")

print(hist)

xs <- seq(floor(min(x)),ceiling(max(x)), 0.1)
plot(xs, ecdf(x)(xs), type="l", col="red", main="Normal distribution", xlab="Height (in)", ylab="F(x)")

x_mean <- mean(x<70)
pnorm <- pnorm(70, mean(x), sd(x))
print(x_mean)
print(pnorm)

ps <- seq(0.01, 0.99, 0.01)
qs <- quantile(x, ps)
normalqs <- qnorm(ps, mean(x), sd(x))
plot(normalqs, qs, col="red", main="Normal distribution", xlab="normal percentiles", ylab="Height")
abline(0, 1, col="blue")

qqnorm(x)
qqline(x)