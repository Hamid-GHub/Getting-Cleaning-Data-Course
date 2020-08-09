# <center> R Script for  Making a Tidy Dataset </center>

 This documents provides a desription for the script written to output a tidy dataset. The process for making the tidy set is broken into 7 steps as follows: <br>

### Setp 1: Reading data from input files into corresponding dataframes (lines 1-10)

In this step 7 text files are read into 7 corresponding data frames as follows:
<ul>
<li>x_train.txt is read into xtrain data frame</li>
<li>y_train.txt is read into ytrain data frame</li>
<li>subject_train.txt is read into subject_train data frame</li>
<li>x_test.txt is read into xtest data frame</li>
<li>y_test.txt is read into ytest data frame</li>
<li>subject_test.txt is read into subject_test dataframe</li>
<li> features.txt is read into features data.frame</li>
</ul>

### Step 2: Data extraction (line 12-15) : 
 In this step a fraction of entire data is sliced. This fraction includes those columns with either mean or standard deviation  calculation involved. In particular, indices of columns of interest from features data frame is read into selected_columns data frame
    
 
### Step 3: Data concatenation (lines 17-30)
In this step different parts of data that imported and extracted in the previous steps are put together to form a single       dataset. In particular this steps does: <br>
	  
<ul>

<li> combing training data for selected variables and  test data for selected variables row wise (using rbind) </li>
<li> combining training data for activity variable and test data for activity variable row wise (using rbind) </li>
<li> combining training data for subject variable and test data for subject variable row wise (using rbind) </li>   

<li> descriptiove column names ('activity' and 'subject') is added to their corresponding columns </li>
   
<li> descriptive names from features data frame are added to the a selected columns in concatenation of xtrain and xtest data frames  </li> 
    <li> combining above 3 part of data column wise  (using cbind) </li> 
</ul>

### Step 3: Cleaning Data (lines 32-33)
In this step some cleaning is performed in order to make the variable name more radable. In particular,"BodyBody" are replaced with "Body" in some variables names. Furthermore, parenthesis are also removed from variable names.

### Step 4: Grouping & Summarising Data (line 36)
In this step the dataset resulted from the previous step is grouped by two variables of *subject* and *activity* while rest of variable are summarised using the mean function.

### Step 6: Writing Data (line 38)
  In this step the tidy dataset made as a result of previous steps is writen to a text file.
