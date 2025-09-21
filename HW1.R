#Ricky Parcels HW1

#1.

#a)Use read.delim function to read Su_raw_matrix.txt into a variable called su.
su = read.delim(file="C:/Users/rparc/Downloads/Su_raw_matrix.txt", header=TRUE, sep="\t")

#b)Use mean and sd functions to find mean and standard deviation of Liver_2.CEL column.
liver2mean = mean(su[ ,8])
liver2mean

liver2sd = sd(su[ ,8])
liver2sd

#c)Use colMeans and colSums functions to get the average and total values of each column.

columnMean = colMeans(su)
columnMean

columnSum = colSums(su)
columnSum

#2. 

#a)mean=0, sigma=0.2
sigma2 = rnorm(10000,mean=0, sd=0.2)
hist(sigma2)

#b)mean=0, sigma=0.5
sigma5 = rnorm(10000,mean=0, sd=0.5)
hist(sigma5)

#3.
library(ggplot2)
#a)
dat = data.frame(cond = factor(rep(c("A","B"), each=200)), rating = c(rnorm(200),rnorm(200, mean=.8)))

#b)Overlaid histograms
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, alpha=.5, position="identity")

#c)Interleaved histograms
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")

#d)Density plots
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()

#e)Density plots with semitransparent fill
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)

#f)
library(ggplot2)
diabetes = read.csv(file="C:/Users/rparc/Downloads/diabetes_train.csv", header=TRUE, sep=",")

#Overlaid histograms
ggplot(diabetes, aes(x=mass, fill=class)) + geom_histogram(binwidth=.5, alpha=.5, position="identity")+ scale_fill_brewer(palette = "Set2")

#Interleaved histograms
ggplot(diabetes, aes(x=mass, fill=class)) + geom_histogram(binwidth=.5, position="dodge")+ scale_fill_brewer(palette = "Set2")

#Density plots
ggplot(diabetes, aes(x=mass, colour=class)) + geom_density()+ scale_fill_brewer(palette = "Set2")+scale_color_brewer(palette = "Set2")

#Density plots with semitransparent fill
ggplot(diabetes, aes(x=mass, fill=class)) + geom_density(alpha=.3)+ scale_fill_brewer(palette = "Set2")


#4.
library(tidyverse)
passengers = read.csv(file="C:/Users/rparc/Downloads/titanic.csv", header=TRUE, sep=",")
passengers %>% drop_na() %>% summary()
passengers %>% filter(Sex == "male")
passengers %>% arrange(desc(Fare))
passengers %>% mutate(FamSize = Parch + SibSp)
passengers %>% group_by(Sex) %>% summarise(meanFare = mean(Fare), numSurv = sum(Survived))


#5.
quantile(diabetes$skin, probs = c(0.10, 0.30, 0.50, 0.60))







