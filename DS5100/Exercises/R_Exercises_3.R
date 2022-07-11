#There's a difference between the phases of data in the pipeline, whether it is going to be 
# a narrow or a wide table to store data or to analysis this data
# SQL you'll store the data, which will typically be in a narrow database 
# when utilizing R or Python to do analysis, you'll want to look at wide data frames 

#Like pandas or numpy, you need to import the tidyverse library at the top of a script or notebook
# to be able to use it
library(tidyverse)

a <- "hello"
b <- "world"

c(a,b) %>%
  paste() %>%
  print()

tribble(
  ~x,~y,~z,
  "a",2,3,
  "b",4,5
)

# dplyr grammar --> check this over again when using R 

#readRDS("home/uxt5qb/Documents/MSDS/DS5100/DS5100-2022-06-RB/Exercises/chicago.rds")
# If the file is in your directory, you can double click on it, the path name I was using did not 
# work, the syntax is different than in python

dim(chicago)
str(chicago)
chicago
names(chicago)[1:3]

chicago %>%
  select(city:dptp)

i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

chicago %>%
  select(ends_with("2"))

chicago <- chicago %>%
  mutate(year = as.POSIXlt(date)$year + 1900)
head(chicago)

## Exercises

# Downloading the text file and then pulling it into a tibble named scores
scores <- 
  tibble(
    name = c("mike", "carol", "greg", "marcia", "peter", "jan", "bobby", "cindy", "alice"),
    school = c("south", "south", "south", "south", "north", "north", "north", "south", "south"),
    teacher = c("johnson", "johnson", "johnson", "johnson",  "smith", "smith", "smith", "perry", "perry"),
    sex = c("male", "female", "male", "female", "male", "female", "male", "female", "female"),
    math_score = c(4, 3, 2, 4, 3, 4, 5, 4, 5),
    reading_score = c(1, 5, 2, 4, 5, 4, 1, 5, 4)
  )

scores

# this is using the pipe method to take a 'slice' of the scores tibble
scores%>%
  slice(1:3)

# This is saving the slice of the tibble as scores_small
scores_small <- scores %>%
  slice(1:3)

scores_small

# sorting the data by the column math score

scores %>%
  arrange(desc(math_score))

# sorting by first name in ascending order, which is the default
scores%>%
  arrange(name)

# sort so that female first
scores%>%
  arrange(sex)

# grouping by sex and then looking at the mean for reading and math
scores%>%
  group_by(sex)%>%
  summarize(mean(reading_score),mean(math_score))

#arranging (sort) by each of these
scores%>%
  arrange(school, teacher, sex, math_score,reading_score)

# selecting particular columns in the scores tibble
scores%>%
  select(name,math_score,reading_score)

# select all columns but sex
scores%>%
  select(-sex)

# select all columns but math and reading 
scores%>%
  select(-reading_score, -math_score)

# keep all of the columns but re-arrange them so sex is the first
scores%>%
  select(sex, everything())

# Filter students who did well in math
scores%>%
  filter(math_score >=4)

# filer male and went to south
scores%>%
  filter(sex == 'male')%>%
  filter(school == 'south')


scores%>%
  filter(sex == 'male', school == 'south')

#filter reading scores of math > 4 and reading > 3
scores%>%
  filter(math_score >= '4', reading_score >= '3')

#filter students with reading scores of 2,3,4
scores%>%
  filter(reading_score <= '4', reading_score >= '2')

scores%>%
  filter(reading_score %in% 2:4)

#Filter for names that begin with m
scores%>%
  filter(substr(name,1,1) == 'm')

# filtering with group by
# filter whose best math student got a 5

scores%>%
  group_by(teacher)%>%
  filter(math_score == '5')

#Not correct
scores%>%
  group_by(teacher)%>%
  filter(max(math_score) == '5')

# Filter to the sex with a mean math score of 4
scores %>%
  group_by(sex)%>%
  filter(mean(math_score) == 4)

#create a new column called math_reading_avg
scores%>%
  mutate(math_reading_avg = (math_score+reading_score)/2)

#high math achiever, got a 4 or better 
scores%>%
  mutate(high_math_achiever = math_score >= 4)

# creating a reading score column - centering 

scores%>%
  group_by(teacher)%>%
  mutate(reading_score_centered_by_teacher = reading_score - mean(reading_score))

scores%>%
  group_by(teacher)%>%
  mutate(math_score_centered_by_teacher = math_score - mean(math_score))

# number of students in class 
scores%>%
  group_by(teacher)%>%
  mutate(number_of_students_in_class = n())

# summarize 

# use summarize to find the mean math score for all students 
scores %>%
  summarize(mean(math_score))

#find the median for both math and reading

scores%>%
  summarize(reading = median(reading_score),math = median(math_score))

#summarize and group by

scores%>%
  group_by(school)%>%
  summarize(min(math_score))

# maximum math score by teacher
scores%>%
  group_by(teacher)%>%
  summarize(max(math_score))

#Combining verbs 
scores%>%
  select(name, math_score)%>%
  mutate(math_score_ec = math_score + 5)%>%
  arrange(desc(math_score_ec))
  
scores%>%
  filter(teacher != 'smith')%>%
  group_by(sex)%>%
  summarize(mean_math_Score = mean(math_score))
  