getwd()

setwd("C:\\Users\\welcome\\Documents\\ExcelR\\Day 05 Basic Stat _ R\\Data Sets\\") # set a working directory of your choice


victims <- readLines("C:\\Users\\welcome\\Documents\\ExcelR\\Day 05 Basic Stat _ R\\Data Sets\\victims.txt")

victims
?as
df  <-  as.data.frame (victims)

df

class(df)
?length
length(df$victims)

nrow(df)

ncol(df)

dim(df)

str(df)
#https://rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf
#https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html
?grepl
comments  <- grepl("^%", victims)
comments

comments  <- grepl("\\d+", victims)
comments


text  <- victims[!comments]
text

victims

comments_grepl  <-  grepl("^%", victims)

comments_grepl

comments_grep  <- grep ("^%", victims)
comments_grep

text_grep  <- victims[!comments_grep]
text_grep

text[1]

x  <- text[1]
x

y  <- sub ("[[:digit:]]", "", x) # (pattern, replacement, x)
y


text[1]
x  <- text[1]
y  <- gsub ("\\d+", "", x)
y

text[9]

r  <- regexpr("9", text[9])
r

r  <- gregexpr("9", text[9])
r

text
splitlines  <- strsplit(text, split = ",")
splitlines

Lines  <- matrix (unlist(splitlines), nrow=length(splitlines), byrow = TRUE)
Lines

colnames(Lines)  <- c("Name", "BirthYear", "DeathYear")
#in a data frame should be treated as factor variables or as just plain strings
titanic_victims  <-  as.data.frame(Lines, stringsAsFactors = FALSE)
titanic_victims

class(titanic_victims$BirthYear)

titanic_victims  <-  as.data.frame(Lines, stringsAsFactors = TRUE)
titanic_victims$DeathYear

class(titanic_victims$BirthYear)

titanic_victims$BirthYear  <- as.numeric(titanic_victims$BirthYear)
titanic_victims$BirthYear

titanic_victims  <- transform (titanic_victims, BirthYear = as.numeric(BirthYear), 
                               DeathYear = as.numeric(DeathYear))

class(titanic_victims$BirthYear)

class(titanic_victims$DeathYear)

titanic_victims

str(titanic_victims)

mean(titanic_victims$BirthYear)
round(mean(titanic_victims$BirthYear))

#=============================================================================


install.packages("lattice")

library(lattice)
data(barley)
View(barley)

dim(barley)
str(barley)
?lapply
lapply(barley, function(x) length(unique(x)))

sapply(barley, function(x) length(unique(x)))
apply(barley, 2,function(x) length(unique(x)))
?apply

levels(as.factor(barley$site))
tapply (barley$yield, barley$site, sum)
tapply (barley$yield, barley$site, mean)


