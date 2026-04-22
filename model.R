# 1. Load Libraries
library(caret)
library(randomForest)

# 2. Load Dataset
data <- read.csv("D:/HR Analytics Attriction (Raw Data).csv", stringsAsFactors = FALSE)

# 3. Basic Inspection
str(data)
summary(data)

# 4. Data Cleaning
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

# 9. Export Predictions (FOR TABLEAU / POWER BI)
# Add predictions to test data
test$Predicted_Attrition <- pred_rf

# Create Risk Level
test$Risk_Level <- ifelse(test$Predicted_Attrition == 1, "High Risk", "Low Risk")

# Save file
write.csv(test, "D://attrition_predictions (Cleaned Data).csv", row.names = FALSE)
