# Load libraries
library(class)
library(ggplot2)

# Training data
train_features <- data.frame(
  age = c(25, 30, 45, 50, 23, 40),
  income = c(30, 40, 70, 80, 25, 65),
  label = c("Buy","Buy","NotBuy","NotBuy","Buy","NotBuy")
  
  
)

# Scale features
scaled_train <- scale(train_features[, c("age", "income")])

# Test data
test_features <- data.frame(age = 28, income = 35)
scaled_test <- scale(test_features, 
                     center = attr(scaled_train, "scaled:center"), 
                     scale = attr(scaled_train, "scaled:scale"))

# Run KNN (k=3)
pred <- knn(train = scaled_train,
            test = scaled_test,
            cl = train_features$label,
            k = 3)

print(pred)

