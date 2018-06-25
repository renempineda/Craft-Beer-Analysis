# Using Data Science to study craft beers and breweries

## This repository will contain the datasets, documentation and analysis produced by Mahesh Kuklani and Rene Pineda, to be presented to the Brewers Association, in Boulder, CO


## Introduction

## The beer market in the U.S.

According to the Brewers Association, the overall beer market size in the U.S. was USD 111.4 Billion in 2017, of which USD 26 Billion belong to "craft beers". Retail dollar sales of craft increased 8%, a much larger growth than the rest of the industry. 

In volume terms, Overall U.S. beer volume sales were down 1% in 2017, whereas craft brewer sales continued to grow at a rate of 5% by volume, reaching 12.7% of the U.S. beer market by volume. Craft production grew the most for microbreweries.

We can therefore conclude that there is a surge in popularity of craft beers in the United States, produced by smaller companies. In contrast with the older and larger breweries that mostly produce lager beer, craft beer producers offer a wide variety of styles. Their manufacturing practices and quality of their products make these breweries more attractive to current consumers.

### Craft Breweries

The craft brewer definition is: An American craft brewer is small, independent, and traditional.

* Small: Annual production of 6 million barrels of beer or less (approximately 3 percent of U.S. annual sales). Beer production is attributed to a brewer according to the rules of alternating proprietorships.

* Independent: Less than 25 percent of the craft brewery is owned or controlled (or equivalent economic interest) by a beverage alcohol industry member which is not itself a craft brewer.

* Traditional: A brewer which has a majority of its total beverage alcohol volume in beers whose flavors derive from traditional or innovative brewing ingredients and their fermentation. Flavored Malt Beverages (FMBs) are not considered beers.

Due to the small size and explosive growth of craft breweries, the total number of breweries rose from 42 in 1978 to over 2,750 in 2012. This also produces a large amount of data, suitable to be analyzed with Data Science tools and techniques.

## Data Description

### Beers: [Beers.csv]
#### Variables:
* Name: Name of the Beer
* Beer_ID:  ID number for each beer
* ABV:  Alcohol by volume
* IBU:  International Bitterness Unit
* Brewery_id:  ID number for each brewery
* Style: Style of Beer
* Ounces:  Fluid ounces of each beer

### Breweries: [Breweries.csv]  
#### Variables:
* Brew_ID:  ID number for each brewery
* Name:  Brewery Name
* City:  City each brewery is located
* State:  State each brewery is located

### Combined dataset

Description pending

## Analysis

The analysis will answer the following questions:

1. How many breweries are present in each state?
2. Merge beer data with the breweries data. Print the first 6 observations and the last six observations to check the merged file.
3. Report the number of NA's in each column.
4. Compute the median alcohol content and international bitterness unit for each state. Plot a bar chart to compare.
5. Which state has the maximum alcoholic (ABV) beer? Which state has the most bitter (IBU) beer?
6. Summary statistics for the ABV variable.
7. Is there an apparent relationship between the bitterness of the beer and its alcoholic content? Draw a scatter plot.

## Conclusions

In summary, this primary objective of this work is to take two different data files which are beer and breweries data, read the data from the a csv file into a data frame, inspect and understand the structure of the data, merge the data frames, and perform some analysis on the final data set.

As Data Scientist, it is very rare to work only on a single perfect data and thus a large percentage of work will be accept different datasets, merge different available data sets before processing it as illustrated in this work. After preparing the data, statistical inference can then be made to the data. 

Based on the analysis, California and Colorado are top two which have most breweries. If order the all the data by Brewery and Beer IDs. The first six observations include beer names: Parapet ESB, Stronghold, Pumpion, Wall's End, Maggie's Leap and Get Together. The last 6 obervations include beer names: Pilsner Ukiah, Porkslap Pale Ale, Moo Thunder Stout, Snapperhead IPA, Heinnieweisse Weissebier and Urban Wilderness Pale Ale; Out of 2410 total rows of the data, there are two columns having NA's: ABV has 62 and IBU has 1005. 

After computing the median alcohol content and international bitterness unit for each state. DC has the highest median ABV, MS has the highest median IBV; UT has the lowest median ABV, SD has the lowest median IBV. But Co has the mximum alcoholic (ABV) beer and OR has the most bitter(IBU) beer. Afer running the summary statistics to ABV variable, the min ABV is 0.001 and the max ABV is 0.128. The Mean is 0.05977 and the median is 0.056. It has a littble bit skewness here. Based on the scatter plot, there is no linear relation between the bitterness of the beer and the alcoholic cotent.
