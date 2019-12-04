
#
#   현동엽 / 2019.12.02
#
#Q.1.1
m <- c(10,40,60,20)
f <- c(21,60,70,30)
score <- cbind(m,f)
score

#Q.1.2
colnames(score) <- c("male","female")
score

#Q.1.3
score[2,]

#Q.1.4
score[,"female"]

#Q.1.5
score[3,2]


#Q.2.1
class(state.x77)
st <- as.data.frame(state.x77)
class(st)


#Q.2.2
st

#Q.2.3
colnames(st)

#Q.2.4

row.names(st)

rownames(st)

#Q.2.5
dim(st)

#Q.2.6
str(st)

#Q.2.7
apply(st,1,sum)
apply(st,1,mean)

#Q.2.8
apply(st,2,sum)
apply(st,2,mean)

#Q.2.9
st["Florida",]

#Q.2.10
st[1:50,"Income"]

st[,"Income"]


#Q.2.11
st["Texas","Area"]

#Q.2.12
st["Ohio",c("Population","Income")]

#Q.2.13
st1 <- subset(st,Population > 5000)
st1

#Q.2.14
st1 <- subset(st,Income > 4500)
st1[,c("Population","Income","Area")]
## st1<-subset(st,Income > 4500, select= c(~~))
#Q.2.15
st1 <- subset(st,Income > 4500)
dim(st1)[1]
## nrow(st1)

#Q.2.16
st1 <- subset(st, Area>100000 & Frost > 120)
st1

#Q.2.17
st1 <- subset(st, Population<2000 & Murder <12)
st1

#Q.2.18
st1 <- subset(st, Illiteracy> 2.0)
st1
mean(st1[,"Income"])

#Q.2.19
st1 <- subset(st,Illiteracy <2.0)
st2 <- subset(st,Illiteracy >=2.0 )
st2
st1
mean(st1[,"Income"]) -mean(st2[,"Income"])


#Q.2.20
apply(st,2,max)
max(st[,'Life Exp'])
head(st)
st


#Q.2.21

st["Pennsylvania","Income"]
st1 <- subset(st, Income > st["Pennsylvania","Income"] )
st1


#Q.3.1
class(mtcars)

#Q.3.2
dim(mtcars)

#Q.3.3
str(mtcars)

#Q.3.4
max(mtcars[,"mpg"])
mt1 <- subset(mtcars, mpg == max(mtcars[,"mpg"]))
mt1


#Q.3.5
mt <- subset(mtcars, gear ==4)
mt
mt1 <- subset(mt, mpg == min(mt[,"mpg"]))
mt1

#Q.3.6
mtcars["Honda Civic",c("mpg","gear")]

#Q.3.7
mtcars["Pontiac Firebird","mpg"]
mt <- subset(mtcars, mpg > mtcars["Pontiac Firebird","mpg"])
mt

#Q.3.8

apply(mtcars[,"mpg"],1,mean)

mtcars[,"mpg"]

#Q.3.9
unique(mtcars$gear)

st1[c("Population","Income","Area")]

#Q.2.15
st1 <- subset(st,Income > 4500)

#Q.2.16
st1 <- subset(st,Area > 100000 & Frost > 120)
st1

#Q.2.17
st1 <- subset(st,Population < 2000 & Murder< 12)
st1

#Q.2.18
st1 <- subset(st,Illiteracy >= 2.0)
mean(st1[,"Income"])

#Q.2.19
st1 <- subset(st,Illiteracy >= 2.0)
st2 <- subset(st,Illiteracy < 2.0)
mean(st1[,"Income"]) - mean(st2[,"Income"])

#Q.2.20
st <- as.data.frame(state.x77)
st1 <- st["Life Exp"]

  
#Q.2.21
st <- subset(st, Income > st["Pennsylvania","Income"])
st

#Q.4.1
class(airquality)

#Q.4.2
head(airquality)

#Q.4.3
max(airquality[,"Temp"])

#Q.4.4
wd <- subset(airquality,Month == 6)
max(wd["Wind"])

#Q.4.5
wd <- subset(airquality,Month == 7)
mean(wd['Temp'])

#Q.4.6
wd <- subset(airquality,Ozone > 100)
dim(wd)[1]

#Q.5.1
st <- as.data.frame(state.x77)
tmp <- subset(st, Income > 5000)
tmp1 <- tmp[c("Income","Population","Area")]
tmp1
setwd("C:/WorkR")
write.csv(tmp1,"rich_state.csv", row.names = F)

#Q.5.2
ds <- read.csv("rich_state.csv", header = T)
head(ds)





