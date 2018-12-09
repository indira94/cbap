library(lpSolveAPI)


f.obj <- c(1,1)
f.con <- matrix(c(50,24,30,33,1,0,0,1,1,1),ncol=2,byrow = T)
f.dir <- c("<=","<=",">=",">=",">=")
f.rhs <- c(2400,2100,45,5,50)
cbind(f.con,f.dir,f.rhs)

lp("max",f.obj,f.con,f.dir,f.rhs)
?lp
lp("max",f.obj,f.con,f.dir,f.rhs)$solution
lp("max",f.obj,f.con,f.dir,f.rhs)$objval
