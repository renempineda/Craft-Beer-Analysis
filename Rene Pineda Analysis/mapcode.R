#Making maps with R

#Packages needed
install.packages(c("devtools", "dplyr","stringr", "maps", "mapdata"))
install.packages("ggmap")

library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

#Rene's working directory
setwd("E:/Bibliotecas/Documents/Data Science/SMU/MSDS 6306 Doing Data Science/Craft Beer Analysis/Rene Pineda Analysis")

# Load the datasets
Beers <- read.csv("Beers.csv", header = TRUE)
Breweries <- read.csv("Breweries.csv", header = TRUE)

# Inspect and understand the structure of the datasets
str(Beers)
summary(Beers[,c(3,4,7)])
str(Breweries)

usa <- map_data("usa")
dim(usa)
head(usa)
tail(usa)
ggplot() +
  geom_polygon(data = usa, aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3)

states <- map_data("state")
head(states)

ggplot(data = states) +
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") +
  coord_fixed(1.3) +
  guides(fill = FALSE)

#Create Table
BreweriesState <- as.data.frame(table(Breweries$State, useNA = "no"))

#Eliminate HI and AK observations
BreweriesState <- BreweriesState[c(2:11,13:51),]
BreweriesState

head(states)
#Reordering
BreweriesState <- BreweriesState[(c(1,3,2,4:6,8,7,9:10,12,13,14,11,15:17,20,19,18,21:22,24,23,25,28,32,29,30,31,33,26,27,34:43,45,44,46,48,47,49)),]
#Create table with State Names
StateNames <- unique(states$region)
StateNames
BreweriesState <- cbind(BreweriesState, StateNames)
names(BreweriesState) <- c("State.abb", "Number.of.Breweries", "region")
BreweriesState
BreweriesState.map <- inner_join(states, BreweriesState, by = "region")
ggplot(data = BreweriesState.map) +
  geom_polygon(aes(x = long, y = lat, fill = Number.of.Breweries, group = group), color = "black") +
  coord_fixed(1.3) +
  scale_fill_gradientn(colours=rev(heat.colors(10)),na.value="grey90")
  
  
install.packages("car")
require(car)
library(car)
str(MergedBeers)
scatterplot.matrix(~ABV+IBU+Ounces | Style, MergedBeers,
                   main="Beer Styles")

ggplot(data = MergedBeers) + 
  geom_point(mapping = aes(x = ABV, y = IBU, color = State))
require(ggplot2)

install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

#Create file with the text of the Beer Styles
text <- as.character(Beer$Style)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")



# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, "american") 
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

#Create Word Cloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, random.color = FALSE, rot.per=0.35, 
          colors=brewer.pal(8,"Dark2"))
barplot(d[1:20,]$freq, las = 2, names.arg = d[1:20,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
findAssocs(dtm, terms = "ale", corlimit = 0.3)


#Frequencies, tried with table too complicated, using "count" from plyr package

library(plyr)
count(Beers, 'Style')
StyleFreqTable <- count(Beers, 'Style')
head(StyleFreqTable)
class(StyleFreqTable)
StyleFreqTable <- StyleFreqTable[order(-StyleFreqTable$freq),] #Not sort but order!

head(StyleFreqTable)

barplot(StyleFreqTable[1:20,]$freq, las = 2 ,names.arg = StyleFreqTable[1:20,]$Style,
        col ="lightblue", main ="Most frequent Styles of Beer",
        ylab = "Frequencies", cex.names = 0.8)
#The following code is good enough:
ggplot(data = StyleFreqTable[1:10,], aes(x = reorder(Style, -freq), y = freq)) +
  geom_bar(aes(fill = Style), stat = "identity", fill = "lightblue", color = "black") +
  labs(title = "Most popular Styles of Beer", x = "Style of Beer", y = "Frequency") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

names(StyleFreqTable)
StyleFreqTable[1:20,]
head(StyleFreqTable)
#Subset of most frequent beers
Popular <- subset(MergedBeers, Style = names(StyleFreqTable[1:10,]))
Popular
?subset
boxplot(ABV ~ Style, data = MergedBeers[1:10,])

