#
#   7일차             P.172~233
#
# 결측치 처리
# vector의 결측치 처리
z <- c(1,2,3,NA,5,NA,8)
sum(z)
is.na(z)  #is.na함수는 내부적으로 반복문이 들어가있음 -> 반복문(Iterator) 구현 불필요
sum(is.na(z))  #FALSE = 0 , TRUE = 1
sum(z,na.rm = TRUE)  #na.rm= 결측치 제외 유무 결정 


#결측치 대체 및 제거
z1 <- z
z2 <- c(5,8,1,NA,3,NA,7)
z1[is.na(z1)] <- 0            #단순 대입법 
z1
z3 <- as.vector(na.omit(z2))  #Listwise Delection   omit : 생략하다
                              #결측치가 포함된 데이터를 삭제(행)
z3


## Matrix / Data Frame 결측치 처리
x <- iris
x[1,2] <- NA
x[1,3] <- NA
x[2,3] <- NA
x[3,4] <- NA
head(x)

## Matrix/ Data frame열별 결측치 확인 방법
# for문 이용
for ( i in 1:ncol(x)){
  this.na <- is.na(x[,i])
  cat(colnames(x)[i],"\t",sum(this.na),"\n")    #this.na => FALSE,TRUE(NA)
}

# apply() 이용
col_na <- function(y) {
  return ( sum(is.na(y)))
}
na_count <- apply(x,2,col_na)
na_count

na_count <- apply(x,2,
                  function(y) sum(is.na(y))) # =====> 익명 함수(이름없는 함수) (Lambda식 표기)
na_count


barplot(na_count[na_count>0])

install.packages("VIM")
require(VIM)

#결측치 자료 조합 확인용 시각화 도구
aggr(x,prop = FALSE, numbers = TRUE)

#두 개의 변수 간의 결측치 관계 확인 시각화 도구
marginplot(x[c("Sepal.Width","Petal.Width")],
           pch = 20,
           col = c("darkgray","red","blue"))

marginplot(x[c("Sepal.Width","Sepal.Length")],
           pch = 20,
           col = c("darkgray","red","blue"))

# Matrix / Data Frame의 행(data)별 결측치 확인
rowSums(is.na(x))
sum(rowSums(is.na(x))>0)

sum(is.na(x))


# 결측치를 제외한 새로운 데이터셋 생성(Listwidse Delection)
head(x)
x[!complete.cases(x),] #NA가 포함된 행 출력
y<-x[complete.cases(x),]
head(y)


# 특이값, 이상치(outliner)
st <- data.frame(state.x77)
summary(st$Income)
boxplot(st$Income)
boxplot.stats(st$Income)$out

# 특이값 처리 
out.val <- boxplot.stats(st$Income) $Sout
st$income[st$Income %in% out.val] <- NA     # %in% 포함 연산자( out.val이 st$inome에 해당하는 부분을 NA로)
head(st)
newdata <- st[complete.cases(st),]
head(newdata)

##==> 데이터 정체(결측치 처리, 이상치 처리)
##==> 데이터 가공(정렬, 추가, 필터링, 집계, 병합)

#
# 데이터 가공
#
# 데이터 정렬
# Vector 정렬
v1 <- c(1,7,6,8,4,2,3)
v1
order(v1)
v1<-sort(v1)
v1
v2 <- sort(v1, decreasing = T)
v2

# Matrix / Data Frame 정렬
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),] #Ascending
iris[order(iris$Sepal.Length, decreasing = T),]
iris.new <- iris[order(iris$Sepal.Length),]
head(iris.new)
iris[order(iris$Species, decreasing = T,
           iris$Sepal.Length),] # 정렬 기준을 2개 설정

# 데이터 분리
sp <- split(iris, iris$Species)
sp
summary(sp)
summary(sp$setosa)
sp$setosa

