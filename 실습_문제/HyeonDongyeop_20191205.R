#
# ?òÑ?èô?óΩ
# ?ûë?Ñ±?ùº : 2019.12.04 //?†úÏ∂úÏùº : 2019.12.05
#

#Î¨∏Ï†ú1)
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

#Î¨∏Ï†ú2)
st <- data.frame(state.x77)
st
#Q.1
boxplot(st)

#Q.2 --------------
install.packages("dplyr")
library(dplyr)
st %>% filter(population)

.libPaths("C:/R/library")
.libPaths()
#Q.3 ------------------


# Î¨∏Ï†ú3)
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

#Q.5 --------------


#AQ[is.na(AQ)] <- colMeans(AQ,na.rm=T)
for( i in 1:ncol(AQ)){
  AQ[is.na(AQ)[,i],][,i] <- mean(AQ[,i],na.rm=T)
  
}
AQ
AQ2 <- AQ
AQ2




# πÆ¡¶4)

# Q.1
library(dplyr)
st <- as.data.frame(state.x77)
st %>% arrange(Population)

#Q.2
st %>% arrange(desc(Income))

#Q.3
dt<- st %>% arrange(Illiteracy) %>% 
  head(10)
st %>% group_by(rownames(st)) %>% 
  arrange(Illiteracy)

# πÆ¡¶5)

#Q.1
mt.gear <- split(mtcars, mtcars$gear)
mt.gear


#Q.2
mt.gear$`4`


#Q.3
mt.gear.35 <- merge(mt.gear$`3`,mt.gear$`5`, all = T)
mt.gear.35



#Q.4
subset(mtcars, wt<3.0 & wt > 1.5)

# πÆ¡¶6)

#Q.1
authors <- data.frame( surname = c( "Twein", "Venables", "Tierney", "Ripley", "McNeil" ),
                       nationality = c( "US", "Australia", "US", "UK", "Australia" ),
                       retired = c( "yes", rep( "no", 4 ) ) )
books <- data.frame( name = c( "Johns", "Venables", "Tierney", "Ripley", "Ripley", "McNeil" ),
                     title = c( "Exploratory Data Analysis", 
                                "Modern Applied Statistics ...",
                                "LISP-STAT",
                                "Spatial Statistics", "Stochastic Simulation",
                                "Interactive Data Analysis" ),
                     other.author = c( NA, "Ripley", NA, NA, NA, NA ) )

authors
books
merge(authors,books,by.x = "surname",
      by.y = "name")

#Q.2
merge(authors,books,by.x = "surname",
      by.y = "name",all.x = T)
#Q.3
merge(authors,books,by.x = "surname",
      by.y = "name",all.y  = T)


#Q.4
merge(authors,books,by.x = "surname",
      by.y = "other.author")


