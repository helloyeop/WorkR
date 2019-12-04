#
# 현동엽
# 작성일 : 2019.12.03
# 제출일 : 2019.12.04
#


#Q.1
income <- c(123,99,41,35,40,29,35,24,50,60)
term <- c(19,20,16,16,18,12,14,12,16,17)
term_income <- data.frame(term, income)
plot(term, income, main = "교육기간별 수입",xlab ="교육기간",
     ylab = "수입")
res <- lm(income~term, data=term_income )
res
abline(res)
cor(term_income)
#교육기간과 수입 사이의 상관관계
#lm을 통한 그래프에서 양의 상관관계가 있다고 확인됨
#cor을 통한 상관계수를 확인해보면, 0.78로 높은 상관관계가 있음
#교육기간이 길수록 수입이 늘어난다는 결론 도출

#Q.2
score <- c(77.5,60,50,95,55,85,72.5,80,92.5,87.5)
time <- c(14,10,20,7,25,9,15,13,4,21)
time_score <- data.frame(score, time)
time_score
plot(time,score, main = "TV시청 시간별 성적", xlab ="TV시청시간",
     ylab ="성적")
res <- lm(score~time,data = time_score)
res
abline(res)
cor(time_score)
#TV시청시간과 성적 사이의 상관관계
#lm을 통한 그래프에서 음의 상관관계가 있다고 확인됨
#cor을 통한 상관계수를 확인했을 때, -0.62로 비교적 높은 상관관계가 있음

#TV시청시간이 길수록 낮은 성적을 받는다는 결론 도출

#Q.3
class(mtcars)
str(mtcars)
vars <- c("cyl","disp","hp","drat","wt",
          "qsec","vs","am","gear","carb")
target <- mtcars[,vars]
cor(mtcars$mpg,mtcars[,vars])
str(mtcars)
plot(mtcars$wt,mtcars$mpg, main ="무게에 따른 연비",
     xlab ="무게", ylab ="연비",col="red")
res <- lm(data.frame(mtcars$wt,mtcars$mpg))
res
abline(res)
cor(mtcars$wt,mtcars$mpg)

# 연비(mpg)와 무게(wt)의 상관관계
# lm함수로 비교해본 결과,음의 상관관계를 나타냄
# -0.86의 상관계수를 가지며, 무게가 무거울 수록 
# 연비가 낮아진다는 결론 도출


#Q.4
population <- c(51014,51245,51446,51635,51811,51973,
                52123,52261,52388,52504,52609,52704)
years <- c(2015,2016,2017,2018,2019,2020,2021,2022,
           2023,2024,2025,2026)
year_pop <- data.frame(years,population)
year_pop
plot(years,population,type="l", main = "연도별 인구",
   xlab = "연도" ,ylab = "인구", las =3,lwd=3)


##Q.5

#Q.5.1
class(trees)
dim(trees)
str(trees)
head(trees)
tail(trees)

plot(trees$Girth, trees$Height, main ="나무의 지름과 높이",
     xlab = "지름",ylab = "높이")
res <- lm(data.frame(trees$Height,trees$Girth))
res
abline(res)
cor(trees$Height,trees$Girth)


#Q.5.2
cor(trees$Height,trees$Girth)
cor(trees$Height,trees$Volume)
cor(trees$Volume,trees$Girth)
pairs(trees)
