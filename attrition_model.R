# 1. Load Libraries
library(ggplot2)
library(dplyr)
library(caret)
library(randomForest)

# 2. Load Dataset
data <- read.csv("D://HR Analytics Attriction (Raw Data).csv", stringsAsFactors = FALSE)

# 3. Data Cleaning
# Remove useless columns
data$EmployeeNumber <- NULL
data$Over18 <- NULL
data$StandardHours <- NULL
data$EmployeeCount <- NULL

# Convert target variable
data$Attrition <- ifelse(data$Attrition == "Yes", 1, 0)

# Convert character columns to factors
data[] <- lapply(data, function(x) {
  if(is.character(x)) as.factor(x) else x
})

# Remove missing values
data <- na.omit(data)

# 4. Exploratory Data Analysis
# Attrition distribution
ggplot(data, aes(x = factor(Attrition))) +
  geom_bar(fill = "steelblue") +
  labs(title = "Attrition Distribution", x = "Attrition (0 = No, 1 = Yes)", y = "Count")

# Salary vs Attrition
ggplot(data, aes(x = MonthlyIncome, fill = factor(Attrition))) +
  geom_histogram(binwidth = 2000, alpha = 0.6, position = "identity") +
  labs(title = "Monthly Income vs Attrition")

# Age vs Attrition
ggplot(data, aes(x = Age, fill = factor(Attrition))) +
  geom_histogram(binwidth = 5, alpha = 0.6, position = "identity") +
  labs(title = "Age vs Attrition")

# Overtime vs Attrition
ggplot(data, aes(x = OverTime, fill = factor(Attrition))) +
  geom_bar(position = "dodge") +
  labs(title = "Overtime vs Attrition")

# 5. Train-Test Split
set.seed(123)

index <- sample(1:nrow(data), 0.8 * nrow(data))
train <- data[index, ]
test <- data[-index, ]

# 6. Logistic Regression Model
model_log <- glm(Attrition ~ ., data = train, family = "binomial")

# Predictions
prob_log <- predict(model_log, test, type = "response")
pred_log <- ifelse(prob_log > 0.5, 1, 0)

# 7. Random Forest Model
model_rf <- randomForest(as.factor(Attrition) ~ ., data = train, ntree = 100)

# Predictions
pred_rf <- predict(model_rf, test)

# 8. Evaluation Metrics
cat("Logistic Regression")
confusionMatrix(as.factor(pred_log), as.factor(test$Attrition))

cat("Random Forest")
confusionMatrix(pred_rf, as.factor(test$Attrition))

# 9. Feature Importance
varImpPlot(model_rf)

# 10. Export Predictions (FOR TABLEAU / POWER BI)
# Add predictions to test data
test$Predicted_Attrition <- pred_rf

# Create Risk Level
test$Risk_Level <- ifelse(test$Predicted_Attrition == 1, "High Risk", "Low Risk")

# Save file
write.csv(test, "D:/attrition_predictions.csv", row.names = FALSE)
