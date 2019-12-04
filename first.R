#
# R 프로그래밍 1일차
#
# first.R
#
# yeop777
#
# 최초작성일 : 2019. 11. 26
#
#
print("Hello, World!")

number <- 10
number2 <- 100
number3 <- number


numberValue <- 1            #camel표기법
str_value <- "R Language"   #snake 표기법
booleanvalue <- TRUE

numberValue <- "R script"
numberValue <- 1

print(numberValue)
print(str_value)
print(booleanvalue)


cat("Numeric number:", numberValue, "\n")
cat("String value:", str_value,"\n")
cat("Boolean values : ", booleanvalue,"\n")

numberValue <- scan()  #입력 명령 
cat("Numeric number:", numberValue,"\n")

number1 <- 10
number2 <- 20
resultAdd <- number1 + number2
resultSub <- number1 - number2
resultMul <- number1 * number2
resultDiv <- number1 / number2
resultRem <- number1 %% number2
resultSec <- number2 ^ 5

print(resultAdd)
print(resultSub)
print(resultMul)
print(resultDiv)
print(resultRem)
print(resultSec)

number1 <- 0
number1 <- number1 + 10
number1
number1 <- number1 + 10
number1
number1 <- number1 + 10
number1

number2 <- 100
number1 <- number2 + 10
number1
number2
print(number1 + 10 * number2 / 2)
number300 <- 10
number300 <- number300 + 10
number300

number301 <- number300 * 2 
number301

number1 <- 10.5
number2 <- 10
print(number1 > number2)
print( number1 >= number2)
print(number1 < number2)
print(number1 <= number2)
print(number1 == number2)
print(number1 != number2)

print(number1 > 10 & number2 > 10)   # AND
print(number1 > 10 | number2 > 10)   # OR
print(!(number1 > 10))               # NOT


number <- "100"
str <- " R language"
result <- number + str
print(result)


#
#제어문 - 선택구조
#
job.type <- 'A'

if (job.type == 'B') {
    bonus <- 200        #참일때
} else {
    bonus <- 100        #거짓일때
}
cat("job type:", job.type, "\t\tbonus:", bonus)



job.type <- 'B'

if (job.type == 'A'){
    bonus <- 200
}
cat("job type:", job.type, "\t\tbonus:", bonus)





score <- 85

if (score >= 90) {
    grade = 'A'
} else if (score >= 80) {
    grade = 'B'
} else if (score >= 70) {
    grade = 'c'
} else if (score >= 60) {
    grade = 'D'
} else {
    grade <- 'F'
}
cat("score:", score, "\t\tgrade:", grade)




number <- 10
number
if (number %% 2 ==1){
    oddeven <- '홀수'
}else {
    oddeven <- '짝수'
}
cat ( "Number:", number,"는", oddeven,"이다.")


a <- 5
b <- 20

if ( a > 5 & b > 5) {
    cat(a,"> 5 and ", b, "> 5")
} else {
    cat(a, "<=5 or", b , "<=5")
}




a <-10
b <- 20

if ( a > b) {
    c <-a
} else {
    c <-b
}
cat("a=",a,"\tb=",b,"\tc=",c)

c <- ifelse( a> b , a,b)  #ifelse함수   #base패키지에 속함
cat("a=",a,"\tb=",b,"\tc=",c)

#Q. 세 변수 중 제일 큰 수를 max에 저장 후 max를 출력
a <- 1
b <- 3
c <- 2

if (a > b & a>c){
    max <- a
} else if (b > a & b>c){
    max <-b
} else {
    max <-c
}
cat("a=",a,"b=",b,"c=",c,"max=",max)


#max <- a
#if ( b> max) {
# max = b
#}
#if (c > max) {
#    max = c
#}

#
# 반복 구조
#

for ( i in 1:10) {
    print('*')
}

multiple = 2
for ( i in 2:9) {
    cat(multiple, 'X',i, '=', multiple*i, '\n' )
}


# while문

i <- 1

while (i <= 10) {
    print(i)
    i <- i +1
}

multiple <- 2
i <-2
while (i <=9){
    cat(multiple, 'X',i, '=', multiple*i, '\n' )
    i <- i+1
}

#Q. 1~ 100까지 한줄에 10개씩 출력

for(i in 1:100){
    cat(i," ")
    if (i %% 10 == 0){
        cat(i,'\n')
    }
}

linecount <- 1
for(i in 1:100){
    cat(i, ' ')
    linecount <- linecount + 1
    if (linecount > 10) {
        print('\n')
        linecount <-1
    }
}


#Q. 1~1000까지 3의 배수와 5의 배수를 한 줄에 10개씩 출력하고
#마지막에 개수를 출력

#1. 1~1000까지 반복
# 1.1 3의 배수인지 판별
# 1.2 5의 배수인지 판별
# 1.3 3의배수이거나 5의배수이면 개수를 세고, 그 수를 출력
#2. 출력

check <- 0
sum <-0
for(i in 1:1000){
    if (i %% 3 ==0 | i %% 5 == 0){
        cat(i,' ')
        check <- check + 1
        sum <- sum + i
    }
    if (check %% 10 ==0){
        cat('\n')
    }
    
}
check
sum


i <- 1
count <- 0
linecount <-1
multiple3 <- NULL
multiple5 <- NULL
while ( i <= 1000) {
    multiple3 <- i %% 3
    multiple5 <- i %% 5
    if (multiple3 == 0 | multiple5 == 0) {
        count <- count + 1
        cat( i, " ")
        linecount <- linecount + 1
        if ( linecount > 10) {
            linecount <- 1
            print('\n')
        }
    } 
}
i <- i + 1





