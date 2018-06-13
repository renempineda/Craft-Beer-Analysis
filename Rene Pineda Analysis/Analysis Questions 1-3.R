# This is my code

# Check the working directory

getwd()

#Rene's working directory
setwd(paste(getwd(),"/Rene Pineda Analysis", sep = ""))

#Set up your working directory here



#Load additional packages
library(dplyr)
library(ggplot2)
      
# Load the datasets

Beers <- read.csv("Beers.csv", header = TRUE)

Breweries <- read.csv("Breweries.csv", header = TRUE)

# Inspect and understand the structure of the datasets

str(Beers)
summary(Beers[,c(3,4,7)])
str(Breweries)

### How many breweries are present in each State
table(Breweries$State, useNA = "no")


# There is one "Name" variable in each dataset. Change Variable names to distinguish between Beer and Brewery names
# Each dataset have different Brewery ID variable name. Change to Brewery_ID to match both datasets:
Breweries <- rename(Breweries, Brewery_ID = Brew_ID, Brewery_Name = Name )
Beers <- rename(Beers, Brewery_ID = Brewery_id, Beer_Name = Name)

#Order the data by Brewery and Beer_ID (not necessary because we are using the merge command, but useful anyway)

Beers <- Beers[order(Beers$Brewery_ID,Beers$Beer_ID),]

#Check if the Brewery_ID values are the same in order to make sure they can be easily merged

unique(Beers$Brewery_ID) == unique(Breweries$Brewery_ID)



#Merge the datasets by Brewery_ID

MergedBeers <- merge(x = Beers, y = Breweries, by = "Brewery_ID", all = TRUE)
str(MergedBeers)

### Print the first 6 observations and the last six observations to check the merged file.
head(MergedBeers, 6)
tail(MergedBeers, 6)

### 3. Report the number of NA's in each column.

sapply(MergedBeers, function(y) sum(is.na(y)))


