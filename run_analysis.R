# Script: run_analysis.R
# Creator: H. Culver
# Created: 6/20/2015

# set pathing inforamtion...
bpath <- "/users/hfc/Coursera/DataScienceSpec/Getting-and-CleansingData/Project/UCI\ HAR\ Dataset/"
trnpath <- "train"
tstpath <- "test"

# get labels for subject activity...
fn <- "activity_labels.txt"
fn.loc <- paste(bpath, fn, sep = "/")
actv.lbls<-read.table(fn.loc)

#get features column names...
fn <- "features.txt"
fn.loc <- paste(bpath, fn, sep = "/")
w1<-read.table(fn.loc)
features.cn <- as.list(w1[,2])  #get only lable name...
rm(w1)


# Phase 1 - processing training data...
# get sensor readings records for training set...
fn <- "X_train.txt"
fn.loc <- paste(bpath, trnpath, fn, sep = "/")
x1<-read.table(fn.loc)

# get sensor reading column labels for training set...
colnames(x1) <- unlist(features.cn)   # add column names...

# get subject number for training set...
fn.st <- "subject_train.txt"
fn.st.loc <- paste(bpath, trnpath, fn.st, sep = "/")
y.st <- read.table(fn.st.loc)
colnames(y.st) <- "subject"

# get activity attribute for each training observation...
fn <- "y_train.txt"
fn.loc <- paste(bpath, trnpath, fn, sep = "/")
y.actv<-read.table(fn.loc)
# get full activity name for each observations activity code...
y.actv<-merge(y.actv, actv.lbls)
colnames(y.actv)<- c("activity_code", "activity_name")

# get only mean and standard deviation measures...
z1<-x1[, grep("-(mean|std)", names(x1), value=TRUE)]

# create data group factor values...
dg.tng<-data.frame(data_group=matrix("Training",ncol=1,nrow=nrow(x1)))

# combine all columns...
dataset.tng<-cbind(dg.tng,y.st,y.actv,z1)

# Phase 2 - process test data...
# get sensor readings records for test set...
fn <- "X_test.txt"
fn.loc <- paste(bpath, tstpath, fn, sep = "/")
x1<-read.table(fn.loc)

# get sensor reading column labels for test set...
colnames(x1) <- unlist(features.cn)   # add column names...

# get subject number for test set...
fn.st <- "subject_test.txt"
fn.st.loc <- paste(bpath, tstpath, fn.st, sep = "/")
y.st <- read.table(fn.st.loc)
colnames(y.st) <- "subject"

# get activity attribute for each test observation...
fn <- "y_test.txt"
fn.loc <- paste(bpath, tstpath, fn, sep = "/")
y.actv<-read.table(fn.loc)
# get full activity name for each observations activity code...
y.actv<-merge(y.actv, actv.lbls)
colnames(y.actv)<- c("activity_code", "activity_name")

# get only mean and standard deviation measures...
z1<-x1[, grep("-(mean|std)", names(x1), value=TRUE)]

# create data group factor values...
dg.tst<-data.frame(data_group=matrix("Test",ncol=1,nrow=nrow(x1)))

# combine all columns...
dataset.tst<-cbind(dg.tst,y.st,y.actv,z1)


# Phase 3 - combine data sets and write to disk...
dataset.all<-rbind(dataset.tng, dataset.tst)
#fn <- "tidy_dataset.csv"
fn <- "tidy_dataset.txt"
fn.loc <- paste(bpath, fn, sep = "/")
#write.csv(dataset.all, file=fn.loc,row.names=FALSE)
write.table(dataset.all, file=fn.loc,row.names=FALSE)

rm(list=ls())   # clean-up; remove all variables and functions...

# End-of-script!
