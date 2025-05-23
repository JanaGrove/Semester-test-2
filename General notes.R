# notes

c()             # used for a set of numbers/characters
array()         # used for highr dimesion matrices
seq(x,y,d)      # sequence between x and y at difference of ‘d’

# Call dataset 
data()          # show all the data sets in R
data_a <- iris
car = mtcars

# Usefull operatos , class slides 13

Comparison operators: 
  == (equal to), 
  != (not equal to), 
  < (less than), 
  > (greater
   
Logical operators: 
  & (and), 
  | (or),  
  ! (not) 
  are used to combine logical expressions. 
  For example, x > 3 & y < 5 returns TRUE if both x is greater than 3 and y
     is less than 5.                                                                       

Modulus operator: 
  %% returns the remainder of a division.     

%in% operator: 
  checks if an element is present in a vector. For example, “a” %in%
  c(“a”, “b”, “c”) returns TRUE, since “a” is present in the vector c(“a”, “b”, “c”).

Pipe operator: 
  %>% is used in the tidyverse packages for chaining functions together. 
  For example, df %>% filter(x > 3) %>% select(y) applies the filter()
  function to the df data frame to keep only rows where x is greater than 3, 
  and then applies the select() function to keep only the y column.

Colon operator ‘:’ 
  creates a sequence of numbers. For example, 1:5 creates a vector
  containing the numbers 1 through 5.
  
  
# Import data into R
  Data_name <- read.csv("~/Data_file.csv")
  attach(Data_name)

