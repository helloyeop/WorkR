#
# 현동엽
# 작성일 : 2019.12.04 //제출일 : 2019.12.05
#

#문제1)
ds <- data.frame(state.x77)
ds[2,3] <- NA
ds[3,1] <- NA
ds[2,4] <- NA
ds[4,3] <- NA

#Q.1
col_na <- function(y){
  sum(is.na(y))
}
apply(ds,1,col_na)
rowSums(is.na(ds))

#Q.2
ds[!complete.cases(ds),]

#Q.3
sum(rowSums(is.na(ds))>0)

#Q.4
ds.new <- ds[complete.cases(ds),]

#문제2)
st <- data.frame(state.x77)
st
#Q.1
boxplot(st)

#Q.2
library(dplyr)
st %>% filter(population)



#Q.3


# 문제3)
# Q.1
AQ <- airquality
class(AQ)

#Q.2
colSums(is.na(AQ))
apply(AQ,2,col_na)

#Q.3
rowSums(is.na(AQ))
apply(AQ,1,col_na)

#Q.4
AQ[!complete.cases(AQ),]

#Q.5
AQ[!complete.cases(AQ),]




