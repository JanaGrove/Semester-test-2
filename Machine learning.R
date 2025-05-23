# Regression analysis

# Simple linear regression
  # Fit the simple linear regression model
model <- lm(Sepal.Length ~ Sepal.Width, data = iris)
summary(model)
  # plotting regression line
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE,  color="red", linetype="dashed") +
  theme_minimal() +
  labs(title="Simple Linear Regression: MPG vs Weight",
       x="Weight",
       y="Miles per Gallon",
       caption="Red line represents the regression line")

# Multiple linear regression
  # Fit the multiple linear regression model
model <- lm(mpg ~ wt + disp + hp, data = mtcars)
summary(model)

# Logistic regression
  # Fit the logistic regression model
model <- glm(vs ~ mpg + wt + hp, data = mtcars, family = binomial)
summary(model)

# Support Vector Regression (SVR)
    # Support Vector Machine (SVM)
  library(e1071)
  library(ggplot2)

  # Load the mtcars dataset
  data("mtcars")
  
  # Fit the SVR model predicting mpg based on wt and hp
  svr_model <- svm(mpg ~ wt + hp, data = mtcars, type = "eps-regression",
                 kernel = "radial")
  
  # Make predictions over a grid to plot
  wt_seq <- seq(min(mtcars$wt), max(mtcars$wt), length.out = 100)
  hp_seq <- seq(min(mtcars$hp), max(mtcars$hp), length.out = 100)
  grid <- expand.grid(wt = wt_seq, hp = hp_seq)
  grid$mpg <- predict(svr_model, newdata = grid)
  # Basic plot of the fitted surface
  ggplot(grid, aes(x = wt, y = hp, fill = mpg)) +
    geom_tile() +
    geom_contour(aes(z = mpg), color = "white") +
    labs(title = "SVR Model Prediction of mpg",
       x = "Weight (1000 lbs)",
       y = "Horsepower",
       fill = "Miles per Gallon") +
    theme_minimal()+
    
  # Optionally add the actual data points
  geom_point(data = mtcars, aes(x = wt, y = hp, color = mpg), size = 3)

  # Identify the indices of the support vectors
  support_vector_indices <- svr_model$index
  
  # Extract the support vectors from the original data
  support_vectors <- mtcars[support_vector_indices, ]
  
  # Add the support vectors to the plot with a different shape or color to
  distinguish them
  ggplot(grid, aes(x=wt,y=hp,fill=mpg))+
    geom_tile()+
    geom_contour(aes(z=mpg),color = "white")+
    geom_point(data = mtcars, aes(x=wt,y=hp),color= "white", size=5)+
    geom_point(data = support_vectors,aes(x=wt,y=hp), color = "red", size = 5,
               shape=8)+
    # Red squares for support vectors
    labs(title = "SVR Model Prediction of mpg",
         x = "Weight (1000 lbs)",
         y = "Horsepower",
         fill = "Miles per Gallon") +
    theme_minimal()

# Evaluate performance using Mean Squared Error (MSE)
  predictions <- predict(svr_model, mtcars)
  mse <- mean((mtcars$mpg - predictions)^2)
  print(paste("MSE: ", mse))

# Artificial Neural Network (ANN)
  library(neuralnet)
  nn_model <- neuralnet(mpg ~ wt + hp, data = mtcars, hidden = 2)
  print(nn_model)

  #Plotting the Neural Network
  plot(nn_model)

  # Making Predictions
  predictions <- compute(nn_model, mtcars[,c("wt", "hp")])
  head(predictions$net.result)
  
  
  
# Support Vector Machines (SVM): 
  SVMs are effective in high dimensional spaces, and
  when the number of dimensions is greater than the number of samples.
# Artificial Neural Networks (ANN): 
  ANNs are capable of modeling complex, non-linear relationships and 
  can be highly effective on large datasets with many input variables.

  # Load necessary libraries
  library(ggplot2)
  library(lattice)
  library(e1071)
  library(neuralnet)
  library(caret)
  
  # Split the mtcars data into training and testing datasets
  set.seed(123)
  trainIndex <- createDataPartition(mtcars$mpg, p = .8,
                                    list = FALSE,
                                    times = 1)
  mtcarsTrain <- mtcars[ trainIndex,]
  mtcarsTest <- mtcars[-trainIndex,]
  
  # Train a SVM model
  svm_model <- svm(mpg ~ ., data = mtcarsTrain)
  # Make predictions
  svm_predictions <- predict(svm_model, mtcarsTest)
  
  # Train a neural network model
  nn_model <- neuralnet(mpg ~ ., data = mtcarsTrain, hidden = 2)
  # Make predictions
  nn_predictions <- compute(nn_model, mtcarsTest[,-1])
  
  # Evaluate models
  svm_MSE <- postResample(svm_predictions, mtcarsTest$mpg)
  nn_MSE <- postResample(nn_predictions$net.result, mtcarsTest$mpg)
  print(svm_MSE)
  print(nn_MSE)
