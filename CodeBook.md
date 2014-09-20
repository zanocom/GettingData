
## CodeBook for "Getting and Cleaning Data" Course Project

The file run_analysis.R processes the file downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unzipped into the working folder.
The final output provides a tidy dataset with variables containing measures of mean and standard deviation.


### Dataset Description
The UCI HAR Dataset folder contains data from the
"Human Activity Recognition Using Smartphones" Dataset.

The datasets contains data regarding 561 variables observed from
30 participants while performing 6 different activities.

Provided data are:  
* activity_labels.txt with descriptive activity labels  
* features.txt with the 561 variables labels  

The subfolders train and test contain data regarding:  
* 561 variables observed (file X_... .txt)  
* the performed activity (file y_... .txt)  
* the observed subject (file subect_... .txt)  


### Processing Steps
Data have been processed in the following way:  
1. train and the test datasets are created merging X_... , y_... and subject_... datasets  
2. the descriptive y variable is added to train and test datasets  
3. train and test datasets are merged to create one data set  
4. integrity of data is checked (no NAs, no x variables outside the -1,+1 range)  
5. columns regarding mean and standard deviation for each measurement are selected   
6. descriptive activity names are used to replace original variable names  
7. variables regarding angles are removed from the selected columns  
8. creates a tidy dataset with average of each variable for each activity and each subject  


### Variables Description
The output file tidy_dataset.txt contains the following variables:

1. "activity": factor with 6 levels
        performed activity
        1 WALKING
        2 WALKING_UPSTAIRS
        3 WALKING_DOWNSTAIRS
        4 SITTING
        5 STANDING
        6 LAYING

2. "subject": 2
        observed subject
        1-30
      
