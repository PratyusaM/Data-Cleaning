---
title: "Codebook"
author: "Pratyusa"
date: "February 29, 2016"
output: html_document
---
This document describes the source data information and the data in the output tidy dataset created by this project as follows.                                           
                      * Information about Source Dataset        
                      * Description of Source Data        
                      * Tidy Data File Data Description         

## Information about Source Data Set 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) at their waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. More information about the experiment can be found at 

## Description of Source Data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) – both using a low pass Butterworth filter.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to indicate frequency domain signals).

###Description of abbreviations of measurements   

leading t or f is based on time or frequency measurements.  

Body = related to body movement    
Gravity = acceleration of gravity    
Acc = accelerometer measurement  
Gyro = gyroscopic measurements   
Jerk = sudden movement acceleration   
Mag = magnitude of movement   

Mean and SD are calculated for each subject for each activity for each mean and SD measurements.
The units given are **g’s** for the accelerometer and **rad/sec** for the gyro and **g/sec** and **rad/sec/sec** for the corresponding jerks.   

These signals were used to estimate variables of the feature vector for each pattern:   

‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.    
They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.

* tBodyAcc-XYZ     
* tGravityAcc-XYZ    
* tBodyAccJerk-XYZ    
* tBodyGyro-XYZ    
* tBodyGyroJerk-XYZ   
* tBodyAccMag    
* tGravityAccMag   
* tBodyAccJerkMag   
* tBodyGyroMag   
* tBodyGyroJerkMag   
* fBodyAcc-XYZ   
* fBodyAccJerk-XYZ   
* fBodyGyro-XYZ   
* fBodyAccMag   
* fBodyAccJerkMag   
* fBodyGyroMag   
* fBodyGyroJerkMag   

The set of variables that were estimated from these signals are:

mean(): Mean value    
std(): Standard deviation   
mean(): Mean value    
std(): Standard deviation    
mad(): Median absolute deviation    
max(): Largest value in array    
min(): Smallest value in array    
sma(): Signal magnitude area   
energy(): Energy measure. Sum of the squares divided by the number of values     
iqr(): Interquartile range    
entropy(): Signal entropy   
arCoeff(): Autorregresion coefficients with Burg order equal to 4   
correlation(): correlation coefficient between two signals   
maxInds(): index of the frequency component with largest magnitude   
meanFreq(): Weighted average of the frequency components to obtain a mean frequency   
skewness(): skewness of the frequency domain signal     
kurtosis(): kurtosis of the frequency domain signal     
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.   
angle(): Angle between to vectors.   

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:   

gravityMean   
tBodyAccMean   
tBodyAccJerkMean   
tBodyGyroMean   
tBodyGyroJerkMean   

The complete list of variables of each feature vector is available in **'features.txt'** 

## Tidy Data File Data Description
The output tidy data set contains the average of only the measurements on the mean and standard deviation for each measurement for each activity and each subject. There are 66 mean and standard deviation features averaged for each Subject by activity. For 30 subjects and 6 activities the resulting file has 180 rows and 68 columns – 33 Mean variables and 33 Standard deviation variables and 1 Subject( 1 of of the 30 test subjects) and ActivityName. The  first row is the header containing the names for each column. Following describes teh variables in the tidy dataset.

