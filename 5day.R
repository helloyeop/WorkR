#
# 5일차
#
setwd("D:/WorkR")
df <- read.table(file ="airquality.txt",header= T)
df
class(df)
dim(df)
str(df)
head(df,3)
tail(df,3)

install.packages("xlsx")
install.packages("rJava")
#or packages탭 -> Install클릭 -> package 검색 후
#설치  ====> 주석으로 패키지 설치 내역 메모 필수

# 패키지 사용
library( rJava )
library( xlsx )
#rJava를 먼저 load 해야함


df_xlsx <- read.xlsx("airquality.xlsx", sheetIndex = 1, encoding = "utf-8")
df_xlsx
class(df_xlsx)
str(df_xlsx)
head(df_xlsx,3)
tail(df_xlsx,3)
str(df)
str(df_xlsx)

score <- c(76,84,69,50,95,71,88,84)
score
which(score == 69)
which(score >=85)
max(score)
which.max(score)   #최대값의 위치
min(score)
which.min(score)   #최소값의 위치
# which -> 인덱스를 얻어오는 목적

idx <- which(score >= 60)
score[idx] <- 61
score

idx <- which(iris[, 1:4]>5.0, arr.ind = TRUE)  
#arr.ind = TRUE -> 행과 열의 인덱스 값전달 
idx


#
# 단일 변수(일변량) 범주형 자료 탐색
#
favorite <- c('WINTER',"SUMMER","SPRING","FALL","SUMMER",
              "FALL","WINTER","SPRING","WINTER","FALL")

favorite
class(favorite)
table(favorite)  #도수분포표
ds <- table(favorite)/ length(favorite)  #비율 계산
ds
barplot(ds, main = "favorite season")

ds_new <- ds[c(2,3,1,4)]
ds_new
barplot(ds_new, main = "favorite season")

pie(ds ,main ="favorite season")
pie(ds_new , main = "favorite season")

favorite.color <- c(2,3,2,1,1,2,2,
                    1,3,2,1,2,3,1,2)
ds <- table(favorite.color)
ds
barplot(ds , main = "favorite season")
colors <- c('green',' red','blue')
names(ds) <- colors
ds
barplot(ds, main = " favorite season",col = c('green','red','blue'))
pie(ds, main = "favorite season", col = colors)  # col == 색상 부여 인수(color)



#
# 단일변수(일변량) 연속형 자료 탐색
#

weight <- c(60, 62, 64,65,68,69)
weight
weight_heavy <- c(weight, 120) #데이터 추가 
weight_heavy
#평균
mean(weight)
mean(weight_heavy)
#중앙값
median(weight)
median(weight_heavy)
#절사평균   #상위, 하위 데이터를 잘라내어 평균 집계
mean(weight, trim = 0.2)
mean(weight_heavy, trim = 0.2)
## ==> weight와 weight_heavy의 값은 비슷한데, 하나가 큰 차이가 남

#사분위수  
# 0 ==> 최소값
# 25 1사분위
# 50 2사분위 ==> 중앙값과 같음
# 75 3사분위
# 100 ==> 최대값
quantile(weight_heavy)
quantile(weight_heavy,(0:10) / 10)  # => 10% 단위로 나눔
summary(weight_heavy)  #=> 종합한 함수

##산포(distribution) - 값이 퍼져있는 정도 파악
#분산
var(weight)
#표준편차
sd(weight)
#값의 범위 (최소값과 최대값)
range(weight)
#최대값과 최소값의 차이
diff(range(weight))

# #histogram : 연속형 자료의 분포를 시각화
# 연속형 자료에서는 구간을 나누고 구간에 속한
# 값을의 개수를 세는 방법으로 사용
str( cars)
dist <- cars[,2]
head(cars)
dist
hist(dist, main ="Histogram for 제동거리",
     xlab = "제동거리", ylab ='빈도수',
     border = 'blue', col = 'green', 
     las =2,breaks= 5) #las -> 0~3 / break : 막대 수
## 히스토그램과 막대그래프 -> 막대가 떨어져 있으면 막대
# 붙어있으면 히스토그램 


#상자 그림(boxplot) , 상자수염그림
# 사분위수를 시각화하여 그래프 형태로 표시
#상자 그림은 하나의 그래프로 데이터의 분포
#형태를 포함한 다양한 정보를 전달
#자료의 전반적인 분포를 이해하는데 도움
#구체적인 최소/최대/중앙값을 알기는 어렵다
boxplot(dist, main = " 자동차 제동거리")
dist

boxplot.stats(dist)
boxplot.stats(dist)$status #정상범위 사분위수
boxplot.stats(dist)$n  #관측치 개수
boxplot.stats(dist)$conf#중앙값 신뢰구간
boxplot.stats(dist)$out # 이상치(특이값) 목룍

#일변량 중 그룹으로 구성된 자료의 상자그림
boxplot(Petal.Length~Species,
        data = iris, main ='품종별 꽃잎의 길이')

boxplot(iris$Petal.Length~iris$Species,
        main = "품종별 꽃잎의 길이")

#한 화면에 여러 그래프 작성
par(mfrow = c(1,3)) # 1X3 가상화면 분할
barplot(table(mtcars$carb), main ="c", xlab = "carburetors", ylab = "freq",col="blue")
barplot(table(mtcars$cyl), main ="cyl", xlab = "cyl", ylab = "freq",col="red")
barplot(table(mtcars$gear), main ="g", xlab = "gear", ylab = "freq",col="green")

par(mfrow = c( 1,1)) #가상화면 분할 해제
table(mtcars$carb)
mtcars
