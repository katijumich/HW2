#Kati Johnson
#HW2 CSC302 W1

library(dplyr)
library(tidyr)

#1) The code is creating a dataframe (df1) that contains names, States and Sales. The aggregate function allows us to group the state data by sales sum and outputs a list of states and their total sales.  The dplyr library in loaded, which then allows us to group by states and summarize their total sales and then outputs a tibble table with the data

df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
aggregate(df1$Sales, by=list(df1$State), FUN=sum)

df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))


#2) Use R to read the WorldCupMatches.csv from the DATA folder on Google Drive. Then perform the followings (48 points):
worldcup = read.csv("C:\\Users\\kati.johnson\\Desktop\\DATA\\WorldCupMatches.csv", header=T)


#(a) Find the size of the data frame. How many rows, how many columns?
nrow(worldcup)
ncol(worldcup)

#(b) Use summary function to report the statistical summary of your data.
summary(worldcup)

#(c) Find how many unique locations olympics were held at.
length(unique(worldcup$City))

#(d) Find the average attendance.
mean(worldcup$Attendance, na.rm=TRUE)

#(e) For each Home Team, what is the total number of goals scored? (Hint: Please refer to question 1)
worldcup %>% group_by(Home.Team.Name) %>% summarise(sum_goal = sum(Home.Team.Goals))

#(f) What is the average number of attendees for each year? Is there a trend or pattern in the data in that sense?
worldcup %>% group_by(Year) %>% summarise(mean_attendees = mean(Attendance))

#3.) Use R to read the metabolites.csv from the DATA folder on Google Drive. Then perform the followings (32 points):
metabolites = read.csv("C:\\Users\\kati.johnson\\Desktop\\DATA\\metabolite.csv", header=T)

#(a) Find how many Alzheimers patients there are in the data set. (Hint: Please refer to question 1)
nrow(metabolites)

#(b) Determine the number of missing values for each column. (Hint: is.na( ) )
metabolites %>%
  summarise_all(~sum(is.na(.)))

#(c) Remove the rows which has missing value for the Dopamine column and assign the result to a new data frame.(Hint: is.na( ) )
no_na_metabolites = metabolites %>%
  filter(!is.na(Dopamine))

#(d) In the new data frame, replace the missing values in the c4-OH-Pro column with the median value of the same column. (Hint: there is median( ) function.)
no_na_metabolites <- no_na_metabolites %>% mutate(across(8, ~replace_na(., median(., na.rm=TRUE))))
head(no_na_metabolites)
