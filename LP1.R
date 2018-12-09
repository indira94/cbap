#----------------------------------------------#
#Another Method
#https://cran.r-project.org/web/packages/lpSolveAPI/lpSolveAPI.pdf
#https://ecreee.wikischolars.columbia.edu/file/view/lpSolveAPI+Tutorial.Rmd

library(lpSolveAPI)

#First we create an empty model x.
?make.lp
#max: x + y - 50
lprec <- make.lp(0, 2)
lprec
set.objfn(lprec, c(150, 200))
lprec
#maximise it
lp.control(lprec, sense="max")
lprec

#set.type(lprec, c(1,2), type = c("integer"))
lprec
#40x + 60y <= 7400
add.constraint(lprec, c(40,60), "<=", 7400)
lprec
#20x + 25y <= 3300
add.constraint(lprec, c(20,25), "<=", 3300)
lprec
#x >= 45
#add.constraint(lprec, c(1,0), ">=", 45)
#lprec
#y >= 5
#add.constraint(lprec, c(0,1), ">=", 5)
#lprec
#50 >= x + y
#add.constraint(lprec, c(1,1), ">=", 50)
#lprec

set.bounds(lprec, lower = c(0, 0), columns = c(1, 2))
lprec

#set.bounds(lprec, upper = 48.98, columns = 4)
#RowNames <- c("MachineA", "MachineB","InitalA", "InitalB","TotalInitial")
RowNames <- c("CropA", "CropB")
ColNames <- c("Budget", "Labor")
dimnames(lprec) <- list(RowNames, ColNames)
lprec
solve(lprec)   #[1] 0  ok
#get.dual.solution(lprec)
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
plot(lprec)
print(lprec)