3. "time.Body.LinearAcceleration.mean...X" 7 numeric with range -1/+1  
4. "time.Body.LinearAcceleration.mean...Y" 7 numeric with range -1/+1  
5. "time.Body.LinearAcceleration.mean...Z" 7 numeric with range -1/+1  
6. "time.Body.LinearAcceleration.std...X" 7 numeric with range -1/+1  
7. "time.Body.LinearAcceleration.std...Y" 7 numeric with range -1/+1  
8. "time.Body.LinearAcceleration.std...Z" 7 numeric with range -1/+1  
9. "time.Gravity.LinearAcceleration.mean...X" 7 numeric with range -1/+1  
10. "time.Gravity.LinearAcceleration.mean...Y" 7 numeric with range -1/+1  
11. "time.Gravity.LinearAcceleration.mean...Z" 7 numeric with range -1/+1  
12. "time.Gravity.LinearAcceleration.std...X" 7 numeric with range -1/+1  
13. "time.Gravity.LinearAcceleration.std...Y" 7 numeric with range -1/+1  
14. "time.Gravity.LinearAcceleration.std...Z" 7 numeric with range -1/+1  
15. "time.Body.LinearAcceleration.Jerk.mean...X" 7 numeric with range -1/+1  
16. "time.Body.LinearAcceleration.Jerk.mean...Y" 7 numeric with range -1/+1  
17. "time.Body.LinearAcceleration.Jerk.mean...Z" 7 numeric with range -1/+1  
18. "time.Body.LinearAcceleration.Jerk.std...X" 7 numeric with range -1/+1  
19. "time.Body.LinearAcceleration.Jerk.std...Y" 7 numeric with range -1/+1  
20. "time.Body.LinearAcceleration.Jerk.std...Z" 7 numeric with range -1/+1  
21. "time.Body.AngularVelocity.mean...X" 7 numeric with range -1/+1  
22. "time.Body.AngularVelocity.mean...Y" 7 numeric with range -1/+1  
23. "time.Body.AngularVelocity.mean...Z" 7 numeric with range -1/+1  
24. "time.Body.AngularVelocity.std...X" 7 numeric with range -1/+1  
25. "time.Body.AngularVelocity.std...Y" 7 numeric with range -1/+1  
26. "time.Body.AngularVelocity.std...Z" 7 numeric with range -1/+1  
27. "time.Body.AngularVelocity.Jerk.mean...X" 7 numeric with range -1/+1  
28. "time.Body.AngularVelocity.Jerk.mean...Y" 7 numeric with range -1/+1  
29. "time.Body.AngularVelocity.Jerk.mean...Z" 7 numeric with range -1/+1  
30. "time.Body.AngularVelocity.Jerk.std...X" 7 numeric with range -1/+1  
31. "time.Body.AngularVelocity.Jerk.std...Y" 7 numeric with range -1/+1  
32. "time.Body.AngularVelocity.Jerk.std...Z" 7 numeric with range -1/+1  
33. "time.Body.LinearAcceleration.Magnitude.mean.." 7 numeric with range-1/+1  
34. "time.Body.LinearAcceleration.Magnitude.std.." 7 numeric with range -1/+1  
35. "time.Gravity.LinearAcceleration.Magnitude.mean.." 7 numeric with range -1/+1  
36. "time.Gravity.LinearAcceleration.Magnitude.std.." 7 numeric with range -1/+1  
37. "time.Body.LinearAcceleration.Jerk.Magnitude.mean.." 7 numeric with range -1/+1  
38. "time.Body.LinearAcceleration.Jerk.Magnitude.std.." 7 numeric with range -1/+1  
39. "time.Body.AngularVelocity.Magnitude.mean.." 7 numeric with range -1/+1  
40. "time.Body.AngularVelocity.Magnitude.std.." 7 numeric with range -1/+1  
41. "time.Body.AngularVelocity.Jerk.Magnitude.mean.." 7 numeric with range -1/+1  
42. "time.Body.AngularVelocity.Jerk.Magnitude.std.." 7 numeric with range -1/+1  
43. "fft.Body.LinearAcceleration.mean...X" 7 numeric with range -1/+1  
44. "fft.Body.LinearAcceleration.mean...Y" 7 numeric with range -1/+1  
45. "fft.Body.LinearAcceleration.mean...Z" 7 numeric with range -1/+1  
46. "fft.Body.LinearAcceleration.std...X" 7 numeric with range -1/+1  
47. "fft.Body.LinearAcceleration.std...Y" 7 numeric with range -1/+1  
48. "fft.Body.LinearAcceleration.std...Z" 7 numeric with range -1/+1  
49. "fft.Body.LinearAcceleration.meanFreq...X" 7 numeric with range -1/+1  
50. "fft.Body.LinearAcceleration.meanFreq...Y" 7 numeric with range -1/+1  
51. "fft.Body.LinearAcceleration.meanFreq...Z" 7 numeric with range -1/+1  
52. "fft.Body.LinearAcceleration.Jerk.mean...X" 7 numeric with range -1/+1  
53. "fft.Body.LinearAcceleration.Jerk.mean...Y" 7 numeric with range -1/+1  
54. "fft.Body.LinearAcceleration.Jerk.mean...Z" 7 numeric with range -1/+1  
55. "fft.Body.LinearAcceleration.Jerk.std...X" 7 numeric with range -1/+1  
56. "fft.Body.LinearAcceleration.Jerk.std...Y" 7 numeric with range -1/+1  
57. "fft.Body.LinearAcceleration.Jerk.std...Z" 7 numeric with range -1/+1  
58. "fft.Body.LinearAcceleration.Jerk.meanFreq...X" 7 numeric with range -1/+1  
59. "fft.Body.LinearAcceleration.Jerk.meanFreq...Y" 7 numeric with range -1/+1  
60. "fft.Body.LinearAcceleration.Jerk.meanFreq...Z" 7 numeric with range -1/+1  
61. "fft.Body.AngularVelocity.mean...X" 7 numeric with range -1/+1  
62. "fft.Body.AngularVelocity.mean...Y" 7 numeric with range -1/+1  
63. "fft.Body.AngularVelocity.mean...Z" 7 numeric with range -1/+1  
64. "fft.Body.AngularVelocity.std...X" 7 numeric with range -1/+1  
65. "fft.Body.AngularVelocity.std...Y" 7 numeric with range -1/+1  
66. "fft.Body.AngularVelocity.std...Z" 7 numeric with range -1/+1  
67. "fft.Body.AngularVelocity.meanFreq...X" 7 numeric with range -1/+1  
68. "fft.Body.AngularVelocity.meanFreq...Y" 7 numeric with range -1/+1  
69. "fft.Body.AngularVelocity.meanFreq...Z" 7 numeric with range -1/+1  
70. "fft.Body.LinearAcceleration.Magnitude.mean.." 7 numeric with range -1/+1  
71. "fft.Body.LinearAcceleration.Magnitude.std.." 7 numeric with range -1/+1  
72. "fft.Body.LinearAcceleration.Magnitude.meanFreq.." 7 numeric with range -1/+1  
73. "fft.Body.BodyLinearAcceleration.Jerk.Magnitude.mean.." 7 numeric with range -1/+1  
74. "fft.Body.BodyLinearAcceleration.Jerk.Magnitude.std.." 7 numeric with range -1/+1  
75. "fft.Body.BodyLinearAcceleration.Jerk.Magnitude.meanFreq.." 7 numeric with range -1/+1  
76. "fft.Body.AngularVelocity.Magnitude.mean.." 7 numeric with range -1/+1  
77. "fft.Body.AngularVelocity.Magnitude.std.." 7 numeric with range -1/+1  
78. "fft.Body.AngularVelocity.Magnitude.meanFreq.." 7 numeric with range -1/+1  
79. "fft.Body.AngularVelocity.Jerk.Magnitude.mean.." 7 numeric with range -1/+1  
80. "fft.Body.AngularVelocity.Jerk.Magnitude.std.." 7 numeric with range -1/+1  
81. "fft.Body.AngularVelocity.Jerk.Magnitude.meanFreq.." 7 numeric with range -1/+1


The variables 3-81 contain original variables regarding means and standard deviations of processed signals. These variables are then averaged for each subject and activity.
The names of the variables 3-81 contain the following information:
- time vs fft : domain of the signal (time vs fast fourier transform)
- Body vs Gravity : body signal vs gravity signal
- LinearAcceleration vs AngularVelocity: singal from accelerometer vs signal from gyroscope
- Jerk : derivation of signal with respect to time
- Magnitude: Euclidean norm
- X vs Y vs Z : axis of the signal
