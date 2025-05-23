Loops in R

If else condition

if (condition) {
 Code to execute if condition is TRUE
} else {
 Code to execute if condition is FALSE
}

# Define a variable
x <- 10
# Check if x is greater than 5
if (x > 5) {
  # If x is greater than 5, check if it's even or odd
  if (x %% 2 == 0) {
    print("x is greater than 5 and even")
  } else {
    print("x is greater than 5 and odd")
  }
} else {
  print("x is less than or equal to 5")
}


For loop

for (variable in sequence) {
 statement(s)
}

i <- 0
for (i in 1:5){
  print(i)}
}

# Initialize variables
n <- 5
total <- 0
# Loop through the sequence of numbers and add them up
for (i in 1:n) {
  total <- total + i
}
# Print the total
print(total)


# Initialize variables
start <- 2
end <- 10
step <- 2
total <- 0
# Loop through the sequence of numbers and add them up
for (i in seq(from=start, to=end, by=step)) {
  print(i)
  total <- total + i
}
