###############################################
# Getting and Cleaning Data Course
# 2014/09/16
###############################################
#The following script creates a tidy dataset from 
# Human Activity Recognition Using Smartphones dataset

# Steps:
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.


rm(list=ls())

# Download date
# date()    # "Sat Sep 13 08:27:37 2014"

# merge datasets
# First labels activity and subject of train and test datasets separately
# Then merges datasets

# Load Datasets
    activity <- read.table (".\\UCI HAR Dataset\\activity_labels.txt"  ,sep="",header=F)
    
    X_train <- read.table (".\\UCI HAR Dataset\\train\\X_train.txt"  ,sep="",header=F)
    y_train <- read.table (".\\UCI HAR Dataset\\train\\y_train.txt"  ,sep="",header=F)
    subject_train <- read.table (".\\UCI HAR Dataset\\train\\subject_train.txt"  ,sep="",header=F)
    
    y_train_lab <- activity$V2[y_train$V1]  # descriptive output variable
    train_df <- cbind ( X_train , y_lab =  y_train_lab ,  subject = subject_train$V1 ) # train data frame
    
    
    X_test <- read.table (".\\UCI HAR Dataset\\test\\X_test.txt"  ,sep="",header=F)
    y_test <- read.table (".\\UCI HAR Dataset\\test\\y_test.txt"  ,sep="",header=F)
    subject_test <- read.table (".\\UCI HAR Dataset\\test\\subject_test.txt"  ,sep="",header=F)
    y_test_lab <- activity$V2[y_test$V1]
    test_df <- cbind ( X_test ,  y_lab = y_test_lab , subject =  subject_test$V1 ) # test data frame
      
    dataset <- rbind ( train_df , test_df )  # merge datasets
    

# check integrity 
#    summary( dataset )
#    apply ( X= dataset[,1:561] , MARGIN=2 , FUN= function(x) sum(is.na(x)) )  # no NAs
#    apply ( X= dataset[,1:561] , MARGIN=2 , FUN= function(x) sum( abs(x)>1   ) ) # no values exceeding boundaries



# select columns with mean  and std measures
# we do not select angle measures
    column_names <- read.table (".\\UCI HAR Dataset\\features.txt" ,sep=" " , header=F )
    
    #str ( column_names )  # 561 x 2
    #levels( column_names$V2 )
    
    ind <- grep( "[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", column_names$V2 )  # index of columns with mean and std
    ind_angle <- grep( "angle", column_names$V2 )  # index of columns with angle measures
    ind <- setdiff( ind , ind_angle )

    indf <- as.numeric( column_names$V2[ind] )   #index of factor level of selected column names 
    column_labels <- levels(column_names$V2)[indf]
    
    dataset <- dataset[ , c(ind,562,563) ]    
    #head ( dataset )


#Appropriately labels the data set with descriptive variable names.
   col_labels <- c ( column_labels , "activity" , "subject" )  #labels of selected columns
  
  # Transformations aimed to better readability
  col_labels <- sub( pattern="^t" , replacement="time." , x=col_labels     )
  col_labels <- sub( pattern="^f" , replacement="fft." , x=col_labels     )
  col_labels <- sub( pattern="Body" , replacement="Body." , x=col_labels     )
  col_labels <- sub( pattern="Gravity" , replacement="Gravity." , x=col_labels     )
  col_labels <- sub( pattern="BodyLinear" , replacement="Linear" , x=col_labels     )
  col_labels <- sub( pattern="BodyGyro" , replacement="Gyro" , x=col_labels     )
  
  col_labels <- sub( pattern="Acc" , replacement="LinearAcceleration" , x=col_labels     )
  col_labels <- sub( pattern="Gyro" , replacement="AngularVelocity" , x=col_labels     )
  col_labels <- sub( pattern="Mag" , replacement=".Magnitude" , x=col_labels     )
  col_labels <- sub( pattern="Jerk" , replacement=".Jerk" , x=col_labels     )

    colnames(dataset) <- col_labels


# Creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

  library (dplyr )
  #str ( dataset)
  dataset <- tbl_df ( dataset )  # create tbl object

  tidy_df <- dataset%.%
              group_by ( activity , subject )%.%
              summarise_each(funs(mean))

  
  # Export tidy dataset
write.table( x= tidy_df  , file="tidy_dataset.txt" , sep=","  , row.names=FALSE  )

###############################################

