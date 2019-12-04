#
#   6일차
#
 
# 다중변수 자료 탐색
# 두 변수 사이의 산점도
# 산점도(scatter plot) -   두 변수로 구성된 자료의
#                          분포를 알아보는 그래프
#                          관측값들의 분포를 통해
#                          두 변수 사이의 관계 파악

wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt, mpg, main = "중량-연비 그래프",
     xlab = "중량", ylab = "연비",
     col = "purple", pch = 19) #pch : 점 모양
## ==>  음의 상관관계
plot(mtcars$wt,mtcars$mpg , main = "중량-연비 그래프",
     xlab = "중량", ylab = "연비",
     col = "purple", pch = 19) #방법2
plot(mtcars[,c("wt","mpg")], main = "중량-연비 그래프",
     xlab = "중량", ylab = "연비",
     col = "red", pch = 19) #방법3
plot(mpg~wt,data = mtcars, main = "중량-연비 그래프",
     xlab = "중량", ylab = "연비",
     col = "black", pch = 19) #방법4


#여러 변수들간의 산점도
vars <- c("mpg","disp","drat","wt")
target<- mtcars[,vars]
head(target)
pairs(target,main ="multu plots")
#대각선 변수명 기준 대칭(x,y 좌표가 바뀜)
#두 변수가 일치하는 부분이 해당 변수와 관계
#그래프에서 상관관계가 높은 데이터 구분 가능


#그룹 정보가 있는 두 변수의 산점도
iris_2 <- iris[,3:4]

point <- as.numeric(iris$Species)
point
color <- c("red","green","blue")
plot( iris_2, main = "Iris plot",
      pch = c(point)*2,
      col = color[point])
color[1]
color[point]
head(iris)

# 상관분석
beers <- c(5, 2, 9,8, 3 ,7, 3 ,5, 3, 5) #맥주 잔
bal <- c(0.1,0.03,0.19,0.12,0.04,     #혈중 알콜 농도
         0.095,0.07,0.06,0.02,0.05)
tbl <- data.frame(beers, bal)
tbl

plot(bal~beers,data=tbl)    #산점도

res <- lm(bal~beers, data = tbl)  #회귀식
res
#회귀식 : y = xw + b
# y : 종속변수
# x : 독립변수
# w : weight
# b : bias
abline(res)  # 회귀선
cor( tbl[,1:2])  # 상관 계수
cor(iris[,1:4])  # 다변량으로 상관계수
#상관관계가 강하다 / 양의 상관관계이다   


# 상관분석 순서
# 
# 1. 상관분석 대상 변수 선정
# 2. 산점도 작성 ( 관측값 분포 확인) : plot()
# 3. 회귀식 도출 : lm()
#    (회귀식 : 두 변수의 선형관계를 가장 잘 나타낼 수 있는
#    선의 식)
#    (y = xw + b)
# 4. 회귀선을 산점도에 표시 : abline()
#    (회귀선 : 관측값들의 추세를 가장 잘 나태할 수 있는 선)
# 5. 상관계수 계산 : cor()
# 6. 상관분석 결과 해석


#시계열 Data - 선그래프
month <- 1:12
late <- c(5,8,7,9,4,6,12,13,8,6,
          6,4)

plot (month,late, main = "지각생 통계", type = "l",
      lty = 1, lwd = 1, xlab = "Month", ylab = "late cnt")
plot (month,late, main = "지각생 통계", type = "b",
      lty = 1, lwd = 3, xlab = "Month", ylab = "late cnt")
plot (month,late, main = "지각생 통계", type = "o",
      lty = 3, lwd = 1, xlab = "Month", ylab = "late cnt")
plot (month,late, main = "지각생 통계", type = "s",
      lty = 1, lwd = 1, xlab = "Month", ylab = "late cnt")
#lty : 선의 모양, lwd : 선의 굵기
## x축이 시간을 의미하는 데이터 ==> 시계열 data


#복수의 선 그래프
late1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)
data.frame(late1,late2)
plot (month, late1, main = "지각생 통계", type = "b",
      lty = 1, col="red", xlab = "Month", ylab = "late cnt",
      ylim = c(1,15))
lines(month, late2, type = "b",
      col = "blue")


#자료 탐색 실습 - 탐색적 데이터 분석
# 0단계 : 문제 정의
# 1단계 : 분석 대상 데이터셋 준비
#         BostdnHousing 데이터셋(mlbench pac.)
install.packages("mlbench")
library(mlbench)
data("BostonHousing")
# crim : 1인당 범죄율
# rm : 주택 1 가구당 방수
# dis : 보스턴 5개 지역센터까지의 거리
# tax : 재산세율
# medv : 주택가격
class(BostonHousing)
dim(BostonHousing)
str(BostonHousing)
head(BostonHousing)
tail(BostonHousing)
myds <- BostonHousing[,c("crim","rm","dis",
                         "tax", "medv")]

# 2단계. 파생변수 추가 :
#                     grp 변수추가 - 주택가격상중하
grp <- c()  #빈 변수
for (i in 1:nrow(myds)) {
  if (myds$medv[i] >= 25.0) {
    grp[i] <- 'H'
  } else if ( myds$medv[i] <= 17.0) {
    grp[i] <- 'L'
  } else {
    grp[i] <- 'M'
  }
}
grp
grp <- factor(grp)  #grp를 팩터형으로
grp <- factor(grp, levels = c("H","M","L")) #H M L 순서를 지정 (높음,보통,낮음)
myds <- data.frame(myds, grp) #기존 데이터 프레임에 추가
head(myds)
grp


# 3단계. 데이터셋의 형태와 기본적인 내용 파악
str(myds)
head(myds)
table(myds$grp)


# 4단계. 히스토그램에 의한 관측값의 분포 확인
par(mfrow = c(2, 3))
for (i in 1:5){
  hist(myds[,i], main = colnames(myds)[i],
       col = "yellow")
}
par( mfrow - c(1,1))


# 5단계. 상자그림에 의한 관측값의 분포 확인
par(mfrow = c(2,3))
for (i in 1:5){
  boxplot(myds[,i], main = colnames(myds)[i])
}
par(mfrow = c(1,1))
boxplot.stats(myds$crim)


# 6단계. 그룹별 관측값의 분포 확인
# ~ 뒷 부분은 그룹으로 묶을 수 있는 범주형 데이터가 필요
boxplot(myds$crim~ myds$grp, main = "1인당 범죄율")  
boxplot(myds$rm~ myds$grp, main = "방의 개수")

# 7단계. 다중 산점도를 통한 변수 간 상관관계 확인
pairs(myds[,-6]) #6번째 변수는 생략(grp는 factor)


# 8단계. 그룹 정보를 포함한 변수 간 상관 관계 확인
point <- as.integer(myds$grp)
color <- c("red","green","blue")
pairs(myds[,-6], pch = point, col = color[point])


# 9단계. 변수 간 상관계수 확인
cor(myds[,-6])