```{r}
Subject                         Char	1     Identifies the subject under Observation

Activity                        Char	18    Identifies the activity being performed by the subject
                                                Valid Values: 
                                                WALKING
                                                WALKING_UPSTAIRS
                                                WALKING_DOWNSTAIRS
                                                SITTING
                                                STANDING
                                                LAYING

The following 66 variables represent the mean and stadard deviation features averaged for each subject by activity.   

They are all numeric and values are within [-1. 1].

timeBodyAccelerometer-MEAN()-X                  Numeric                    
timeBodyAccelerometer-MEAN()-Y                  Numeric
timeBodyAccelerometer-MEAN()-Z                  Numeric
timeBodyAccelerometer-SD()-X                    Numeric                            
timeBodyAccelerometer-SD()-Y                    Numeric
timeBodyAccelerometer-SD()-Z                    Numeric      
timeGravityAccelerometer-MEAN()-X               Numeric
timeGravityAccelerometer-MEAN()-Y               Numeric    
timeGravityAccelerometer-MEAN()-Z               Numeric
timeGravityAccelerometer-SD()-X                 Numeric        
timeGravityAccelerometer-SD()-Y                 Numeric
timeGravityAccelerometer-SD()-Z                 Numeric
timeBodyAccelerometerJerk-MEAN()-X              Numeric
timeBodyAccelerometerJerk-MEAN()-Y              Numeric        
timeBodyAccelerometerJerk-MEAN()-Z              Numeric         
timeBodyAccelerometerJerk-SD()-X                Numeric     
timeBodyAccelerometerJerk-SD()-Y                Numeric        
timeBodyAccelerometerJerk-SD()-Z                Numeric
timeBodyGyroscope-MEAN()-X                      Numeric 
timeBodyGyroscope-MEAN()-Y                      Numeric   
timeBodyGyroscope-MEAN()-Z                      Numeric   
timeBodyGyroscope-SD()-X                        Numeric   
timeBodyGyroscope-SD()-Y                        Numeric    
timeBodyGyroscope-SD()-Z                        Numeric       
timeBodyGyroscopeJerk-MEAN()-X                  Numeric   
timeBodyGyroscopeJerk-MEAN()-Y                  Numeric   
timeBodyGyroscopeJerk-MEAN()-Z                  Numeric    
timeBodyGyroscopeJerk-SD()-X                    Numeric    
timeBodyGyroscopeJerk-SD()-Y                    Numeric    
timeBodyGyroscopeJerk-SD()-Z                    Numeric    
timeBodyAccelerometerMagnitude-MEAN()           Numeric         
timeBodyAccelerometerMagnitude-SD()             Numeric       
timeGravityAccelerometerMagnitude-MEAN()        Numeric        
timeGravityAccelerometerMagnitude-SD()          Numeric       
timeBodyAccelerometerJerkMagnitude-MEAN()       Numeric        
timeBodyAccelerometerJerkMagnitude-SD()         Numeric       
timeBodyGyroscopeMagnitude-MEAN()               Numeric        
timeBodyGyroscopeMagnitude-SD()                 Numeric       
timeBodyGyroscopeJerkMagnitude-MEAN()           Numeric        
timeBodyGyroscopeJerkMagnitude-SD()             Numeric       
frequencyBodyAccelerometer-MEAN()-X             Numeric        
frequencyBodyAccelerometer-MEAN()-Y             Numeric        
frequencyBodyAccelerometer-MEAN()-Z             Numeric        
frequencyBodyAccelerometer-SD()-X               Numeric       
frequencyBodyAccelerometer-SD()-Y               Numeric       
frequencyBodyAccelerometer-SD()-Z               Numeric       
frequencyBodyAccelerometerJerk-MEAN()-X         Numeric       
frequencyBodyAccelerometerJerk-MEAN()-Y         Numeric      
frequencyBodyAccelerometerJerk-MEAN()-Z         Numeric        
frequencyBodyAccelerometerJerk-SD()-X           Numeric       
frequencyBodyAccelerometerJerk-SD()-Y           Numeric       
frequencyBodyAccelerometerJerk-SD()-Z           Numeric       
frequencyBodyGyroscope-MEAN()-X                 Numeric        
frequencyBodyGyroscope-MEAN()-Y                 Numeric       
frequencyBodyGyroscope-MEAN()-Z                 Numeric        
frequencyBodyGyroscope-SD()-X                   Numeric       
frequencyBodyGyroscope-SD()-Y                   Numeric        
frequencyBodyGyroscope-SD()-Z                   Numeric       
frequencyBodyAccelerometerMagnitude-MEAN()      Numeric        
frequencyBodyAccelerometerMagnitude-SD()        Numeric       
frequencyBodyAccelerometerJerkMagnitude-MEAN()  Numeric      
frequencyBodyAccelerometerJerkMagnitude-SD()    Numeric       
frequencyBodyGyroscopeMagnitude-MEAN()          Numeric        
frequencyBodyGyroscopeMagnitude-SD()            Numeric       
frequencyBodyGyroscopeJerkMagnitude-MEAN()      Numeric        
frequencyBodyGyroscopeJerkMagnitude-SD()        Numeric      
```    
