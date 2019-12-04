#
# 현동엽 
#작성일 : 2019.12.02 / 제출일 : 2019.12.03

#Q.1.1
gender <- c("F","F","F","M","M","F","F","F","M","M")
gender

#Q.1.2
gd<-table(gender)
gd

#Q.1.3
barplot(gd, main = "Gender")

#Q.1.4
pie(gd, main = "Gender", radius = 1.0, border = "red")

#Q.2.1
season <- c("여름","겨울","봄","가을","여름","가을","겨울",
            "여름","여름","가을")

#Q.2.2
tmp<-table(season)
tmp

#Q.2.3
tmp1 <- tmp[c(3,4,1,2)]
color = c("blue","green","yellow","red")
barplot(tmp1 , main = "Favorite Season", col = color)

#Q.2.4
pie(tmp1, main ="Favorite Season")

#Q.3.1
score <- c(90,85,73,80,85,65,78,50,68,96)
subject <- c("KOR","ENG","ATH","HIST","SOC",
          "MUSIC","BIO","EARTH","PHY","ART")
names(score) <- subject
score

#Q.3.2
score

#Q.3.3
mean(score)
median(score)

#Q.3.4
sd(score)

#Q.3.5
max_subject<- which.max(score)
names(score[max_subject])

#Q.3.6
boxplot(score, main ="Grade", ylab="Score",las =1)
boxplot.stats(score)$out
#Q.3.7
hist(score, main = "학생 성적", col = "purple",
     breaks = 5)


#Q.4.1
class(mtcars)
head(mtcars,3)
wt <- mtcars$wt

mean(wt)
median(wt)
mean(wt,trim = 0.15)
sd(wt)

#Q.4.2
summary(wt)

#Q.4.3
cyl <- mtcars$cyl
table(cyl)

#Q.4.4
barplot(table(cyl), main = "Cyl")

#Q.4.5
hist(wt, main = "Wt",breaks =3, las = 1, border = "gray")

#Q.4.6
boxplot(wt, main = "wt", ylab = "wt",boxwex = 1.5, 
        col = "lightgray")
boxplot.stats(wt)
boxstats<-boxplot(wt, main = "wt", ylab = "wt",boxwex = 1.5, 
        col = "lightgray")
text(rep(1,NROW(boxstats$out)),boxstats$out,labels = boxstats$out, pos= c(2,2))
text(rep(1,NROW(median(wt))),median(wt),labels = median(wt), pos= c(1,1))

q

#Q.4.7
disp <- mtcars$disp
boxplot(disp, main ="disp", ylab="배기량",
        col = "lightblue")
boxplot.stats(disp)

#Q.4.8
boxplot(mpg~gear, data=mtcars, main ="기어별 연비")
boxplot.stats(mtcars$gear)
 
# 기어3단인 경우, 연비의 중앙값이 약 15.5정도로 가장 낮으며
# 사분위수 분포로 보아, 데이터가 밀집되어 있음
# 기어4단의 경우, 연비의 중앙값이 약 23으로 가장 높음
# 기어5단의 경우, 연비의 중앙값이 약 20이고, 데이터가
# 넓게 분포하고 있음



