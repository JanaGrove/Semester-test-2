```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
# Load required packages
library(tidyverse)
library(neuralnet)
library(NeuralNetTools)
library(MASS)
```

# STSM 2634 Semester Test 2

## Q1. Fibonacci Numbers using While Loop

Write a while loop to find the first 10 Fibonacci numbers {0, 1, 1, 2, 3, 5, 8, 13, 21, 34}.

```{r}
# Initialize variables
fib_sequence <- numeric(10)  # Vector to store Fibonacci numbers
fib_sequence[1] <- 0  # First Fibonacci number
fib_sequence[2] <- 1  # Second Fibonacci number
i <- 3  # Counter starting from 3rd position

# While loop to generate remaining Fibonacci numbers
while (i <= 10) {
  fib_sequence[i] <- fib_sequence[i-1] + fib_sequence[i-2]
  i <- i + 1
}

# Print the result
print("First 10 Fibonacci numbers:")
print(fib_sequence)
```

## Q2. Factorial using Repeat Loop

Write a repeat loop to find the factorial of a given number (5). Print error if number < 0.

```{r}
# Define the number
number <- 5

# Check if number is negative
if (number < 0) {
  print("Error: Factorial is not defined for negative numbers")
} else {
  # Initialize variables
  factorial_result <- 1
  i <- 1
  
  # Repeat loop to calculate factorial
  repeat {
    if (i > number) {
      break
    }
    factorial_result <- factorial_result * i
    i <- i + 1
  }
  
  # Print the result
  cat("Factorial of", number, "is:", factorial_result, "\n")
}
```

## Q3. Debug and Correct the Even Numbers Code

The code is meant to print the first five even numbers (2, 4, 6, 8, 10).

**Original (buggy) code:**
  ```{r, eval=FALSE}
# count <- 0
# num <- 1
# while (count <= 5) {
#   if (num %% 2 == 0) {
#     print(num)
#   }
#   num <- num + 1
# }
```

**Issues identified:**
  1. The loop condition `count <= 5` should be `count < 5` to get exactly 5 numbers
2. The `count` variable is never incremented, causing an infinite loop
3. The `count` should be incremented only when an even number is found

**Corrected code:**
  ```{r}
count <- 0
num <- 1

while (count < 5) {
  if (num %% 2 == 0) {
    print(num)
    count <- count + 1  # Increment count only when even number is found
  }
  num <- num + 1
}
```

## Q4. Artificial Neural Network (ANN) Model

Create an ANN model for mtcars data with 'mpg' as target variable.

```{r}
# Load the mtcars dataset
data(mtcars)

# Step 1: Scale the dataset around mean and standard deviation
scaled_data <- as.data.frame(scale(mtcars))

# Step 2: Split the dataset into training and test data (70:30 ratio)
set.seed(123)  # For reproducibility
sample_size <- floor(0.70 * nrow(scaled_data))
train_indices <- sample(seq_len(nrow(scaled_data)), size = sample_size)

train_data <- scaled_data[train_indices, ]
test_data <- scaled_data[-train_indices, ]

# Step 3: Fit ANN model with 2 hidden layers, 4 neurons each
# Create formula: mpg ~ all other variables
formula_ann <- as.formula(paste("mpg ~", paste(names(scaled_data)[-1], collapse = " + ")))

ann_model <- neuralnet(formula_ann, 
                       data = train_data, 
                       hidden = c(4, 4),  # 2 hidden layers with 4 neurons each
                       linear.output = TRUE,
                       threshold = 0.01)

# Step 4: Make predictions and measure accuracy
predictions <- predict(ann_model, test_data[, -1])  # Exclude mpg column
actual_values <- test_data$mpg

# Calculate accuracy metrics
mse <- mean((predictions - actual_values)^2)
rmse <- sqrt(mse)
mae <- mean(abs(predictions - actual_values))

cat("Model Accuracy Metrics:\n")
cat("Mean Squared Error (MSE):", mse, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")
cat("Mean Absolute Error (MAE):", mae, "\n")

# Step 5: Create graphical display of the ANN model
plotnet(ann_model, alpha = 0.6)
```

## Q5. Generalized Linear Model (GLM)

Fit a GLM for mtcars dataset using gaussian() family.

```{r}
# Load mtcars dataset
data(mtcars)

# Split dataset into training and test data (70:30 ratio)
set.seed(123)  # For reproducibility
sample_size <- floor(0.70 * nrow(mtcars))
train_indices <- sample(seq_len(nrow(mtcars)), size = sample_size)

train_data <- mtcars[train_indices, ]
test_data <- mtcars[-train_indices, ]

# Fit GLM model using gaussian family
glm_model <- glm(mpg ~ ., data = train_data, family = gaussian())

# Display model summary
summary(glm_model)

# Make predictions on test data
predictions <- predict(glm_model, newdata = test_data)
actual_values <- test_data$mpg

# Calculate Mean Squared Error (MSE)
mse <- mean((predictions - actual_values)^2)

cat("GLM Model Performance:\n")
cat("Mean Squared Error (MSE):", mse, "\n")

# Display predictions vs actual values
comparison <- data.frame(
  Actual = actual_values,
  Predicted = predictions,
  Residual = actual_values - predictions
)
print(comparison)
```

