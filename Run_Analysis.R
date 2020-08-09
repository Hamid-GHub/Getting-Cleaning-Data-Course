library('dplyr')
xtrain<- read.table(file=".\\UCI HAR Dataset\\train\\X_train.txt")
ytrain<-read.table(file=".\\UCI HAR Dataset\\train\\y_train.txt")
subject_train<-read.table(file=".\\UCI HAR Dataset\\train\\subject_train.txt")

xtest<- read.table(file=".\\UCI HAR Dataset\\test\\X_test.txt")
ytest<- read.table(file=".\\UCI HAR Dataset\\test\\y_test.txt")
subject_test<-read.table(file=".\\UCI HAR Dataset\\test\\subject_test.txt")

features<- read.table(file=".\\UCI HAR Dataset\\features.txt")
#-------------------------------------------------------
selected_columns=grep("*std|mean*",features$V2)

xtrain_selected<- xtrain[,selected_columns]
xtest_selected<- xtest[,selected_columns]
#-----------------------------------------------
xdata<-rbind(xtrain_selected,xtest_selected)
ydata<-rbind(ytrain,ytest)

subject_data<-rbind(subject_train,subject_test)
colnames(subject_data)<-'subject'


colnames(xdata)<- features$V2[selected_columns]

colnames(ydata)<-'activity'

data<-cbind(subject_data,ydata, xdata)

#-----------------------------------------------------

names(data)<-gsub(pattern = "BodyBody",replacement = "Body",x=colnames(data))
colnames(data)<-gsub(pattern = "\\(\\)",replacement = "",x=colnames(data))


tidy_data<-data %>% group_by(subject,activity) %>% summarise_all(mean)

write.table(tidy_data ,file = "tidy_dataset.txt" ,row.names = FALSE)