#Week 4: dplyr package
setwd("~/Downloads/R Projects - ANA 500")
#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
eye_hair_variation <- as_tibble(HairEyeColor)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(eye_hair_variation)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(dplyr)

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
eye_hair_variation %>% select(Hair, Sex)


#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name

hair_sex <- eye_hair_variation %>% select(Hair, Sex)
hair_sex

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
select(hair_sex, -Sex)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
rename(hair_sex, Gender = Sex)


#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
hair_gender <- rename(hair_sex, Gender = Sex)
hair_gender

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
only_males <- filter(hair_gender, Gender == "Male")
only_males


#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
hair_gender %>% group_by(Gender)


#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here:__32__
total=mutate(hair_gender, total=cumsum(Freq))


#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
only_females <- filter(hair_gender, Gender == "Female")
only_females

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
rows_joined <- bind_rows(only_males, only_females)
print(rows_joined)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
hair_gender %>% slice (2:8)
