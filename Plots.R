Data visualisation

data("airquality")
head(airquality)
  # n = 20
  # or  head(airquality,n) and tail(airquality,n)
summary(airquality)

data.ozone <- airquality$Ozone
data.temp <- airquality$Temp
data.wind <- airquality$Wind

# Missing values
is.na(data.ozone)
any(is.na(data.ozone))
# Remove missing values
data.ozone <- data.ozone[!is.na(data.ozone)]

# Plotting
library(ggplot2)

  # customize theme
  library(tidyverse)
  library(hrbrthemes)
  # Add title or labs
  + ggtitle("Sepal length vs. Sepal width")
  + labs(title = "this vs. that", x="Label X", y="Label Y")

# ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) + <GEOM_FUNCTION>()
# ggplot(data = <DATA>) + <GEOM_FUNCTION>(mapping =aes(<MAPPINGS>))

# Scatter plot
ggplot(data = airquality, 
       mapping = aes(x = Ozone, y = Temp)
       ) + geom_point()

ggplot(airquality, aes(x=Ozone, y=Temp)) + geom_point() + theme_classic()

    # Change the color, size, alpha or shape of each class
        # color=class, size=class, alpha=class, shape=class
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

    # Change color of all points, this is done outside aes
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

    # Split plot in facets, subplots and each display one subset of the data
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# Connected scatter point
ggplot(airquality, aes(x=Temp, y=Wind)
       ) + geom_point(alpha=0.5, color="blue", size=3
        ) + geom_line()
        # You do not need to add alpha, size, color, fill, shape

ggplot( iris, aes(x=Sepal.Length, y=Sepal.Width)
        ) + geom_line(color="white") +
            geom_point(shape=21, color="black", fill="red", size=1)

# Correlation
library(GGally)
    # For correlation plots the data should be a data frame
df = data.frame(airquality$Ozone, airquality$Wind, airquality$Temp)

ggpairs(df)
ggcorr(data.frame(airquality))

# Boxplot
    # Data should be a factor variable, convert numeric data to factor data, or data frame

ToothGrowth$dose <- as.factor(ToothGrowth$dose)
ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_boxplot(outlier.colour = "red")
  # Coordinate flip     + coord_flip()

# Smooth line
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), color="red")
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv), show.legend = FALSE)

# Smooth line and facet wrap
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv), 
              show.legend = FALSE)+
  facet_wrap(~manufacturer)

# Smooth line and scatter points
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Bar plot
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

# Stat summary
ggplot(airquality) + 
  stat_summary(mapping = aes(x=Temp, y=Wind))

ggplot(data=diamonds) + geom_bar(mapping=aes(x=cut, fill=cut))

# Histogram
ggplot(mpg, aes(x = hwy)) +
  geom_histogram()

ggplot(mpg, aes(x = hwy)) +
  geom_histogram(bins = 20, fill = "blue", color = "white")

ggplot(mpg, aes(x = hwy)) +
  geom_histogram(fill = "blue", color = "white") +
  ggtitle("Highway MPG Distribution") +
  labs(x = "Highway MPG", y = "Frequency")

    # You can add the density function    + geom_density() +
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(aes(y = ..density..), fill = "blue", color = "white") +
  geom_density()+
  ggtitle("Highway MPG Distribution") +
  labs(x = "Highway MPG", y = "Frequency")+
  theme_classic()


# Line chart
library(tidyverse)

ggplot(economics, aes(x = date, y = pce)) +
  geom_line()

ggplot(data = economics, aes(x = date, y = unemploy)) +
  geom_line(color = "red", size = 1.5) +
  labs(title = "U.S. Unemployment Rate Over Time", x = "Year", y =
         "Unemployment Rate")

# Multiple line plots
data <- data.frame(
  time = c(1, 2, 3, 4, 5),
  group1 = c(5, 7, 6, 8, 9),
  group2 = c(3, 4, 5, 7, 8),
  group3 = c(2, 3, 5, 6, 7)
)

ggplot(data, aes(x = time)) +
  geom_line(aes(y = group1), color = "red") +
  geom_line(aes(y = group2), color = "blue") +
  geom_line(aes(y = group3), color = "green") +
  labs(x = "Time", y = "Value", title = "Multiple line plot")