# 데이터 선택
subset(iris, Species == "setosa")
subset(iris, Sepal.Length >=7.5)
subset(iris, Sepal.Length > 5.1 & Sepal.Width > 3.9)
subset(iris, Sepal.Length > 7.6,
       select = c(Petal.Length, Petal.Width))


# 데이터 Sampling
# 숫자를 임의로 추출(Vector)
# 비복원 추출 : 다음 샘플링 할때, 포함시키지 않는 것(R에서 대부분)
# 복원 추출 :  지금 샘플링하더라도, 다시 넣어서 또 샘플링 하는 것
x <- 1:100
y <- sample(x,size = 10, replace = FALSE) #replace = FALSE --> 비복원 
y


# 행을 임의로 추출
idx <- sample(1:nrow(iris), size= 50, replace = FALSE)
iris.50 <- iris[idx,]
dim(iris.50)
head(iris.50)


sample(1:20,size =5)
sample(1:20,size =5)
sample(1:20,size =5)

set.seed(100)
sample(1:20,size =5)
set.seed(100)
sample(1:20,size =5)
set.seed(80)
sample(1:20,size =5)
set.seed(100)
sample(1:20,size =5)



# 데이터 조합

combn( 1:5,3)  #조합할 수의 범위 , 조합할 수의 개수
x = c("red","green","blue","black","white")
com <- combn(x,2)
com

for ( i in 1:ncol(com)){
  cat(com[,i],"\n")
}

ncol(com)



# 데이터 집계
agg <- aggregate(iris[,-5],
                 by = list(iris$Species),
                 FUN = mean) #집계 데이터, 집계기준, 집계행동
agg


agg <- aggregate(iris[,-5],
                 by = list(iris$Species),
                 FUN = sd) #집계 데이터, 집계기준, 집계행동
agg

head(mtcars)
agg <- aggregate(mtcars,
                 by = list(cyl = mtcars$cyl,
                           vs = mtcars$vs),
                 FUN = max)
agg


# 데이터 병합

x <- data.frame(name = c("a","b","c"),
                mat = c(90,80,40))
y <- data.frame(name = c("a","b","d"),
                 korean = c(75,60,90))
z <- merge(x,y, by= c("name"))
x
y
z

merge(x,y)
merge(x,y, all.x = T)
merge(x,y, all.y = T)
merge(x,y,all = T)

# x,y사이에 같은 이름의 변수가 없음
#같은 변수명이 없는 경우 병합 방법

x <- data.frame(name = c("a","b","c"),
                mat = c(90,80,40))
y <- data.frame(sname = c("a","b","d"),
                korean = c(75,60,90))
merge(x,y,by.x = c("name"),
      by.y = c("sname"))      


#
# dplyr package
#
install.packages("dplyr")
library(dplyr)
# %>% 파이프 연산자   ctrl + shift + m

df <- data.frame(var1 = c(1,2,1),
                 var2 = c(2,3,2))
df

# rename() : 이름 변경
df <- rename(df,v1 = var1 , v2 = var2)
df

# 파생변수 추가
df$sum <- df$v1 + df$v2
df

df[2,1] <-5
df

df <- data.frame(id = c(1,2,3,4,5,6),
                 class = c(1,1,1,1,2,2),
                 math = c(50,60,45,30,25,50),
                 english = c(98,97,86,98,80,89),
                 science = c(50,60,78,58,65,98))
df

# filter() : 행 추출
#입력값 %>% 출력값
#입력값 %>% 출력값(입력값) %>% 출력값  파이프를 계속 연결 가능
df %>% filter(class ==1)
df %>% filter(class ==2)
df %>% filter(class !=1)
df %>% filter(class !=2)

df %>% filter(science > 70)
df %>% filter(math > 70)

df %>%  filter(class ==1 & math >= 50)
df %>%  filter(math >= 50 | english >= 90)
df %>%  filter( class %in% c(1,3,5))  # %in% 1,3,5가 포함된 것 


