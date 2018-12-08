
#vector

#ND with mean 80, sd 10, 100 values

sales = rnorm(100,mean=80,sd=10)
plot(density(sales))
sales
#trunc, round, floor, ceiling
sales = trunc(sales)
sales
summary(sales)
boxplot(sales)
mean(sales)
median(sales)
hist(sales)
plot(density(sales))
#10-50
range(sales)
#matrix
m1 = matrix(100:123, ncol=2)
m1
colSums(m1)
colMeans(m1)
m1[,1]
colnames(m1) = c('A','B')
head(m1)
tail(m1)

#DF
sname = paste('Student', 1:30, sep='_')
sname
marks = trunc(runif(30,50,90))
#?runif
(gender = sample(c('M','F'),replace=T,size=30,prob=c(.7,.3)))
df1= data.frame(sname,marks,gender)
head(df1)

library(dplyr)
df1 %>% group_by(gender) %>% summarize(mean(marks), n(), min(marks), max(marks))
#name, marks (descending); no gender
names(df1)
str(df1)
summary(df1)

df1[(order(df1$marks, decreasing=T)),c('sname','marks')]
df1[(order(df1$marks, decreasing=T)),-3]
?select
?arrange
#usedplyr
df1 %>% select(sname, marks) %>% arrange(desc(marks))

df1 %>% sample_n(3)
df1 %>% sample_frac(.3)

df1[sample(1:30,size=5),2] = NA
df1
#df1[!complete.cases(df1),2] = mean(df1$marks,na.rm=T)
#df1

(df2 = df1[complete.cases(df1),])
#Linear Regression

#Logistic Regression

#
df = read.csv(file.choose())
head
