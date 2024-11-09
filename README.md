## Project Overview
The goal of this project is to clean and summarize the Human Activity Recognition dataset, creating a tidy dataset for further analysis.
## Files Included
Files in this repository and their purpose:
* **run_analysis.R**: R script that performs the data cleaning and analysis.
* **CodeBook.md**: Detailed documentation of all variables and processing steps.
* **tidy_data_avg.txt**: Output dataset containing the mean of each variable for each activity and each subject.
## Running the Analysis
You can use the provided Devcontainer to run the script (if you are using VSCode) or if you have R installed already, simply Open R, set your working directory to the folder containing the `run_analysis.R` file, and run the script. 
All required packages are already included in the script and will be automatically installed.
## Summary of Analysis Steps
1. **Download and Unzip Data**: Download the dataset and unzip it.
2. **Load Activity Labels and Features**: Import descriptive labels and feature names.
3. **Merge Training and Test Sets**: Combine the training and test datasets into a single dataset.
4. **Extract Mean and Standard Deviation Columns**: Select only columns containing "mean" or "std" measurements.
5. **Label Activities**: Map activity IDs to descriptive names.
6. **Summarize Data**: Calculate the average of each measurement for each subject-activity pair.
7. **Save Tidy Dataset**: Output the summarized data to tidy_data_avg.txt.

Each row in tidy_data_avg.txt represents average measurement for each activity and subject.