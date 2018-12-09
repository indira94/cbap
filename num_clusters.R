mtcars
km1 = kmeans(mtcars[,c('mpg','wt')],centers = 3)
km1$centers

df = mtcars[,c('mpg','wt')]
df
df2 = scale(df)
df2

mk2 = kmeans(df2, centers=3)
mk2$centers

