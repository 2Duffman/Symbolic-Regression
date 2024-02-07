# Load necessary library
library(readr)

# Source the formula.R file
source("formula.R")

# Read the data
data <- read_csv("distance_8.csv")
# Calculate the number of rows that correspond to 80% of the data
num_rows <- round(0.8 * nrow(data))

# Fit the model to the first 80% of the data
model <- lm(my_formula, data = data[1:num_rows, ])

# Print a summary of the model
print(summary(model))

# Make a prediction on the last 20% of the data
prediction <- predict(model, newdata = data[(num_rows + 1):nrow(data), ])

# Calculate the RMSE
rmse <- sqrt(mean((data$saldo_final_target[(num_rows + 1):nrow(data)] - prediction)^2))
print(paste("Root Mean Squared Error: ", rmse))