class1 <- df %>%  filter(class ==1)
class2 <- df %>%  filter(class ==2)
class1
class2
class1 <- subset(df, class==1)
class1


# select() : 변수 추출
df %>% select(math)
df %>% select(science)
df %>% select(class,math,science)
df %>% select(-math)

# dplyr 함수 조합
df %>%
  filter(class ==1) %>% 
  select(science)

df %>% 
  select(id, science) %>% 
  head

df %>% 
  select(id, science) %>% 
  sum

df %>% 
  select(id, science) %>% 
  max


# arrange() : 정렬
df %>% arrange(science)
df %>% arrange( desc(science))

# mutate() : 파생변수 추가
df %>% 
  mutate(total = math + science + english) %>% 
  head()

df %>% 
  mutate(total = math + science + english, 
         average = (math + english+ science)/3) %>% 
  head

df %>% 
  mutate(grade = ifelse(science>=60, 'pass','fail')) %>% 
  head

df %>% 
  mutate(total = math + science + english, 
         average = (math + english+ science)/3) %>% 
  mutate(grade = ifelse(average >=90,'pass',
                        ifelse(average<60,'fail','normal'))) %>% 
  head

df %>% 
  mutate(total = math + science + english, 
         average = (math + english+ science)/3) %>% 
  arrange(desc(average)) %>% 
  head
df


# summarise() : 집단별 요약
# group_by() : 집단별 나누기
df %>% summarise(mean_math = mean(math))

df %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            mean_english = mean(english),
            mean_science = mean(science),
            n=n())  #n() : 빈도수를 계산하는 함수(table과 유사)
                    #dbl = double/ int = interger
        

install.packages("ggplot2")
library(ggplot2)
str(ggplot2::mpg)      ## 패키지 :: 데이터셋 이름(ggplot2에 있는 mpg 데이터셋)
                        # library를 통한 package 로드 없이 패키지에 있는 데이터셋 사용가능

mpg <- data.frame(ggplot2::mpg)
dim(mpg)
str(mpg)
head(mpg)
View(mpg)


mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer, drv) %>% 
  filter(class == 'suv') %>% 
  mutate ( tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange( desc(mean_tot)) %>% 
  head(10)


# 데이터 병합
# left_join() : 가로로 합치기(변수추가)
# inner_join() : 가로로 합치기(변수추가)
# full_join() : 가로로 합치기(변수추가)
# bind_rows() : 세로로 합치기(data 추가)
df1 <- data.frame(id = c(1,2,3,4,5),
                  midterm = c(60,80,70,90,85))
df2 <- data.frame(id = c(1,2,3,4,5),
                  final = c(60,80,70,90,85))
df1
df2
total <- left_join(df1,df2,by="id")
total

df1 <- data.frame(id = c(1,2,3),
                  address = c("서울","부산","제주"),
                  stringsFactors = F)  #string을 factor로 인식하는 것을 방지

df2 <- data.frame(id = c(1,2,4),
                  gender = c("남","여","남"))
df_left <- left_join(df1, df2, by="id")  # df1을 기준으로 합치기
df_left
df_inner <- inner_join(df1,df2, by ="id") # df1과 df2에 동일하게 있는 변수만 합침
df_inner
df_full <- full_join(df1,df2, by ="id")  # df1,df2 모든 변수 합치기
df_full


df1 <- data.frame(id = c(1,2,3,4,5),
                  test = c(60,80,70,90,85))
df2 <- data.frame(id = c(1,2,3,4,5),
                  test = c(60,80,70,90,85))
df_all <- bind_rows(df1,df2)
df_all



install.packages( "psych")
library(psych)

summary(mtcars)
describe(mtcars) #summary와 유사함
#vars : 변수개수

install.packages("descr")
require(descr)

df <- data.frame(id = c(1,2,4),
                  gender = c("남","여","남"))
table( df$gender)

freq(df$gender)
freq(df$gender,plot = F)
