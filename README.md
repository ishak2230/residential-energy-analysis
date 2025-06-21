# Predicting and Optimizing Household Energy Usage in a Changing Climate

This project applies advanced data science and machine learning techniques to model and optimize residential energy consumption patterns under projected climate change scenarios. Using over 4 million records across multiple counties, our system forecasts electricity usage with precision and delivers actionable insights for infrastructure planning and energy policy formulation.

## Objective

To **predict future residential energy usage** in single-family homes—especially under a 5°C increase in temperature—and **develop optimization strategies** that improve grid efficiency, reduce costs, and guide infrastructure investments.

## Project Summary

- **Data Source:** Energy, weather, and static house metadata from South Carolina counties  
- **Scope:** 4.2M+ records | 133 columns | 100+ features | Appliance-level breakdown  
- **Problem Statement:** *“How can we accurately predict and manage future energy usage in single-family houses, particularly in the context of rising temperatures, to optimize energy efficiency and reduce costs?”*

## Technologies Used

- **R Programming** (tidyverse, glmnet, caret, shiny)
- **Machine Learning Models:** LASSO, Ridge, Elastic Net, Linear Regression
- **Visualization:** ggplot2, Shiny dashboard
- **Data Engineering:** Feature engineering, normalization, outlier handling, multi-source data merging
- **Data Sources:** AWS-hosted `.parquet` files (static house data, energy usage logs, weather records)

## Key Insights

- **Temperature Sensitivity:** Energy usage shows strong correlation with temperature, especially due to HVAC systems.
- **Appliance Load:** Cooling systems and refrigeration units are the most energy-intensive appliances.
- **Geospatial Patterns:** Counties with higher urban density and pool ownership exhibit significantly higher summer energy consumption.
- **Solar Impact:** Homes with solar installations consume substantially less energy, making solar adoption a key recommendation.

## Models and Methodology

### 1. **Data Preprocessing**
- Merged energy, static, and weather datasets using nested loops and time-zone alignment
- Removed multicollinear and low-variance features using correlation analysis and VIF
- Applied regular expressions to extract numeric values from mixed-type fields
- Imputed missing values using MICE, KNN, and domain-specific logic
- Normalized and transformed data using Z-score, MinMax, and Box-Cox scaling

### 2. **Modeling**
- **LASSO Regression**: For feature selection and interpretability
- **Ridge Regression**: To handle multicollinearity
- **Elastic Net**: Hybrid model combining Ridge and LASSO
- **Linear Regression**: As a baseline benchmark
- **Evaluation Metrics**: RMSE, MAE, R² on hold-out test sets

### 3. **Shiny Web App**
An interactive dashboard to visualize:
- Appliance-wise energy consumption
- County-wise usage heatmaps
- Energy prediction under future temperature scenarios

## Recommendations
- **Incentivize solar panel adoption** with financial rebates and awareness programs
- **Transition pool heating systems** to solar or hybrid for efficiency gains
- **Promote LED lighting** through rebate programs and educational campaigns
- **Encourage insulation upgrades** in colder regions to reduce heating costs
