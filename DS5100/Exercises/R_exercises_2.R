# Exercise 11:
# start with 1, next is 1 and then add the previous number
fib <- numeric(10)
#the first and second position in fib sequence are equal to 1
fib[1] <- fib[2] <- 1
# then after that for the value i from 3:10 it is fib[3-2] + fib[3-1] which would equal 1 + 2 = 3
for (i in 3:10) fib[i] <- fib[i-2] + fib[i-1]
fib

#Convert the previous code into a function 

fib2 <- function(n=10){
  fib2 <numeric(n)
  fib2[1] <- fib2[2] <- 1
  for (i in 3:n) fib2[i] <- fib[i-2] + fib[i-1]
  return(fib2)
}

#Write a function that takes a numeric x and returns 1 if 0<=x<=1, else returns 0

hello <- function(x) {
  if (x >= 0 & x<1) {
    return(1)
  }
  else {
    return(0)
  }
}

#11.5 Write an R program to extract first 10 english letters in lower case and last 10 letters 
# in upper case and extract letters between 22nd to 24th letters in upper case

print(letters[0:9])
print(LETTERS[15:26])

# Print 1 to 100 and print 'Fizz; for multiples of 3, print Buzz for multiple of 5
# print FizzBuzz for multiples of both

for (i in 1:100){
  if (i %% 3 == 0 & i %% 5 == 0) {print('FizzBuzz')}
  else if (i%%3 == 0) {print('Fizz')}
  else if (i%%5 == 0) {print('Buzz')}
  else print(n)
}

# Write an R program to get the unique elements of a given string and unique number of vector

x <- c(13,21,13,34,15,17)
ux <- unique(x)
ux

# Exercise 11.8
max(x)
min(x)

# Exercise 11.9
seq(20,50)
mean(seq(20,60))
sum(seq(51,91))

#11.10 Create a data frame from four given vectors
a <- c(1,2,3,4)
b <- c(5,6,7,8)
c <- c(9,10,11,12)
d <- c(13,14,15,16)

df <- data.frame(a,b,c,d)
df

#11.11 Use the built-in data frane mtcars and create a plot to compare mpg, cyl and hp
plot(mtcars[,c("mpg","cyl","hp")])
