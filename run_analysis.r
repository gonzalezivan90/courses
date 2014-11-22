## 1. Setting working directory

rootDir <- "C:/OneDrive/RCoursera_specialization//03_Getting&CleaningData//Project"
setwd(paste0(rootDir,"/UCI HAR Dataset/"))


## 2. Listing files to be loaded into r workspace

files <- list.files(recursive = TRUE)
(files <- files[-grep('README|features_info', files)])
(files.names <- gsub("/", '_', gsub(".txt", '', gsub(" ", '_', files))))


## 3. Loading files in R

for (n in 1:length(files.names)){
  assign(paste0(files.names[n]),eval(parse(text = paste0("read.table(files[n], header = FALSE, quote='\"')"))))
}


## 4. Joining and sorting files to 'train' and 'test' sets and adding 'Name' variable

nrow(train_subject_train) # 7352
nrow(test_subject_test) # 2947

train <- data.frame(recordID = 1:7352, subID = train_subject_train, actID = train_y_train)
test <- data.frame(recordID = 7353:(7352+2947), subID = test_subject_test, actID = test_y_test)

colnames(train) <- colnames(test) <- c('recordID', 'subID', 'actID') #, )
colnames(activity_labels) <- c('actID', 'actName')

train <- merge(train,  activity_labels)
test <- merge(test,  activity_labels)

train <- train[order(train$recordID), ]
test <- test[order(test$recordID), ]


## 5. Identifying  mean() & sd() columns in X's files

sel.features <- grep('^(tBodyAcc|tGravityAcc)-(.*)([Mm]ean|sd()|std())', as.character(features[, 2]))
sel.features.names2 <- as.character(features[sel.features, 2])
sel.features.names <- gsub(",", "_", gsub('\\(|\\)', '', gsub("\\(\\)", "", sel.features.names2)))


## 6. Union of training and test data sets with selected variables

dataset <- rbind(data.frame(train, as.matrix(train_X_train[, sel.features])), data.frame(test, as.matrix(test_X_test[, sel.features])))
dataset$recordID <- 1:nrow(dataset)
colnames(dataset) <- c(colnames(train), sel.features.names)

head(dataset)
str(dataset)
summary(dataset)

## 7. Make the second tidy data set 

ID <- paste0(dataset$subID, '-', dataset$actName)

dataset2 <- as.data.frame(apply(as.matrix(dataset[, 5:ncol(dataset)]), 2, FUN = function(x){
  tapply(x, ID, mean)
}))

names2 <- matrix(unlist(strsplit(rownames(dataset2), '-')), nrow = length(unique(ID)), byrow = TRUE)
colnames(names2) <- c('subID', 'actName')

tidydataset <- cbind(names2, dataset2)
head(tidydataset)
str(tidydataset)
summary(tidydataset)

write.table(tidydataset, "tidydataset.txt", row.names = FALSE)
