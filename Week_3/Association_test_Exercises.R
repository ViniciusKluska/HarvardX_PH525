## ASSOCIATION TESTS

# lab / textbook example

disease=factor(c(rep(0,180),rep(1,20),rep(0,40),rep(1,10)),
               labels=c("control","cases"))
genotype=factor(c(rep("AA/Aa",200),rep("aa",50)),
                levels=c("AA/Aa","aa"))
dat <- data.frame(disease, genotype)
dat <- dat[sample(nrow(dat)),] #shuffle them up
head(dat)

tab <- table(genotype,disease)

print(tab)

# odds ratio
(tab[2,2]/tab[2,1]) / (tab[1,2]/tab[1,1])

# overall proportion that have the disease
p=mean(disease=="cases")

print(p)

# expected table
expected <- rbind(c(1-p,p)*sum(genotype=="AA/Aa"),
                  c(1-p,p)*sum(genotype=="aa"))
dimnames(expected)<-dimnames(tab)
print(expected)

# chi sq test
chisq.test(tab)$p.value

## ASSOCIATION TESTS EXERCISES

d = read.csv("C:/Users/klusk/Projects/HarvardX_PH525/Data_HarvardX/assoctest.csv")
str(d)
tab <- table(d$allele,d$case)
print(tab)
print(chisq.test(tab))
print(fisher.test(tab))

