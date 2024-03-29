#
# break/next
#

sum <- 0
for ( i in 1:10) {
    sum <- sum + i
    if (i >=5) {
        break
    }
}
sum


sum <- 0

for ( i in 1: 10) {
    if ( i %% 2 ==0){
        next
    }
    sum <- sum + i
}

sum


#
#  산술 내장 함수
#

log(10) + 5     #로그함수
log(10, base = 2)
sqrt(25)          #제곱근
max(5, 3, 2)     #가장 큰수
min(3, 9 ,6)     #가장 작은 수
abs(-10)        #절대값
factorial(5)    #팩토리얼
sin(pi/2)       #삼각함수


#
# 사용자 정의 함수
#

mymax <- function(x,y) { #함수 정의
    num_max <- x
    if (y > num_max) {
        num_max <- y
    }
    return(num_max)
}

mymax(10,15)             #함수 호출
a <- 10
b <- 5
c<-8
max <- mymax(a,b)
max <- mymax(max,c)
max


#사용자 정의 함수 매개변수 초기값 설정

mydiv <- function( x, y=2){        # 초기화는 오른쪽에서 왼쪽으로 
    result <- x/y                  # x를 초기화 하려면 x,y 자리 변경 필요
    return (result)
}

mydiv(x=10, y=3)
mydiv(10,3)
mydiv(10)



# 외부 파일에 있는 함수 호출

setwd("D:/WorkR") #경로 지정 : \가 아닌 /로 써야함
source("mylib.R") #Lib 파일 지정 

#함수 호출
my_max(10,5)
my_div(10,2)



#
# Vector 도입
#

# scalar형 변수 사용
a<- 10
b<- 5
c <- 8
d<-1
e<-25
f<-3
g<-7
h<-81
i<-12
j<-93
max <- a
if (b>max) {max <-b}
if (c>max) {max <-c}
if (d>max) {max <-d}
if (e>max) {max <-e}
if (f>max) {max <-f}
if (g>max) {max <-g}
if (h>max) {max <-h}
if (i>max) {max <-i}
if (j>max) {max <-j}
max

# vector 사용
v <- c( 10,5,8,1,25,3,7,81,12,93)
max <- v[1]
for(i in 2:length(v)){
    if (v[i]>max){
        max <- v[i]
    }
}
max


# Vector 생성
x <- c(1,2,3)
y <- c("a","b","c")
z <- c(TRUE,TRUE,FALSE,TRUE)

x
y
z

class(x)
class(y)
class(z)

w <- c(1,2,3,"a","b")
w
class(w)

v1 <- 50:90
v1

v2 <- c(1,2,3,50:90)
v2
class(v1)
class(v2)

v3 <- seq( 1, 101, 3)
v4 <- seq(0.1,1.0,0.1)

v5 <- rep(1, times = 5)
v6 <- rep(1:5, times =3)
v7 <- rep(c(1,5,6),times = 3)

v3
v4
v5
v6
v7

#벡터 원소값에 이름 지정
b
score <- c(90, 85, 70)
score
names(score)
names(score) <- c("Hong","Kim","Lee")
names(score)
score
score[1]


#벡터 원소 접근
score[1]
score[2]
score[3]
score["Hong"]
score["Kim"]
score['Lee']

d <- c( 1, 4, 3, 7, 8)


for (i in 1:length(score)) {
    print(score[i])
}


score_names <- c("Hong","Kim","Lee")
for (i in 1:length(score)) {
    print(score[score_names[i]])
}


#백터에서 여러 개의 값을 한번에 추출
d <- c(1, 4, 3, 7 ,8)
d[c(1, 3, 5)]
d[1:3]
d[seq(1, 5, 2)]
d[-2]
d[-c(3:5)]
a <- c(3,4,8)
a
d
d[-a]
GNP <- c(2090, 2450, 960)
GNP
names(GNP) <- c("Korea", "Japan", "Nepal")
GNP
GNP[1]
GNP["Korea"]
GNP[c("Korea","Nepal")]


# 백터 요소값 변경
v1 <- c( 1, 5, 7, 8, 9)
v1
v1[2] <- 3
v1
v1[c(1,5)] <- c(10,20)
v1

#백터간 연산 -> 두 백터의 인덱스 개수가 같아야함
x <- c(1, 2, 3)
y <- c(4, 5, 6)
x+ y
x*y
z <- x+y
z


#백터에 적용가능한 함수
d <- c(1,2,3,4,5,6,7,8,9,10)
sum(d)                   #합계
sum(2 * d)
length(d)                #백터 요소 개수(길이)
mean(d[1:5])             #평균
mean(d)
median(d[1:5])           #중앙값
median(d)
max(d)                   #최대값
min(d)                   #최소값
sort(d)                  #정렬
sort(d, decreasing =FALSE)
sort(d, decreasing = TRUE)
range(d)                 #값의 범위(최소값 ~최대값)
var(d)                   #분산
sd(d)                    #표준편차

v <- sum(d) / length(d)
v

#백터에 논리연산 적용
d >= 5
d[d>5]
sum(d>5) #개수
sum(d[d>5])#합계
d==5

cond <-d >5 & d<8
cond
d[cond]


all(d>5)
any(d>5)

head(d)
tail(d)
head(d,3)
tail(d,3)

x <- c(1,2,3)
y <- c(3,4,5)
z <- c(3,1,2)

w<- c(x,y)
w
union(x,y)    # 합집합
intersect(x,y) # 교집합
setdiff(x, y)  # 차집합
setequal(x,y) # x,y에서 동일한 요소가 있는지 확인
setequal(x,z)



#List

ds <- c(90, 85, 70 ,84)
my_info <- list( name = 'Hong', age = 30, status = TRUE,
                 score = ds)
my_info
my_info[1]
my_info[[1]]
my_info$name
my_info[[4]]
my_info[[4]][1]


# Factor형(범주형)
bt <- c('A','B','B','O',"AB",'A')
bt_new <- factor(bt)
bt
bt_new
bt[5]
bt_new[5]
levels(bt_new)
as.integer(bt_new)
bt_new[7] <- 'B'
bt_new[8] <- 'C'
bt_new
class(bt_new)

#as로 시작하는 함수 : 변환함수 
#is로 시작하는 함수 : 논리함수




#
# 4일차
#

# 함수 반환값(return값)이 여러 개일 때의 처리
myfunc <- function(x ,y) {
    val_sum <- x + y
    val_mul <- x*y
    
    return (list(sum = val_sum , mul = val_mul))
}


result <- myfunc(5, 8)
s <- result$sum
m <- result$mul``
cat ( "5 + 8 =", s , '\n')
cat ( '5 * 8 =',m,'\n')








