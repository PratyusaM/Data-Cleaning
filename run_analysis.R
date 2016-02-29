run_analysis <- function() {
  
  
  
  ###Set file path and download file
  
  filesPath <- "C:\Users\Jhilmil\Documents\DataCleaning\Data-Cleaning"
  
  setwd(filesPath)
  
  fileUrl <- "https://urldefense.proofpoint.com/v2/url?u=https-3A__d396qusza40orc.cloudfront.net_getdata-252Fprojectfiles-252FUCI-2520HAR-2520Dataset.zip&d=AwIGAg&c=-dg2m7zWuuDZ0MUcV7Sdqw&r=Quq0Z2RzV8IVoEFou3cN4tMT1zXa2wr2MQ2x9L7rs1o&m=6RK601QOPxuiYzo_NyEce0IpLTomSroJKg9KcjZz7ss&s=EFqeIlPQDkCr3nCYSFUZTGTEeWpxMZ6oPEzy1z1xCXU&e= "
  
  download.file(fileUrl,destfile="./srcdata.zip")
  
  
  
  ###Unzip DataSet and set working directory
  
  unzip(zipfile="./srcdata.zip")
  
  setwd("./UCI HAR Dataset")
  
  
  
  ### Read the Files
  
  f_train_data <- read.table("./train/X_train.txt")
  
  a_train_data <- read.table("./train/y_train.txt")
  
  s_train_data <- read.table("./train/subject_train.txt")
  
  f_test_data <- read.table("./test/X_test.txt")
  
  a_test_data <- read.table("./test/y_test.txt") 
  
  s_test_data <- read.table("./test/subject_test.txt")
  
  
  
  ### Concatenate the training and test data
  
  f_data <- rbind(f_train_data, f_test_data)
  
  a_data <- rbind(a_train_data, a_test_data)
  
  s_data <- rbind(s_train_data, s_test_data)
  
  
  
  ### Name the variables in the data frames
  
  names(a_data) <- "Activity"
  
  names(s_data) <- "Subject"
  
  
  
  ### Read the features to name feature variables
  
  features <- read.table("features.txt")
  
  names(features) <- c("featureNum", "featureName")
  
  colnames(f_data) <- features$featureName
  
  
  
  ### select only the mean and standard deviation columns names
  
  featuresMeanStd <-  grep("mean\\(\\)|std\\(\\)",features$featureName,value=TRUE, ignore.case=TRUE)
  
  ##featuresMeanStd <-  grep(".*Mean.*|.*Std.*",features$featureName,value=TRUE, ignore.case=TRUE)
  
  
  
  ### Extract only the Mean and Standard Deviation Data
  
  f_mean_sd_data <- subset(f_data, select=featuresMeanStd)
  
  
  
  ### Put subject, activty number and activity value columns together
  
  subact_data <- cbind(s_data, a_data)
  
  all_data <- cbind(subact_data, f_mean_sd_data)
  
  
  
  ### Read the activity labels and replace activity num with descriptive activity names
  
  a_lbls <- read.table("activity_labels.txt")
  
  names(a_lbls) <- c("activityNum", "Activity")
  
  
  
  all_data$Activity <- as.character(all_data$Activity)
  
  for (i in 1:6){
    
    all_data$Activity[all_data$Activity == i] <- as.character(a_lbls[i,2])
    
  }
  
  
  
  ### Label the dataset with descriptive variable Names
  
  names(all_data)<-gsub("std()", "SD", names(all_data))
  
  names(all_data)<-gsub("mean()", "MEAN", names(all_data))
  
  names(all_data)<-gsub("^t", "time", names(all_data))
  
  names(all_data)<-gsub("^f", "frequency", names(all_data))
  
  names(all_data)<-gsub("Acc", "Accelerometer", names(all_data))
  
  names(all_data)<-gsub("Gyro", "Gyroscope", names(all_data))
  
  names(all_data)<-gsub("Mag", "Magnitude", names(all_data))
  
  names(all_data)<-gsub("BodyBody", "Body", names(all_data))
  
  
  
  ### Calculate the average of each variable for each activity and each subject
  
  t_data <- aggregate(. ~Subject + Activity, all_data, mean)
  
  t_data <- t_data[order(t_data$Subject,t_data$Activity),]
  
  write.table(t_data, file = "TidyData.txt", row.names = FALSE)
  

  
}

