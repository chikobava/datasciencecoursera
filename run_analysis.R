#!/usr/bin/env Rscript
# Download data files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "dataset.zip"
dest_folder <- "./data"
dest_file <- file.path(dest_folder, filename)

# Create folder structure and download/unzip the data files if they don't already exist
if (!dir.exists(dest_folder)) dir.create(dest_folder)
if (!file.exists(dest_file)) download.file(url, destfile = dest_file)
unzip(dest_file, exdir = dest_folder)

# Load the necessary libraries
if (!require(dplyr)) install.packages("dplyr")
library(dplyr)
har_folder <- file.path(dest_folder, "UCI HAR Dataset")

# Read activity labels and feature names
activity_labels <- read.table(
  file.path(har_folder, "activity_labels.txt"),
  col.names = c("id", "activity")
)
features <- read.table(
  file.path(har_folder, "features.txt"),
  col.names = c("index", "feature_name")
)

# Read activity IDs for training data and merge with activity labels
y_train <- read.table(
  file.path(har_folder, "train", "y_train.txt"),
  col.names = "id"
)
y_train_labeled <- left_join(y_train, activity_labels, by = "id")

# Read subject IDs for training data
subject_train <- read.table(
  file.path(har_folder, "train", "subject_train.txt"),
  col.names = "subject"
)

# Read feature measurements for training data and label columns
x_train <- read.table(
  file.path(har_folder, "train", "X_train.txt"),
  col.names = features$feature_name
)

# Combine subject, activity, and feature data into one training dataset
train_data <- cbind(subject_train, y_train_labeled, x_train)

# Repeat the same process for the test data
y_test <- read.table(
  file.path(har_folder, "test", "y_test.txt"),
  col.names = "id"
)
y_test_labeled <- left_join(y_test, activity_labels, by = "id")
subject_test <- read.table(
  file.path(har_folder, "test", "subject_test.txt"),
  col.names = "subject"
)
x_test <- read.table(
  file.path(har_folder, "test", "X_test.txt"),
  col.names = features$feature_name
)

# Combine subject, activity, and feature data into one test dataset
test_data <- cbind(subject_test, y_test_labeled, x_test)

# Merge the training and test datasets to create one complete dataset
full_data <- rbind(train_data, test_data)

# Filter for columns containing 'mean' and 'std' as per assignment requirements
filtered_data <- full_data %>%
  select(subject, activity, contains("mean"), contains("std"))

# Create the tidy dataset by grouping by activity and subject, and summarizing 
# each measurement by calculating the mean, as required by the assignment
tidy_data <- filtered_data %>%
  group_by(activity, subject) %>%
  summarise(across(everything(), mean), .groups = "drop")

# Write the tidy dataset to a file
write.table(tidy_data, file = "tidy_data_avg.txt", row.names = FALSE)

