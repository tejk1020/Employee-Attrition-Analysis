# Employee Attrition Analysis

## Project Overview

This project focuses on analyzing employee attrition and predicting which employees are likely to leave. The workflow combines statistical modeling in R with an interactive Tableau dashboard to translate analysis into business insights.

## Problem Statement

Employee attrition leads to increased hiring costs and productivity loss. The goal is to:
* Identify factors influencing resignation (age, salary, department).
* Use classification algorithms.
* Build a dashboard for HR with KPIs.

## Tools Used

* **R** → Data preprocessing, EDA, and model building
* **Tableau** → Interactive dashboard

## Data Analysis (R)

Key steps performed:

* Removed missing values
* Converted categorical variables
* Performed exploratory data analysis using ggplot2

### Key Visualizations:

* Attrition distribution (0 vs 1)
* Monthly Income vs Attrition 
* Age vs Attrition
* Overtime vs Attrition
* Correlation between features


## Model Development

A classification model was built to predict attrition.

* **Model Used:** Logistic Regression / Random Forest
* **Target Variable:** Attrition (0 = No, 1 = Yes)

### Evaluation Metrics

* **Logistic Regression (Accuracy):** *0.898*
* **Random Forest (Accuracy):** *0.8605*
* ROC curve used to evaluate classification performance

Recall is prioritized to correctly identify employees likely to leave.
## Visualizations (R)
### Attrition distribution 
<img width="600" height="400" alt="Attrition Distribution" src="https://github.com/user-attachments/assets/bb6643ab-6983-458d-bcc8-edfb131c143a" />

### Monthly Income vs Attrition
<img width="600" height="400" alt="Monthly Income vs Attrition" src="https://github.com/user-attachments/assets/904d591c-ad8f-4deb-81e5-2154f1087766" />

### Age vs Attrition
<img width="600" height="400" alt="Age vs Attrition" src="https://github.com/user-attachments/assets/1e275fcd-5a96-40c0-a2b1-d4c62950fb2f" />

### Overtime vs Attrition
<img width="600" height="400" alt="Overtime vs Attrition" src="https://github.com/user-attachments/assets/225885a0-c20a-44e2-ad07-8aa05afcf552" />

### Correlation between features
<img width="600" height="400" alt="Feature Importance" src="https://github.com/user-attachments/assets/bad9141c-eca1-4820-92a5-b9a32d0977e0" />

## Dashboard (Tableau)

The dashboard converts analysis into actionable insights.

### Features:

* KPI Cards:
  * Total Employees
  * Attrition Rate
  * Attrition
* Attrition Rate by Department
* Employee Attrition Rate vs Income (with Employee Distribution)
* Employee Attrition Rate by Age Group (with Employee Distribution)
* Attrition Rate by Overtime Status
* Attrition Rate by Job Satisfaction Level

## Key Insights

* Employees with low tenure are more likely to leave
* Overtime significantly increases attrition probability
* Certain departments show consistently higher attrition
* Salary has an impact but is not the strongest factor

## Dashboard Preview
<img width="900" height="700" alt="Dashboard" src="https://github.com/user-attachments/assets/8dafbe98-5239-4f65-b350-260ddaf9a8ec" />

## Conclusion

This project demonstrates how combining predictive modeling with visualization helps organizations proactively manage employee attrition.

## Author

### Tej Kadam
### GitHub: [https://github.com/yourusername](https://github.com/tejk1020)
