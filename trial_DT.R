iris
head(iris)
tail(iris)

library(rpart)
library(rpart.plot)

tree1 = rpart(Sepal.Length ~ ., data=iris, method='anova')
tree2 = rpart(Species ~ .,data = iris, method = 'class')

tree1
tree2
rpart.plot(tree1,nn=T)
rpart.plot(tree2, extra=104, nn=T,shadow.col = 'grey')
printcp(tree2)
tree2prune = prune(tree2, cp=0.44)
tree2prune
rpart.plot(tree2prune,cex=.8,nn=T,extra=104)

(ndata=sample_n(iris,3))
predict(tree2,newdata=ndata,type='prob')
predict(tree2prune,newdata=ndata,type='prob')
