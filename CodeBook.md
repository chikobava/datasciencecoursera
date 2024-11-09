# Code Book for the Human Activity Recognition (HAR) Tidy Dataset
## Introduction
This dataset summarizes data collected from accelerometers and gyroscopes on smartphones worn by participants. The objective is to create a tidy summary dataset with measurements grouped by activity and subject.

## Data Collection and Sources
The original dataset was collected from the UCI Machine Learning Repository.Data includes accelerometer and gyroscope measurements, captured for different subjects performing various activities.
## Variables

### Identifiers:
* subject: Unique identifier for the individual performing the activity, an integer from 1 to 30.
* activity: Descriptive label for the activity performed. Possible values:
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

### Mean and Standard Deviation Measurements:
These measurements, derived from smartphone accelerometer and gyroscope data, capture movement across three axes in both the time and frequency domains. The variable names encode details about the signal, measurement type, and axis.


### Structure of Variable Names**
The variable names follow this structure: prefix-domain-SignalType-Measurement-Axis, where:
* prefix: t or f, indicating whether the measurement is from the time domain (t) or the frequency domain (f).
* domain: Indicates the type of signal, such as BodyAcc (Body Acceleration) or GravityAcc (Gravity Acceleration).
* SignalType: Describes the type of measurement, such as Acc (Acceleration) or Gyro (Gyroscope).
* Measurement: Indicates whether the variable is a mean (mean()) or standard deviation (std()).
* Axis: X, Y, or Z, indicating the axis of the measurement (if applicable).

### Example Variable Names
* tBodyAcc-mean()-X: Mean of time-domain body acceleration along the X-axis.
* tBodyAcc-std()-Y: Standard deviation of time-domain body acceleration along the Y-axis.
* fBodyGyro-mean()-Z: Mean of frequency-domain body gyroscope measurement along the Z-axis.
* fBodyAccJerk-std()-X: Standard deviation of the jerk signal from body acceleration along the X-axis, in the frequency domain.

### Units
All measurements are normalized and dimensionless, as they are standardized to have values between -1 and 1.

### Transformations and Summaries
1. Combined training and test datasets, then labeled each activity with descriptive names.
2. Extracted only columns containing means and standard deviations for each measurement.
3. Cleaned and labeled the data set with descriptive variable names.


### Summarization:
The final **tidy_data_avg.txt** dataset summarizes each variable by calculating the mean across all observations, grouped by activity and subject.