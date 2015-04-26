


Code Book
========================================================

This is the Code Book for the Course Project of the Coursera course Getting and Cleaning Data.

### Data

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

#### Data set information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

The orignal data source can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Variables created and used in run_analysis

"activity_id": Identifies the activity of a participant (integer)

"activity_name" : The names of participants' recorded actions: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING (factor)

"subject_id": ID given to each subject (integer)

"sdNames" / "meanNames" : names of the measures (mean and standard deviation) to be included in the final tidy data set (factor)

### Data Processing
run_analysis.R reads test-, train-, mean-, and standard deviation- data from the original dataset into one tidy dataset.
The data is first read from the separate source data files, then activity labels are joined to the activity data sets.
Test and training data are combined into one larger data set.
Then only mean and std values are kept in the data set (avg_data)
Finally the tidy data set is written out as a text file