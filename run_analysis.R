feat <- read.table("features.txt", header=F, stringsAsFactors=F) #loads features.txt into R
activ_lbl <- read.table("activity_labels.txt", header=F, stringsAsFactors=F) #loads activity_labels.txt into R
sub_test <- read.table("subject_test.txt", header=F, stringsAsFactors=F) # load subject_test.txt into R
sub_train <- read.table("subject_train.txt", header=F, stringsAsFactors=F) # load subject_train.txt into R

x_train <- read.table("X_train.txt", header=F, stringsAsFactors=F )  # loads X_train.txt into R
names(x_train) <- feat[,2]  #Uses the column #2 of the DF feat to give Variable names to x_train

y_train <- read.table("Y_train.txt", header=F, stringsAsFactors=F)  #load Y_train.txt (activity type) into R
x_train[, "activity_id"] <- y_train  #uses y_train (activity type) and writes a column into x_train with the activity id
x_train[, "subject"] <- sub_train  #uses sub_train (subject) and writes a column into x_train with the subject id 

xy_train <- x_train  #copies x_train into xy_train

x_test <- read.table("X_test.txt", header=F, stringsAsFactors=F) #repeat the same steps done for train
names(x_test) <- feat[,2] #repeat the same steps done for train

y_test <- read.table("Y_test.txt", header=F, stringsAsFactors=F) #repeat the same steps done for train
x_test[, "activity_id"] <- y_test  #repeat the same steps done for train
x_test[, "subject"] <- sub_test #repeat the same steps done for train
xy_test <- x_test #repeat the same steps done for train


library(plyr)  #loads plyr package
library(dplyr) #loads dplyr package

train_tbl <- tbl_df(xy_train) #turns xy_train into a tbl_df so it can be use in dplyr
rm(xy_train) # remove xy_train to avoid mistakes an theorically release some memory
test_tbl <- tbl_df(xy_test) # the same as two lines before on train, but on test
rm(xy_test) # the same as two lines before on train, but on test

train_tbl2 <- select(train_tbl, contains("mean"),contains("std"), subject, activity_id) #use this command so I can keep all the variables that have mean, std in their name, as well as the variables, subject and activity_id
test_tbl2 <- select(test_tbl, contains("mean"),contains("std"), subject, activity_id) # same as the line before

train_tbl2 <-mutate(train_tbl2, Test_Train = "Train") #it wasn't needed in this project, but I wanted to keep track of which data came from the Test file, and wich from the Train file
test_tbl2 <-mutate(test_tbl2, Test_Train = "Test") #so in both cases I added a column the will tag the row either as a Test o Train row

Big_Table <- bind_rows(train_tbl2, test_tbl2) #added the test and train data frames together

activ_lbl <- rename(activ_lbl, activity_id=V1, activity=V2) # remaned the variable names in activ_lbl to make it easier to merge 
Big_Table = merge(Big_Table, activ_lbl) # merged Big_Table with activ_lbl bases on the activity_id
Big_Table <- select(Big_Table, -activity_id, -Test_Train) #removed the activity_id (I added the activity name already) and the Test_Train columns. Won't be needing them in this exercise anymore 


by_activity_subject <- group_by(Big_Table, activity, subject) #group by command
tidy_mean <- summarise_each(by_activity_subject, funs(mean)) # combined with summarise_each to get the mean of every mean and std variables as asked in the project intructions
tidy_mean

