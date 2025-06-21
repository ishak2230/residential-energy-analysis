# Data preparation
library(caret)
library(glmnet)

data_clean <- sampled_df %>%
  mutate_if(is.character, as.factor) %>%
  mutate_if(is.factor, as.numeric)

# Feature and target
X <- as.matrix(data_clean[, -which(names(data_clean) == "energy_usage")])
y <- data_clean$energy_usage

# LASSO
lasso_model <- cv.glmnet(X, y, alpha = 1)

# Ridge
ridge_model <- cv.glmnet(X, y, alpha = 0)

# Elastic Net
enet_model <- cv.glmnet(X, y, alpha = 0.5)

# Linear regression
lm_model <- lm(energy_usage ~ ., data = data_clean)
