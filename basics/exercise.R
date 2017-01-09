# An exercise for working with basic data in R

# Create a vector `students` with three names in it
students <- c('Rashmi', 'Amelia', 'Allen')

# Create a vector `math.grades` that represents grades for each person (0 - 100 scale)
math.grade <- c(97, 95, 96)

# Create a vector `spanish.grades` that represents grades for each person (0 - 100 scale)
spanish.grades <- c(85,90,96)

# Use the `data.frame` function to combine `students`, `math.grades`, and `spanish.grades` into a variable `people`
people <- data.frame(students,math.grade, spanish.grades)
 
# Calculate a new column `average` which is the average grade across courses
# Hint: calculate the average manually, not with any functions
people$average <- ((people$math.grade + people$spanish.grades) / 2)

# Which student(s) had the highest average grade?
#Allen had the highest average
highest.average <- people[people$average == max(people$average),'students']

# Which students had lower spanish grades than math grades?
#Both Rashmi and Amelia had lower spanish grades
spanish.lower.grade <- people[people$math.grade > people$spanish.grades, 'students']

# Plot the relationship between math and spanish grades using the `plot` function
plot(people$math.grade,people$spanish.grades)
