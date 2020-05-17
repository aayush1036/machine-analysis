# Machine Analysis 

This is an R file aiming to analyze the correlation between the efficiency of the machine and time. There are several plots in the code which are explained below

## Derive the utilization column

In this section, we have subtracted each entry in the column of Percent Idle to get the utilization (efficiency) of the machine.

Then we have added the time stamp by using the Posixct() function and specifying the format as dd/mm/yyyy h:m

## How to rearrange columns 

First we have set the time stamp column to null (ie deleted the time stamp column) as we have created another column named as PosixTime which serves the same purpose

Then we have re arranged the columns using subsetting and supplying the desired order (from left to right) in the form of a vector. 

## What is a list?

We are creating a dataframe known as RL1 for all the data pertaining to the RL1 machine. 

Then we are setting the Machine column as factor. 

## Construct a list

We are creating a vector named as util_stats_rl1 which contains the minimum, mean, and max of the utilzation column ignoring all the NA entries

Then we are creating a flag named as util_under_90_flag which is true when a particular entry in the utilization column is below 0.90

Then we are creating a list with three items 

1) The machine name which is set to "RL1" 
2) The statistics of the utilization column (min, mean and max)
3) The flag 

## Naming components of a list 

Then we are assiging the names to the columns which are Machine, Stats and LowThreshold respectively 

In the first way, we are using the name function on the list and assigning it to a vector 

In the other way, we are passing the column names as arguments in the list function 

## Extracting elements of the list

There are three ways to print out the elements of a list 

1) []- prints out a list 
2) [[]] - prints out a particular element of the list 
3) $- same as [[]] but prettier

For example:

list_rl1 [1] returns a list with a single element named as RL1 but list_rl1[[1]] will return a vector which contains RL1 in character format

list_rl1$Stats will return a vector which has 3 values corresponding to the min, mean and max respectively 

list_rl1$Stats[3] or list [[2]][3] returns the third element in the stats vector which is the maximum value. 


## Adding and deleting components from a list

Firstly, we are assiging an element in the list as New Information and storing it as the 4th element of the list 

Then we are assigning the fifth element in the list with a name of UnknownHours and storing the values of all the time frames when the utilization was NA 

Then we are removing the fourth element from the list by setting it as null 

#### NOTE: Numertaion has shifted

## Add another component

We are creating an element in the list known as data and setting it as the RL1 dataframe which we had created earlier. 

## Subsetting a list

#### Quick challenge 
In this quick challenge section we are subsetting the first time frame when the Utilization was equal to NA

#### Proceeding 
Firstly we are subsetting the first three elements by passing all the numbers from 1 to 3 as indices 

Then we are subsetting the first and fourth element of the list by passing 1 and 4 in a vector as an index

Then we are creating a sublist named as "sublist 1" which has the columns of Machine and Stats which are passed as a vector as an index during subsetting. 

Then we are subsetting the mean from the stats element in the list 

#### NOTE: 
#### Single square brackets are for subsetting and double square brackets are for accessing elements 
#### Double square brackets are NOT for subsetting (allow accessing only single element)

## Plot 

Firstly we are including the ggplot2 package in the library to use it in the code 

Then we are creating a plot object which has the data of the util dataframe 

Then we are assiging point geometry to create a scatter plot with PosixTime on the x axis and Utilization on the y axis. Then we are mapping the color to the Machine variable so that the dots representing a particular machine get colored accordingly. Then we are creating a facet grid with all the machines represented as the rows of the grid. Then we are creating a horizontal line at Utilization = 0.90 which is of the 3rd type (dotted line) which is grey in color and has a size of 1.2 which imparts the desired thickness to the line. 

Then we are storing that plot in an object known as myplot. 

Then we are creating a new element in the list called as Plot and passing the myplot object in it. 

## The datasets used in this project are specified in the csv files and the description of what is done in the code is given in the pdf file which is attached

