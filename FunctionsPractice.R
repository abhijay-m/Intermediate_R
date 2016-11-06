# Functions
?mean
?min
?max
?sd

# creating function
# name of the function
# function statement
# some argument
# body
# return statement (optional)

my_sum <-function(input_1, input_2) {
  tot = input_1 + input_2
  return(tot)
}

# Assigning values
input_1 = 3
input_2 = 4
input_1 + input_2

# Calling a function
my_sum(input_1=2, input_2=4)
my_sum(input_1=4, input_2=5)

# Native function in R
sum(input_1, input_2)

# converting Farenheight to Kelvin
FtoK <- function(temp) {
  kelvin <- ((temp -32) * (5 / 9) + 273.15)
  return(kelvin)
}

FtoK(temp = 32)

# converting Kelvin to Celcius
KtoC <- function(temp) {
  celcius <- temp - 273.15
  return(celcius)
}

KtoC(temp = 0)

# write a function to convert farenheight to celcius
FtoC <- function(temp) {
  celcius <- (KtoC(FtoK(temp)))
  return(celcius)
}

FtoC(temp = 32)

# Exercise 2
best_practice <- c('write', 'programs', 'for', 'people', 'not', 'computers')
asterix <- '***'

# write a function called 'fence' that takes two arguments &
# returns a new vector with asterix at the beginning and the end

fence <- function(input1, input2) {
  result <- c(input2, input1, input2)
  return(result)
}

fence(input1 = best practice, input2 = asterix)

# doing something with real dataset

dir.create("data") #create a directory called data
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder.csv")

data1 <- read.csv("data/gapminder.csv", header=TRUE)
head(data1)

summary(data1)

# write a function called analzye that takes country as an argument and displays
# mean, min, and max lifeExp of that country

# subsetting the dataframe
country_name <- subset(data1, data1$country == "Uganda")
head(country_name)
summary(country_name)

# calculate mean, min, and max of lifeExp
mean(country_name[,5])
min(country_name[,5])
max(country_name[,5])

# function
analyze <- function(countr) {
  country_name <- subset(data1, data1$country == countr)
  #print(mean(country_name[,5]))
  #print(min(country_name[,5]))
  #print(max(country_name[,5]))
  out <- c("mean_le" = mean(country_name[,5]), "min_le" = min(country_name[,5]), "max_le" = max(country_name[,5]))
  print(out)
}

analyze("Uganda")
analyze("Afghanistan")
analyze("Albania")
analyze("Algeria")

# modify the analyze function to generate a plot with "year" on x-axis and lifeExp on y-axis

analyze <- function(countr) {
  country_name <- subset(data1, data1$country == countr)
  #print(mean(country_name[,5]))
  #print(min(country_name[,5]))
  #print(max(country_name[,5]))
  out <- c("mean_le" = mean(country_name[,5]), "min_le" = min(country_name[,5]), "max_le" = max(country_name[,5]))
  print(out)
  plot(country_name$year, country_name$lifeExp, xlab = "Year", ylab = "Life Expectancy", main = countr)
}

analyze("Uganda")
analyze("Algeria")

best_practice_fun <- function(some_argument) {
  print(some_argument[1])
  print(some_argument[2])
  print(some_argument[3])
  print(some_argument[4])
  print(some_argument[5])
  print(some_argument[6])
}

best_practice_fun(best_practice)

for (w in best_practice) {
  print(w)
  
}

best_practice_fun2 <- function(some_argument) {
  for (w in some_argument) {
    print(w)
  }
}

best_practice_fun2(best_practice)

# Generate a file that contains years "1952" and "1997" & name it gapminder_52_97
# and another file that contains years "1967" and "2007" & name it gapminder_66_07
# hint: use subset with &

gapminder_52_97 <- subset(data1, data1$year == 1952 | data1$year == 1997)
head(gapminder_52_97)

gapminder_67_07 <- subset(data1, data1$year == 1967 | data1$year == 2007)
head(gapminder_67_07)

# writing a dataset
write.csv(file = "data/gapminder_52_97.csv", gapminder_52_97, row.names = FALSE, quote = FALSE)
write.csv(file = "data/gapminder_67_07.csv", gapminder_67_07, row.names = FALSE, quote = FALSE)

# listing the files with a pattern in a directory
filesnames <- list.files(path = "data", pattern = ".csv", full.names = TRUE)

# write a for loop to print each filename on a different line

for (f in filesnames) {
  print(f)
}