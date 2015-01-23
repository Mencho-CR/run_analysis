# run_analysis
Project for Getting and Cleaning Data in R

Ok, so this is what I did step by step instructions are in the code, but this is the strategy I followed

* A. I loaded all the files needs into R using read.table
* B. I worked with train and test separetely and didn't join the Data Frame until the end, whatever I did to the DF
related to Train I would repeat it in Test.
* C. I used the features variable to assign variable names to the X_train / X_test Data Frames using 
names(x_train) <- feat[,2]  
* D. I understood that Y_Train and Y_test was actually the activity label (1 to 6) so I added a column to 
X_train/X_test with the Y_Train/Test vector
* E. I also added a column with the subjet number for the same reason and in the same way
* F. Loades both plyr and dplyr packages in that order
* G. Turned xy_train and xy_test data frames into tbl_df usable in dplyr
* H. With dplyr, select and contain I was able to keep the variables with mean and std in their name
also kept subject and activity_id variables
* I. I added a column to keep track of wich date came from the Test and which from the Train files(wasn't needed
in this exercise, but good practice)
* J. Finally a added the rows of Train and Test together in a Big_Table
* K. Changed the names of activ_lbl variables to make it easy to merge
* J. Merged Big_Table with activ_lbl based on the activity label number
* L. Because they were not needed anymore I removed both activity number and Test/Train columns
* M. Combining group_by and summarise_each I got the tidy data that was requested

This script transform the data allocated y several files

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'X_train.txt': Training set.

* 'y_train.txt': Training labels.

* 'X_test.txt': Test set.

* 'y_test.txt': Test labels.

Processes the data and return for every subject that did use the cell phone for data recording, an average of
every measure taken for every activity that the subject performed.

## CodeBook

# Variables in R
* feat :  features.txt
* activ_lbl: activiti_labels.txt
* sub_test: subject_test.txt
* sub_train: subject_train.txt
* x_train: X_train.txt
* y_train: Y.train.txt
* xy_train: x_train with variable names and with subject and activity_id columns added

* x_test: X_test.txt
* y_test: Y.test.txt
* xy_test: x_test with variable names and with subject and activity_id columns added

* train_tbl: xy_train as Table Data Frame
* test_tbl: xy_test as Table Data Frame

* train_tbl2: train_tbl but only with columns that contain mean or standar deviation info, plus activity id and subject id
* test_tbl2: Same as train_tbl2 but for the test data

* Big_Table: Joint rows of both train_tbl2 and test_tbl2

* Tidy_mean: Mean of all the Variables for every subject and activity type convination.



# Variables in Tidy_Mean

* activity                             
* subject                              
* tBodyAcc-mean()-X                    
* tBodyAcc-mean()-Y                    
* tBodyAcc-mean()-Z                    
* tGravityAcc-mean()-X                
* tGravityAcc-mean()-Y                 
* tGravityAcc-mean()-Z                 
* tBodyAccJerk-mean()-X               
* tBodyAccJerk-mean()-Y                
* tBodyAccJerk-mean()-Z                
* tBodyGyro-mean()-X                  
* tBodyGyro-mean()-Y                   
* tBodyGyro-mean()-Z                   
* tBodyGyroJerk-mean()-X              
* tBodyGyroJerk-mean()-Y               
* tBodyGyroJerk-mean()-Z               
* tBodyAccMag-mean()                  
* tGravityAccMag-mean()                
* tBodyAccJerkMag-mean()               
* tBodyGyroMag-mean()                 
* tBodyGyroJerkMag-mean()              
* fBodyAcc-mean()-X                    
* fBodyAcc-mean()-Y                   
* fBodyAcc-mean()-Z                    
* fBodyAcc-meanFreq()-X                
* fBodyAcc-meanFreq()-Y               
* fBodyAcc-meanFreq()-Z                
* fBodyAccJerk-mean()-X                
* fBodyAccJerk-mean()-Y               
* fBodyAccJerk-mean()-Z                
* fBodyAccJerk-meanFreq()-X            
* fBodyAccJerk-meanFreq()-Y           
* fBodyAccJerk-meanFreq()-Z            
* fBodyGyro-mean()-X                   
* fBodyGyro-mean()-Y                  
* fBodyGyro-mean()-Z                   
* fBodyGyro-meanFreq()-X               
* fBodyGyro-meanFreq()-Y              
* fBodyGyro-meanFreq()-Z               
* fBodyAccMag-mean()                   
* fBodyAccMag-meanFreq()              
* fBodyBodyAccJerkMag-mean()           
* fBodyBodyAccJerkMag-meanFreq()       
* fBodyBodyGyroMag-mean()             
* fBodyBodyGyroMag-meanFreq()          
* fBodyBodyGyroJerkMag-mean()          
* fBodyBodyGyroJerkMag-meanFreq()     
* angle(tBodyAccMean,gravity)          
* angle(tBodyAccJerkMean),gravityMean) 
* angle(tBodyGyroMean,gravityMean)    
* angle(tBodyGyroJerkMean,gravityMean) 
* angle(X,gravityMean)                 
* angle(Y,gravityMean)                
* angle(Z,gravityMean)                 
* tBodyAcc-std()-X                     
* tBodyAcc-std()-Y                    
* tBodyAcc-std()-Z                     
* tGravityAcc-std()-X                  
* tGravityAcc-std()-Y                 
* tGravityAcc-std()-Z                  
* tBodyAccJerk-std()-X                 
* tBodyAccJerk-std()-Y                
* tBodyAccJerk-std()-Z                 
* tBodyGyro-std()-X                    
* tBodyGyro-std()-Y                   
* tBodyGyro-std()-Z                    
* tBodyGyroJerk-std()-X                
* tBodyGyroJerk-std()-Y               
* tBodyGyroJerk-std()-Z                
* tBodyAccMag-std()                    
* tGravityAccMag-std()                
* tBodyAccJerkMag-std()                
* tBodyGyroMag-std()                   
* tBodyGyroJerkMag-std()              
* fBodyAcc-std()-X                     
* fBodyAcc-std()-Y                     
* fBodyAcc-std()-Z                    
* fBodyAccJerk-std()-X                 
* fBodyAccJerk-std()-Y                 
* fBodyAccJerk-std()-Z                
* fBodyGyro-std()-X                    
* fBodyGyro-std()-Y                    
* fBodyGyro-std()-Z                   
* fBodyAccMag-std()                    
* fBodyBodyAccJerkMag-std()            
* fBodyBodyGyroMag-std()              
* fBodyBodyGyroJerkMag-std()          