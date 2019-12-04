#
# 현동엽 
# 작성일 : 2019.11.28 / 제출일 : 2019.11.29
#

d1 <- 1:50
d2 <- 51:100

#Q.1.1
d1
d2

#Q.1.2
length(d2)

#Q.1.3
d1+d2
d2-d1
d1*d2
d2/d1

#Q.1.4
sum(d1)
sum(d2)

#Q.1.5
sum(d1+d2)

#Q.1.6
max(d2)
min(d2)

#Q.1.7
m1<-mean(d1)
m2<-mean(d2)
sup1<- m1-d1
sup2<- m2-d2
sup1
sup2

#Q.1.8
sort(d1, decreasing=TRUE)

#Q.1.9
d1_tmp <- sort(d1[1:10], decreasing = FALSE)
d2_tmp <- sort(d2[1:10], decreasing = FALSE)
w<-c(d1_tmp,d2_tmp)
w



#Q.2.1
v1<- 51:90
v1[v1<60]

#Q.2.2
sum(v1<70)

#Q.2.3
sum(v1[v1>65])

#Q.2.4
v1[v1>60 & v1<73]

#Q.2.5
v1[v1<65 | v1>80]

#Q.2.6
v2 <- v1 %% 7 ==3
v1[v2]

#Q.2.7
v3 <- v1 %% 7==0
v3
v1[v3]<-0
v1

#Q.2.8
v1<- 51:90
v4 <- v1 %% 2==0
v4
sum(v1[v4])

#Q.2.9
v5<- v1 %% 2==1 | v1>80
v1[v5]

#Q.2.10
v6 <- v1 %% 3 == 0
v7 <- v1 %% 5 == 0
v6
v7
intersect(v1[v6],v1[v7])

#Q.2.11
v1
v8 <- v1 %% 2 ==0
v1[v8] <- v1[v8] * 2
v1


#Q.2.12
v1 <- 51:90
v1 <- v1[!(v1 %% 7 == 0)]  #v10<- v1 %% 7 !=0
v1