## Q6. Loan Balance Calculation using For Loop

Calculate remaining loan balance each year for 5 years.

```{r}
# Initial loan parameters
loan_amount <- 5000
annual_interest_rate <- 0.05
annual_payment <- 1000

# Initialize remaining balance
remaining_balance <- loan_amount

cat("Loan Balance Calculation:\n")
cat("Initial Loan Amount: $", loan_amount, "\n")
cat("Annual Interest Rate:", annual_interest_rate * 100, "%\n")
cat("Annual Payment: $", annual_payment, "\n\n")

# For loop to calculate balance for 5 years
for (year in 1:5) {
  # Apply interest and subtract payment
  remaining_balance <- remaining_balance * (1 + annual_interest_rate) - annual_payment
  
  cat("Year", year, "- Remaining Balance: $", round(remaining_balance, 2), "\n")
  
  # Check if loan is paid off
  if (remaining_balance <= 0) {
    cat("Loan paid off in year", year, "\n")
    break
  }
}
```

## Q7. Bank Account Balance using For Loop

Calculate bank account balance after each year for 10 years.

```{r}
# Initial account parameters
initial_deposit <- 1000
annual_interest_rate <- 0.02
annual_deposit <- 500

# Initialize account balance
account_balance <- initial_deposit

cat("Bank Account Balance Calculation:\n")
cat("Initial Deposit: $", initial_deposit, "\n")
cat("Annual Interest Rate:", annual_interest_rate * 100, "%\n")
cat("Annual Deposit: $", annual_deposit, "\n\n")

cat("Year 0 - Initial Balance: $", round(account_balance, 2), "\n")

# For loop to calculate balance for 10 years
for (year in 1:10) {
  # Apply interest and add annual deposit
  account_balance <- account_balance * (1 + annual_interest_rate) + annual_deposit
  
  cat("Year", year, "- Account Balance: $", round(account_balance, 2), "\n")
}

cat("\nFinal balance after 10 years: $", round(account_balance, 2), "\n")
```

# Alternative methods

# Q1: Fibonacci sequence using while loop
```{r}
fib <- c(0, 1)  # Initialize with first two numbers
i <- 2  # Index for the next number
while (length(fib) < 10) {
  fib[i + 1] <- fib[i] + fib[i - 1]  # Next Fibonacci number
  i <- i + 1
}
print(fib)
```
# Q2: Factorial using repeat loop
```{r}
n <- 5
if (n < 0) {
  print("Error: Factorial is not defined for negative numbers")
} else {
  factorial <- 1
  i <- 1
  repeat {
    if (i > n) break
    factorial <- factorial * i
    i <- i + 1
  }
  print(factorial)
}
```
# Q3: Corrected code for printing first five even numbers
```{r}
count <- 0
num <- 1
while (count < 5) {  # Stop after 5 even numbers
  if (num %% 2 == 0) {
    print(num)
    count <- count + 1
  }
  num <- num + 1
}
```
# Q4: ANN for mtcars dataset
```{r}
set.seed(123)  # For reproducibility

# Scale the dataset
data <- mtcars
data_scaled <- as.data.frame(scale(data))  # Standardize all variables

# Split into training (70%) and test (30%)
train_idx <- sample(1:nrow(data_scaled), 0.7 * nrow(data_scaled))
train_data <- data_scaled[train_idx, ]
test_data <- data_scaled[-train_idx, ]

# Fit ANN model
ann_model <- neuralnet(mpg ~ ., data = train_data, hidden = c(4, 4), linear.output = TRUE)

# Predict on test data
predictions <- predict(ann_model, test_data)

# Calculate MSE for accuracy
mse <- mean((test_data$mpg - predictions)^2)
cat("Mean Squared Error:", mse, "\n")

# Plot the ANN
plotnet(ann_model)
```
# Q5: GLM for mtcars dataset
```{r}
set.seed(123)  # For reproducibility

# Split into training (70%) and test (30%)
train_idx <- sample(1:nrow(mtcars), 0.7 * nrow(mtcars))
train_data <- mtcars[train_idx, ]
test_data <- mtcars[-train_idx, ]

# Fit GLM model
glm_model <- glm(mpg ~ ., data = train_data, family = gaussian())

# Predict on test data
predictions <- predict(glm_model, test_data)

# Calculate MSE
mse <- mean((test_data$mpg - predictions)^2)
cat("Mean Squared Error:", mse, "\n")
```
# Q6: Loan balance calculation
```{r}
loan_amount <- 5000
interest_rate <- 0.05
annual_payment <- 1000

balance <- loan_amount
for (year in 1:5) {
  balance <- balance * (1 + interest_rate) - annual_payment
  cat("Year", year, "Balance:", balance, "\n")
}
```
# Q7: Bank account balance calculation
```{r}
balance <- 1000
interest_rate <- 0.02
annual_deposit <- 500

for (year in 1:10) {
  balance <- balance * (1 + interest_rate) + annual_deposit
  cat("Year", year, "Balance:", balance, "\n")
}
```


