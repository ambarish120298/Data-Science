################################################
# IST687, Project
#
# Student name: Ambarish Patankar
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

# Set your working directory where data files are stored 
setwd("C:/Users/ambar/OneDrive/Desktop/IST 687") # Change to the folder containing your homework data files
getwd()

#PHASE 1

install.packages("RJSONIO")
library(RJSONIO)

install.packages("RCurl")
library(RCurl)

install.packages("jsonlite") #installing jsonlite
library(jsonlite) #loading the package jsonlite

my_df <- jsonlite::fromJSON("Spring2020-survey-02(1).json") #use of the fromJSON function to convert the data downloaded from JSON format to a R format 
View(my_df)#viewing the dataframe

my_df$freeText[is.na(my_df$freeText)]
is.na(my_df)

str(my_df) #summary of the dataframe
sapply(my_df, function(x) sum(is.na(x))) #finding out the NA values in each column

#all columns have na values, but freeText has a lot of them, hence i will delete that column
my_df$freeText <- NULL
View(my_df)
str(my_df$Likelihood_to_recommend)
view(my_df$Likelihood_to_recommend)
summary(my_df$Likelihood_to_recommend)
#as the column names have periods in between them, i will rename the column names

my_colnames <- c('Destination City', 'Origin City', 'Airline status', 'Age', 'Gender', 'Price Sensitivity', 'Year of first flight', 'Flights per year', 'Loyalty', 'Type of travel', 'Total Freq Flyer Accts', 'Shopping at airport', 'Dining at airport', 'Class', 'Day of month', 'flight date', 'Partner code', 'Partner name', 'origin state', 'destination State', 'scheduled departure hour', 'departure delay in minutes', 'arrival delay in minutes', 'flight cancelled', 'flight time in minutes', 'flight distance', 'Likelihood to recommend', 'origin longitude', 'origin latitude', 'dsetination longitude', 'destination latitiude')
colnames(my_df) <- my_colnames
View(my_df)

my_colnames1 <- c('Destination_City', 'Origin_City', 'Airline_status', 'Age', 'Gender', 'Price_Sensitivity', 'Year_of_first_flight', 'Flights_per_year', 'Loyalty', 'Type_of_travel', 'Total_Freq_Flyer_Accts', 'Shopping_at_airport', 'Dining_at_airport', 'Class', 'Day_of_month', 'flight_date', 'Partner_code', 'Partner_name', 'origin_state', 'destination_State', 'scheduled_departure_hour', 'departure_delay_in_minutes', 'arrival_delay_in_minutes', 'flight_cancelled', 'flight_time_in_minutes', 'flight_distance', 'Likelihood_to_recommend', 'origin_longitude', 'origin_latitude', 'destination_longitude', 'destination_latitiude')
colnames(my_df) <- my_colnames1
View(my_df)

#now, i will replace the NA values of all numeric columns with its mean
mean(my_df$Age, na.rm=TRUE)#replaces NA values
my_df$Age[is.na(my_df$Age)]<-mean(my_df$Age, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Age, na.rm=TRUE)#replaces NA values
my_df$Age[is.na(my_df$Age)]<-mean(my_df$Age, na.rm = TRUE)#replacing NA values with mean values

str(my_df)

mean(my_df$Price_Sensitivity, na.rm=TRUE)#replaces NA values
my_df$Price_Sensitivity[is.na(my_df$Price_Sensitivity)]<-mean(my_df$Price_Sensitivity, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Year_of_first_flight, na.rm=TRUE)#replaces NA values
my_df$Year_of_first_flight[is.na(my_df$Year_of_first_flight)]<-mean(my_df$Year_of_first_flight, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Flights_per_year, na.rm=TRUE)#replaces NA values
my_df$Flights_per_year[is.na(my_df$Flights_per_year)]<-mean(my_df$Flights_per_year, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Loyalty, na.rm=TRUE)#replaces NA values
my_df$Loyalty[is.na(my_df$Loyalty)]<-mean(my_df$Loyalty, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Total_Freq_Flyer_Accts, na.rm=TRUE)#replaces NA values
my_df$Total_Freq_Flyer_Accts[is.na(my_df$Total_Freq_Flyer_Accts)]<-mean(my_df$Total_Freq_Flyer_Accts, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Shopping_at_airport, na.rm=TRUE)#replaces NA values
my_df$Shopping_at_airport[is.na(my_df$Shopping_at_airport)]<-mean(my_df$Shopping_at_airport, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Dining_at_airport, na.rm=TRUE)#replaces NA values
my_df$Dining_at_airport[is.na(my_df$Dining_at_airport)]<-mean(my_df$Dining_at_airport, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Day_of_month, na.rm=TRUE)#replaces NA values
my_df$Day_of_month[is.na(my_df$Day_of_month)]<-mean(my_df$Day_of_month, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$scheduled_departure_hour, na.rm=TRUE)#replaces NA values
my_df$scheduled_departure_hour[is.na(my_df$scheduled_departure_hour)]<-mean(my_df$scheduled_departure_hour, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$departure_delay_in_minutes, na.rm=TRUE)#replaces NA values
my_df$departure_delay_in_minutes[is.na(my_df$departure_delay_in_minutes)]<-mean(my_df$departure_delay_in_minutes, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$arrival_delay_in_minutes, na.rm=TRUE)#replaces NA values
my_df$arrival_delay_in_minutes[is.na(my_df$arrival_delay_in_minutes)]<-mean(my_df$arrival_delay_in_minutes, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$flight_time_in_minutes, na.rm=TRUE)#replaces NA values
my_df$flight_time_in_minutes[is.na(my_df$flight_time_in_minutes)]<-mean(my_df$flight_time_in_minutes, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$flight_distance, na.rm=TRUE)#replaces NA values
my_df$flight_distance[is.na(my_df$flight_distance)]<-mean(my_df$flight_distance, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$Likelihood_to_recommend, na.rm=TRUE)#replaces NA values
my_df$Likelihood_to_recommend[is.na(my_df$Likelihood_to_recommend)]<-mean(my_df$Likelihood_to_recommend, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$origin_longitude, na.rm=TRUE)#replaces NA values
my_df$origin_longitude[is.na(my_df$origin_longitude)]<-mean(my_df$origin_longitude, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$origin_latitude, na.rm=TRUE)#replaces NA values
my_df$origin_latitude[is.na(my_df$origin_latitude)]<-mean(my_df$origin_latitude, na.rm = TRUE)#replacing NA values with mean values

mean(my_df$destination_longitude, na.rm=TRUE)#replaces NA values
my_df$destination_longitude[is.na(my_df$destination_longitude)]<-mean(my_df$destination_longitude, na.rm = TRUE)#replacing NA values with mean values

my_df$destination_latitude <- as.numeric(as.character(my_df$destination_latitiude))
mean(my_df$destination_latitude, na.rm=TRUE)#replaces NA values
my_df$destination_latitude[is.na(my_df$destination_latitude)]<-mean(my_df$destination_latitude, na.rm = TRUE)#replacing NA values with mean values

sapply(my_df, function(x) sum(is.na(x))) #finding out the NA values in each column

#now, lets remove the NAs in columns which arent numeric

install.packages("stats")#installing the package
library(stats)
my_df <- na.omit(my_df)
sapply(my_df, function(x) sum(is.na(x))) #finding out the NA values in each column
str(my_df)#view the dataframe

#PHASE 2

# lets start with the histograms for the numeric variables
hist(my_df$Age)
#this histogram is symmetric

hist(my_df$Price_Sensitivity)
#this histogram is positively skewed

hist(my_df$Year_of_first_flight)
#this histogram is symmetric

hist(my_df$Flights_per_year)
#this histogram is positively skewed

hist(my_df$Loyalty)
#this histogram is positively skewed

hist(my_df$Total_Freq_Flyer_Accts)
#this histogram is positively skewed

hist(my_df$Shopping_at_airport)
#this histogram is positively skewed

hist(my_df$Dining_at_airport)
#this histogram is positively skewed

hist(my_df$Day_of_month)
#this histogram is symmetric

hist(my_df$scheduled_departure_hour)
#this histogram is symmetric

hist(my_df$departure_delay_in_minutes)
#this histogram is positively skewed

hist(my_df$arrival_delay_in_minutes)
#this histogram is positively skewed

hist(my_df$flight_time_in_minutes)
#this histogram is positively skewed

hist(my_df$flight_distance)
#this histogram is positively skewed

hist(my_df$Likelihood_to_recommend)
#this histogram is negatively skewed

hist(my_df$origin_longitude)
#this histogram is negatively skewed

hist(my_df$origin_latitude)
#this histogram is negatively skewed

hist(my_df$destination_longitude)
#this histogram is negatively skewed

hist(my_df$destination_latitude)
#this histogram is negatively skewed?


#now, lets use table() to summarize how many observations are in each category
table(my_df$Destination_City)

table(my_df$Origin_City)

table(my_df$Airline_status)

table(my_df$Gender)

table(my_df$Type_of_travel)

table(my_df$Class)

table(my_df$flight_date)

table(my_df$Partner_code)

table(my_df$Partner_name)

table(my_df$origin_state)

table(my_df$destination_State)

table(my_df$flight_cancelled)

str(my_df)








































#PHASE 3


              
#before going ahead with linear modeling, i have created a correlation matriz
install.packages("data.table")
library(data.table)
corr <- my_df %>% sapply(., as.numeric) %>% as.data.table()
corr <- cor(corr, use = 'pairwise.complete.obs')
corr[upper.tri(corr)] <- NA
corr <- melt(corr, na.rm = T) %>% as.data.table() %>% setorder(-value)
corr$text <- ifelse(abs(corr$value) >= .8 & corr$value != 1, round(corr$value, 2), '')

library(ggplot2)
ggplot(data = corr, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = 'white') +
  geom_text(aes(label = text)) +
  scale_fill_gradient2(low = 'blue', high = 'red', mid = 'white',
                       midpoint = 0, limit = c(-1, 1),
                       name = 'Pearson Correlation') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = 'Correlation Matrix')



#now, lets run multiple regression
lm <- lm(Likelihood_to_recommend ~ Airline_status+Age+Gender+Type_of_travel+Flights_per_year+arrival_delay_in_minutes+departure_delay_in_minutes+Loyalty, my_df)
summary(lm)

#multiple r-squared = 0.3855 and adjusted r-squared= 0.3848

install.packages("stringr")     # Install stringr R package
library("stringr")              # Load stringr R package
#linear modelling on 2 airlines
#linear modelling for northwest business airlines
northwest_bus_air1 <- my_df[str_trim(my_df$Partner_Name)=="Northwest Business Airlines Inc.",]

df1_Linear_north <- lm(formula = Likelihood_to_recommend~Airline_status+Gender+Loyalty+Dining_at_airport+flight_distance+Type_of_travel+Age+Price_Sensitivity+origin_state+destination_State+Flights_per_year+Class,data = my_df)
summary(df1_Linear_north)
#Multiple R-squared:  0.4023,	Adjusted R-squared:  0.3958



#linear modelling for flyfast airways inc.
flyfast_air1 <- my_df[str_trim(my_df$Partner_name)=="FlyFast Airways Inc." & my_df$flight_cancelled=='No',]

df1_Linear_flyfast <- lm(formula = Likelihood_to_recommend~Airline_status+Gender+Loyalty+Dining_at_airport+flight_distance+Type_of_travel+Age+Price_Sensitivity+origin_state+destination_State+Flights_per_year+Class,data = flyfast_air1)

summary(df1_Linear_flyfast)
#Multiple R-squared:  0.4828,	Adjusted R-squared:  0.4396





























































#association rules

y_df <- my_df

#now, i will create bins to apply association rules
summary(y_df$Age)

for (i in 1:length(y_df$Age))
{
  if (y_df$Age[i] >= 15 & y_df$Age[i]<= 29)
  {
    y_df$Age[i] <- "Young Adult"
  }
  else if (y_df$Age[i] >= 30 & y_df$Age[i]<=55)
  {
    y_df$Age[i] <- "Middle Age"
  }
  else
  {
    y_df$Age[i]<- "Senior Citizen"
  }
}

summary(y_df$Price_Sensitivity)

for (i in 1:length(y_df$Price_Sensitivity))
{
  if (y_df$Price_Sensitivity[i] >= 0.000 & y_df$Price_Sensitivity[i]<= 1.000)
  {
    y_df$Price_Sensitivity[i] <- "less price sensitivity"
  }
  else if (y_df$Price_Sensitivity[i] >= 1.100 & y_df$Price_Sensitivity[i]<= 2.000)
  {
    y_df$Price_Sensitivity[i] <- "Middle price sensitivity"
  }
  else
  {
    y_df$Price_Sensitivity[i]<- "high price sensitivity"
  }
}

summary(y_df$Year_of_first_flight)
for (i in 1:length(y_df$Year_of_first_flight))
{
  if (y_df$Year_of_first_flight[i] >= 2003 & y_df$Year_of_first_flight[i]<= 2007)
  {
    y_df$Year_of_first_flight[i] <- "years 1"
  }
  else if (y_df$Year_of_first_flight[i] >= 2008 & y_df$Year_of_first_flight[i]<= 2010)
  {
    y_df$Year_of_first_flight[i] <- "years 2"
  }
  else
  {
    y_df$Year_of_first_flight[i]<- "years 3"
  }
}

summary(y_df$Flights_per_year)
for (i in 1:length(y_df$Flights_per_year))
{
  if (y_df$Flights_per_year[i] >= 0 & y_df$Flights_per_year[i]<= 18)
  {
    y_df$Flights_per_year[i] <- "flightss 1"
  }
  else if (y_df$Flights_per_year[i] >= 19 & y_df$Flights_per_year[i]<= 50)
  {
    y_df$Flights_per_year[i] <- "flights 2"
  }
  else
  {
    y_df$Flights_per_year[i]<- "flights 3"
  }
}

summary(y_df$Loyalty)
for (i in 1:length(y_df$Loyalty))
{
  if (y_df$Loyalty[i] >= -0.9722 & y_df$Loyalty[i]<= -0.4444)
  {
    y_df$Loyalty[i] <- "loyalty 1"
  }
  else if (y_df$Loyalty[i] >= -0.4443 & y_df$Loyalty[i]<= 0.5)
  {
    y_df$Loyalty[i] <- "loyalty 2"
  }
  else
  {
    y_df$Loyalty[i]<- "loyalty 3"
  }
}

summary(y_df$Total_Freq_Flyer_Accts)
for (i in 1:length(y_df$Total_Freq_Flyer_Accts))
{
  if (y_df$Total_Freq_Flyer_Accts[i] >= 0.0000 & y_df$Total_Freq_Flyer_Accts[i]<= 1.9999)
  {
    y_df$Total_Freq_Flyer_Accts[i] <- "not a freq flyer"
  }
  else if (y_df$Total_Freq_Flyer_Accts[i] >= 2.0000 & y_df$Total_Freq_Flyer_Accts[i]<= 5.0000)
  {
    y_df$Total_Freq_Flyer_Accts[i] <- "travels sometimes"
  }
  else
  {
    y_df$Total_Freq_Flyer_Accts[i]<- "freq flyer"
  }
}

str(y_df)
summary(y_df$Shopping_at_airport)
for (i in 1:length(y_df$Shopping_at_airport))
{
  if (y_df$Shopping_at_airport[i] >= 0.00 & y_df$Shopping_at_airport[i]<= 20.99)
  {
    y_df$Shopping_at_airport[i] <- "shopping 1"
  }
  else if (y_df$Shopping_at_airport[i] >= 21.00 & y_df$Shopping_at_airport[i]<= 500.00)
  {
    y_df$Shopping_at_airport[i] <- "shopping 2"
  }
  else
  {
    y_df$Shopping_at_airport[i]<- "shopping 3"
  }
}

summary(y_df$Dining_at_airport)
for (i in 1:length(y_df$Dining_at_airport))
{
  if (y_df$Dining_at_airport[i] >= 0.00 & y_df$Dining_at_airport[i]<= 60.99)
  {
    y_df$Dining_at_airport[i] <- "dining 1"
  }
  else if (y_df$Dining_at_airport[i] >= 61.00 & y_df$Dining_at_airport[i]<= 400.00)
  {
    y_df$Dining_at_airport[i] <- "dining 2"
  }
  else
  {
    y_df$Dining_at_airport[i]<- "dining 3"
  }
}

summary(y_df$Day_of_month)
for (i in 1:length(y_df$Day_of_month))
{
  if (y_df$Day_of_month[i] >= 1.00 & y_df$Day_of_month[i]<= 16.99)
  {
    y_df$Day_of_month[i] <- "dom 1"
  }
  else if (y_df$Day_of_month[i] >= 17.00 & y_df$Day_of_month[i]<= 23.00)
  {
    y_df$Day_of_month[i] <- "dom 2"
  }
  else
  {
    y_df$Day_of_month[i]<- "dom 3"
  }
}

summary(y_df$scheduled_departure_hour)
for (i in 1:length(y_df$scheduled_departure_hour))
{
  if (y_df$scheduled_departure_hour[i] >= 1.00 & y_df$scheduled_departure_hour[i]<= 13.99)
  {
    y_df$scheduled_departure_hour[i] <- " sdh 1"
  }
  else if (y_df$scheduled_departure_hour[i] >= 14.00 & y_df$scheduled_departure_hour[i]<= 20.00)
  {
    y_df$scheduled_departure_hour[i] <- "sdh 2"
  }
  else
  {
    y_df$scheduled_departure_hour[i]<- "sdh 3"
  }
}

summary(y_df$departure_delay_in_minutes)
for (i in 1:length(y_df$departure_delay_in_minutes))
{
  if (y_df$departure_delay_in_minutes[i] >= 0.00 & y_df$departure_delay_in_minutes[i]<= 15.99)
  {
    y_df$departure_delay_in_minutes[i] <- " ddim 1"
  }
  else if (y_df$departure_delay_in_minutes[i] >= 16.00 & y_df$departure_delay_in_minutes[i]<= 700.00)
  {
    y_df$departure_delay_in_minutes[i] <- "ddim 2"
  }
  else
  {
    y_df$departure_delay_in_minutes[i]<- "ddim 3"
  }
}

summary(y_df$arrival_delay_in_minutes)
for (i in 1:length(y_df$arrival_delay_in_minutes))
{
  if (y_df$arrival_delay_in_minutes[i] >= 0.00 & y_df$arrival_delay_in_minutes[i]<= 15.99)
  {
    y_df$arrival_delay_in_minutes[i] <- " adim 1"
  }
  else if (y_df$arrival_delay_in_minutes[i] >= 16.00 & y_df$arrival_delay_in_minutes[i]<= 700.00)
  {
    y_df$arrival_delay_in_minutes[i] <- "adim 2"
  }
  else
  {
    y_df$arrival_delay_in_minutes[i]<- "adim 3"
  }
}

summary(y_df$flight_time_in_minutes)
for (i in 1:length(y_df$flight_time_in_minutes))
{
  if (y_df$flight_time_in_minutes[i] >= 16.00 & y_df$flight_time_in_minutes[i]<= 61.99)
  {
    y_df$flight_time_in_minutes[i] <- " ftim 1"
  }
  else if (y_df$flight_time_in_minutes[i] >= 62.00 & y_df$flight_time_in_minutes[i]<= 300.00)
  {
    y_df$flight_time_in_minutes[i] <- "ftim 2"
  }
  else
  {
    y_df$flight_time_in_minutes[i]<- "ftim 3"
  }
}

summary(y_df$flight_distance)
for (i in 1:length(y_df$flight_distance))
{
  if (y_df$flight_distance[i] >= 67.00 & y_df$flight_distance[i]<= 370.99)
  {
    y_df$flight_distance[i] <- " fd 1"
  }
  else if (y_df$flight_distance[i] >= 371.00 & y_df$flight_distance[i]<= 2000.00)
  {
    y_df$flight_distance[i] <- "fd 2"
  }
  else
  {
    y_df$flight_distance[i]<- "fd 3"
  }
}

summary(y_df$Likelihood_to_recommend)

for (i in 1:length(y_df$Likelihood_to_recommend))
{
  if (y_df$Likelihood_to_recommend[i]== 0)
  {
    y_df$Likelihood_to_recommend[i] <- "Detractor"
  }
  else if (y_df$Likelihood_to_recommend[i]== 1)
  {
    y_df$Likelihood_to_recommend[i] <- "Detractor"
  }
  else if (y_df$Likelihood_to_recommend[i]== 2)
  {
    y_df$Likelihood_to_recommend[i] <- "Detractor"
  }
  else if (y_df$Likelihood_to_recommend[i]== 3)
  {
    y_df$Likelihood_to_recommend[i] <- "Detractor"
  }
  else if (y_df$Likelihood_to_recommend[i]== 4)
  {
    y_df$Likelihood_to_recommend[i] <- "Detractor"
  }
  else if (y_df$Likelihood_to_recommend[i]== 5)
  {
    y_df$Likelihood_to_recommend[i] <- "Detractor"
  }
  else if (y_df$Likelihood_to_recommend[i]== 6)
  {
    y_df$Likelihood_to_recommend[i] <- "Detractor"
  }
  else if (y_df$Likelihood_to_recommend[i]== 7)
  {
    y_df$Likelihood_to_recommend[i] <- "Passive"
  }
  else if (y_df$Likelihood_to_recommend[i]== 8)
  {
    y_df$Likelihood_to_recommend[i] <- "Passive"
  }
  else if (y_df$Likelihood_to_recommend[i]== 9)
  {
    y_df$Likelihood_to_recommend[i]<- "Promoter"
  }
  else if (y_df$Likelihood_to_recommend[i] == 10)
  {
    y_df$Likelihood_to_recommend[i]<- "Promoter"
  }
  
}
View(y_df$Likelihood_to_recommend)
summary(y_df$origin_longitude)
for (i in 1:length(y_df$origin_longitude))
{
  if (y_df$origin_longitude[i] >= -165.39 & y_df$origin_longitude[i]<= -111.93)
  {
    y_df$origin_longitude[i] <- " olo 1"
  }
  else if (y_df$origin_longitude[i] >= -111.92 & y_df$origin_longitude[i]<= -81.61)
  {
    y_df$origin_longitude[i] <- "olo 2"
  }
  else
  {
    y_df$origin_longitude[i]<- "olo 3"
  }
}

summary(y_df$origin_latitude)
for (i in 1:length(y_df$origin_latitude))
{
  if (y_df$origin_latitude[i] >= 18.02 & y_df$origin_latitude[i]<= 33.82)
  {
    y_df$origin_latitude[i] <- " ola 1"
  }
  else if (y_df$origin_latitude[i] >= 33.83 & y_df$origin_latitude[i]<= 41.07)
  {
    y_df$origin_latitude[i] <- "ola 2"
  }
  else
  {
    y_df$origin_latitude[i]<- "ola 3"
  }
}

summary(y_df$destination_longitude)
for (i in 1:length(y_df$destination_longitude))
{
  if (y_df$destination_longitude[i] >= -165.39 & y_df$destination_longitude[i]<= -111.93)
  {
    y_df$destination_longitude[i] <- " dl0 1"
  }
  else if (y_df$destination_longitude[i] >= -111.92 & y_df$destination_longitude[i]<= -81.64)
  {
    y_df$destination_longitude[i] <- "dlo 2"
  }
  else
  {
    y_df$destination_longitude[i]<- "dlo 3"
  }
}

summary(y_df$destination_latitude)
for (i in 1:length(y_df$destination_latitude))
{
  if (y_df$destination_latitude[i] >= -165.39 & y_df$destination_latitude[i]<= -111.93)
  {
    y_df$destination_latitude[i] <- " dl0 1"
  }
  else if (y_df$destination_latitude[i] >= -111.92 & y_df$destination_latitude[i]<= -81.64)
  {
    y_df$destination_latitude[i] <- "dlo 2"
  }
  else
  {
    y_df$destination_latitude[i]<- "dlo 3"
  }
}



install.packages("arules")
library(arules)
install.packages("arulesViz")
library(arulesViz)
install.packages("caTools")
library(caTools)

install.packages("dplyr")
library(dplyr)

df1<-mutate_all(y_df,as.factor)
str(df1)
df_t<-as(df1,"transactions") #load arules package if it doesnt work
summary(df_t)
itemFrequency(df_t)
itemFrequencyPlot(df_t)
itemLabels(df_t)

#Ruleset for Likelihood_to_recommend = low
ruleset <- apriori(df_t, parameter=list(support=0.1, confidence=0.6, minlen=2, maxlen=10, maxtime=10),
                   appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Detractor")))
rule1<- sort(ruleset,by="lift")
plot(rule1, method="graph")
plot(rule1, method="paracoord")
plot(rule1, method="scatterplot")

inspect(rule1)
inspectDT(rule1)

#Ruleset for Likelihood_to_recommend = low
ruleset2 <- apriori(df_t, parameter=list(support=0.02, confidence=0.4, minlen=2, maxlen=10, maxtime=10),
                   appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Passive")))
rule2<- sort(ruleset2,by="lift")
inspect(rule2)
inspectDT(rule2)
plot(rule2, method="graph")
plot(rule2, method="paracoord")
plot(rule2, method="scatterplot")

#Ruleset for Likelihood_to_recommend= high
ruleset4 <- apriori(df_t, parameter=list(support=0.02, confidence=0.4, minlen=2, maxlen=10, maxtime=10),
                    appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Promoter")))
rule4<- sort(ruleset4,by="lift")
inspect(rule4)
inspectDT(rule4)
plot(rule4, method="graph")
plot(rule4, method="paracoord")
plot(rule4, method="scatterplot")


#creating a dataframe from the main datframe which contains data only for flyfast airlines
flyfast_airlines <- y_df[str_trim(y_df$Partner_name)=="FlyFast Airways Inc.",]
View(flyfast_airlines)
# Plotting the data for gender and likelihood.to.recommend
ggplot(flyfast_airlines,aes(x=Gender)) + geom_histogram(binwidth=20000,stat="count",color="black",aes(fill=Likelihood_to_recommend))

flyfast_a<-mutate_all(flyfast_airlines,as.factor)
str(flyfast_a)
flyfast_df<-as(flyfast_a,"transactions") #load arules package if it doesnt work
summary(flyfast_df)
itemFrequency(flyfast_df)
itemFrequencyPlot(flyfast_df)
itemLabels(flyfast_df)

#Ruleset for Likelihood_to_recommend = low
ruleset5 <- apriori(flyfast_df, parameter=list(support=0.1, confidence=0.6, minlen=2, maxlen=10, maxtime=10),
                   appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Detractor")))
rule5<- sort(ruleset5,by="lift")
plot(rule5, method="graph")
plot(rule5, method="paracoord")
plot(rule5, method="scatterplot")

inspect(rule5)
inspectDT(rule5)

#Ruleset for Likelihood_to_recommend = low
ruleset6 <- apriori(flyfast_df, parameter=list(support=0.02, confidence=0.4, minlen=2, maxlen=10, maxtime=10),
                    appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Passive")))
rule6<- sort(ruleset6,by="lift")
inspect(rule6)
inspectDT(rule6)
plot(rule6, method="graph")
plot(rule6, method="paracoord")
plot(rule6, method="scatterplot")

#Ruleset for Likelihood_to_recommend= high
ruleset7 <- apriori(flyfast_df, parameter=list(support=0.02, confidence=0.4, minlen=2, maxlen=10, maxtime=10),
                    appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Promoter")))
rule7<- sort(ruleset7,by="lift")
inspect(rule7)
inspectDT(rule7)
plot(rule7, method="graph")
plot(rule7, method="paracoord")
plot(rule7, method="scatterplot")

#creating a dataframe from the main datframe which contains data only for northwest business airlines
northwest_airlines <- y_df[str_trim(y_df$Partner_name)=="Northwest Business Airlines Inc.",]
View(northwest_airlines)
# Plotting the data for gender and likelihood.to.recommend
ggplot(northwest_airlines,aes(x=Gender)) + geom_histogram(binwidth=20000,stat="count",color="black",aes(fill=Likelihood_to_recommend))

northwest_a<-mutate_all(northwest_airlines, as.factor)
str(northwest_a)
northwest_df<-as(northwest_a,"transactions") #load arules package if it doesnt work
summary(northwest_df)
itemFrequency(northwest_df)
itemFrequencyPlot(northwest_df)
itemLabels(northwest_df)


#Ruleset for Likelihood_to_recommend = low
ruleset8 <- apriori(northwest_df, parameter=list(support=0.1, confidence=0.6, minlen=2, maxlen=10, maxtime=10),
                    appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Detractor")))
rule8<- sort(ruleset8,by="lift")
plot(rule8, method="graph")
plot(rule8, method="paracoord")
plot(rule8, method="scatterplot")

inspect(rule8)
inspectDT(rule8)

#Ruleset for Likelihood_to_recommend = low
ruleset9 <- apriori(northwest_df, parameter=list(support=0.02, confidence=0.4, minlen=2, maxlen=10, maxtime=10),
                    appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Passive")))
rule9<- sort(ruleset9,by="lift")
inspect(rule9)
inspectDT(rule9)
plot(rule9, method="graph")
plot(rule9, method="paracoord")
plot(rule9, method="scatterplot")

#Ruleset for Likelihood_to_recommend= high
ruleset10 <- apriori(northwest_df, parameter=list(support=0.05, confidence=0.5, minlen=2, maxlen=10, maxtime=10),
                    appearance = list(default="lhs", rhs=("Likelihood_to_recommend=Promoter")))
rule10<- sort(ruleset10,by="lift")
inspect(rule10)
inspectDT(rule10)
plot(rule10, method="graph")
plot(rule10, method="paracoord")
plot(rule10, method="scatterplot")





###########################   NPS      ########################################
count <- table(y_df$Partner_name,y_df$Likelihood_to_recommend)
View(nps_airline)
nps_airline <- data.frame(Airlines = unique(rownames(count)),Detractor = count[,1],Passive = count[,2],Promoters = count[,3])
nps_airline$Nps <- ((nps_airline$Promoters - nps_airline$Detractor)/(nps_airline$Promoters + nps_airline$Detractor + nps_airline$Passive))*100
order(nps_airline$Nps, decreasing = TRUE)                         

#i will calculate the nps now

install.packages("ggplot2")
library(ggplot2)
ggplot(nps_airline,aes(x=reorder(Airlines,Nps),y=Nps)) + geom_col(aes(fill=Nps))+ theme(axis.text.x = element_text(angle = 90, hjust = 1))

View(count)














































install.packages("kernlab")
library(kernlab)

# SVM
df22 <- my_df

#creating a new column of promoters, passvie and detractors
for (i in 1:length(df22$Likelihood_to_recommend))
{
  if (df22$Likelihood_to_recommend[i] < 7) 
  {
    df22$pr_pa_dt[i] <- "Detractor"
  } 
  else if (df22$Likelihood_to_recommend[i] >= 7 & df22$Likelihood_to_recommend[i] <= 8)
  {
    df22$pr_pa_dt[i] <- "Passive"
  }
  else 
  {
    df22$pr_pa_dt[i] <- "Promoter"
  }
}
View(df22)

# creating 3 levels for age
for (i in 1:length(df22$Age))
{
  if (df22$Age[i] >=15 & df22$Age[i] <= 29) 
  {
    df22$Age_group[i] <- "Age between 15 and 29"
  } 
  else if (df22$Age[i] >=30 & df22$Age[i] <= 54)
  {
    df22$Age_group[i] <- "Age between 30 and 54"
  }
  else 
  {
    df22$Age_group[i] <- "Age above 54"
  }
}
df22$Age_group <- as.factor(df22$Age_group)
View(df22)
# removing unwanted columns
df22 <- df22[,c(-1,-2,-4,-7,-15,-16,-17,-18,-21,-22,-23,-24,-25,-27,-28,-29,-30,-31,-32)]
df22 <- df22[,-8]
df22 <- df22[,-15]
colnames(df22)

summary(df22)

# creating random sample for training and test dataset
randIndex1 <- sample(1:dim(df22)[1])
cutPoint2_3 <- floor(2 * dim(df22)[1]/3)
trainData_1 <- df22[randIndex1[1:cutPoint2_3],] 
testData_1 <- df22[randIndex1[(cutPoint2_3+1):dim(df22)[1]],]
View(testData_1)

install.packages("caret")
library(caret)
# running support vector machine
svmOutput_1 <- ksvm(pr_pa_dt ~.,data=trainData_1,kernel="rbfdot",kpar="automatic",C = 5,cross = 3,prob.model = TRUE)
svmOutput_1
View(svmOutput_1)

#performing prediction
svmPred_1 <- predict(svmOutput_1, testData_1) 

# for accuracy
confusionMatrix(svmPred_1,testData_1$pr_pa_dt) 


############ SVM for loyalty#########
df_customer <- NULL
df_customer <- my_df[, c(3,4,5,6,7,9,10,11,12,29,8,23,30)]

df_svm <- df_customer[,c(-12,-14)]
df_svm$Loyalty[df_svm$Loyalty>=0.5] <- "loyal"
df_svm$Loyalty[df_svm$Loyalty != "loyal"] <- "not loyal"
summary(df_svm$Total_Freq_Flyer_Accts)

df_svm$randIndex <- sample(1:dim(df_svm)[1])
cutPoint2_3_lo <- floor(2 * dim(df_svm)[1]/3)
trainData_lo <- df_svm[df_svm$randIndex[1:cutPoint2_3_lo],]
testData_lo <- df_svm[df_svm$randIndex[(cutPoint2_3_lo+1):dim(df_svm)[1]],]

install.packages("caret")
library(caret)
svmmodel <- ksvm(Loyalty ~ ., data = trainData_lo[,-12], kernel = "rbfdot", kpar = "automatic", 
                 C = 5, cross = 3, prob.model = TRUE)
svmmodel

svmPred <- predict(svmmodel, testData_lo)
svmPred
svmPred <- as.factor(svmPred)
testData_lo$Loyalty <- as.factor(testData_lo$Loyalty)

install.packages("e1071")
library(e1071)
confusionMatrix(svmPred,testData_lo$Loyalty)

################## svm for fequent flyer accounts##########
for (i in 1:length(df_svm$Total_Freq_Flyer_Accts))
{
  if (df_svm$Total_Freq_Flyer_Accts[i] < 6) 
  {
    df_svm$Total_Freq_Flyer_Accts[i] <- "Not a frequent flyer"
  } 
 
  else 
  {
    df_svm$Total_Freq_Flyer_Accts[i] <- "Frequent flyer"
  }
}

svmmodel1 <- ksvm(Total_Freq_Flyer_Accts ~ ., data = trainData_lo, kernel = "rbfdot", kpar = "automatic", 
                 C = 5, cross = 3, prob.model = TRUE)
svmmodel1
svmPred1 <- predict(svmmodel1, testData_lo)
svmPred1

svmPred1 <- as.factor(svmPred1)
testData_lo$Total_Freq_Flyer_Accts <- as.factor(testData_lo$Total_Freq_Flyer_Accts)
confusionMatrix(svmPred1,testData_lo$Total_Freq_Flyer_Accts)

################# svm for shopping###############
summary(my_df$Shopping_at_airport)
df_svm$Shopping_at_airport[df_svm$Shopping_at_airport>= 28.73] <- "frequent shopper"
View(df_svm)
df_svm$Shopping_at_airport[df_svm$Shopping_at_airport != "frequent shopper"] <- "not a frequent shopper"

svmmodel1 <- ksvm(Shopping_at_airport ~ ., data = trainData_lo, kernel = "rbfdot", kpar = "automatic", 
                  C = 5, cross = 3, prob.model = TRUE)
svmmodel1
svmPred1 <- predict(svmmodel1, testData_lo)
svmPred1

svmPred1 <- as.factor(svmPred1)
testData_lo$Total_Freq_Flyer_Accts <- as.factor(testData_lo$Total_Freq_Flyer_Accts)
confusionMatrix(svmPred1,testData_lo$Total_Freq_Flyer_Accts)





######################SVM: Delay and flight time in minutes that may lead to the change of loyalty/likelihood to recommend###################
dfnew <- my_df
View(dfnew)

dfnew$True_Arrival_Delay <- dfnew$arrival_delay_in_minutes
dfnew$True_Arrival_Delay[which(my_df$arrival_delay_in_minutes < 6)] <- 0
trainindex_d <- sample(c(1,2), nrow(dfnew),replace= T,prob = c(0.67,0.33))
traindata_d <- dfnew[trainindex_d==1,]
testdata_d <- dfnew[trainindex_d==2,]
svmOutputd <- ksvm(Loyalty ~ departure_delay_in_minutes+True_Arrival_Delay+flight_time_in_minutes,
                   data=traindata_d,kernel="rbfdot", kpar="automatic",C=40,cross=4, prob.model=TRUE)
svmOutputd

svmresultd <- predict(svmOutputd, testdata_d, type="votes")
svmresultd


comparable1 <- (testdata_d[,8]-svmresultd)<0.8&(testdata_d[,8]-svmresultd)>-0.7
resultd <- table(comparable1)
resultd
accuraryratio1 <- resultd[2]/(sum(resultd))
accuraryratio1

svmOutputd1 <- ksvm(Likelihood_to_recommend ~ departure_delay_in_minutes+True_Arrival_Delay+
                     flight_time_in_minutes+flight_distance,
                   data=traindata_d,kernel="rbfdot", kpar="automatic",C=40,cross=4, prob.model=TRUE)
svmOutputd1

svmresult2 <- predict(svmOutputd1,testdata_d,type="votes")
View(svmresult2)
comparable2 <- (testdata_d[,25]-svmresult2)<6.5&(testdata_d[,25]-svmresult2)>3.5
result2 <- table(comparable2)
result2
accuraryratio2 <- result2[2]/(sum(result2))
accuraryratio2


















































































#Phase 4


install.packages("maps")
library(maps)
states <- map_data("state")

MAP<- ggplot(data = states) +
  borders("state",colour = "black",fill = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE) 
MAP

#Northwest Business Airlines Inc.
NBA <- subset(my_df,Partner_name=="Northwest Business Airlines Inc.")
NBAmap <- MAP+
  geom_curve(data=NBA,
             aes(x=origin_longitude,y=origin_latitude,xend=destination_longitude,yend=destination_latitiude),
             color="#17202A",
             size=0.70,
             curvature=0.1) +
  geom_point(data=NBA,
             aes(x=origin_longitude,y=origin_latitude),
             size = 2.5, 
             alpha = 1, 
             na.rm = T,
             shape = 20, 
             colour = "blue" ) +
  geom_point(data=NBA,
             aes(x=destination_longitude,y=destination_latitiude),
             size = 2.5, 
             alpha = 1, 
             na.rm = T,
             shape = 20, 
             colour = "blue"
  ) +
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 12)) + 
  ggtitle("Northwest Business Airlines Inc.") 

NBAmap

str(my_df)

unique(my_df$Partner_name)

################ FlyFast Airways Inc.#################

FA <- subset(my_df,Partner_name=="FlyFast Airways Inc.")
FAmap <- MAP+
  geom_curve(data=FA,
             aes(x=origin_longitude,y=origin_latitude,xend=destination_longitude,yend=destination_latitiude),
             color="#17202A",
             size=0.70,
             curvature=0.1) +
  geom_point(data=FA,
             aes(x=origin_longitude,y=origin_latitude),
             size = 2.5, 
             alpha = 1, 
             na.rm = T,
             shape = 20, 
             colour = "blue" ) +
  geom_point(data=FA,
             aes(x=destination_longitude,y=destination_latitiude),
             size = 2.5, 
             alpha = 1, 
             na.rm = T,
             shape = 20, 
             colour = "blue"
  ) +
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 12)) + 
  ggtitle("FlyFast Airways Inc.") 

FAmap

#################### GoingNorth Airlines Inc. ##############################
GA <- subset(my_df,Partner_name=="GoingNorth Airlines Inc.")
GAmap <- MAP+
  geom_curve(data=GA,
             aes(x=origin_longitude,y=origin_latitude,xend=destination_longitude,yend=destination_latitiude),
             color="#17202A",
             size=0.70,
             curvature=0.1) +
  geom_point(data=GA,
             aes(x=origin_longitude,y=origin_latitude),
             size = 2.5, 
             alpha = 1, 
             na.rm = T,
             shape = 20, 
             colour = "blue" ) +
  geom_point(data=GA,
             aes(x=destination_longitude,y=destination_latitiude),
             size = 2.5, 
             alpha = 1, 
             na.rm = T,
             shape = 20, 
             colour = "blue"
  ) +
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 12)) + 
  ggtitle("GoingNorth Airlines Inc.") 

GAmap

########################## Oursin Airlines Inc. #########################
OA <- subset(my_df,Partner_name=="Oursin Airlines Inc.")
OAmap <- MAP+
  geom_curve(data=OA,
             aes(x=origin_longitude,y=origin_latitude,xend=destination_longitude,yend=destination_latitiude),
             color="#17202A",
             size=0.70,
             curvature=0.1) +
  geom_point(data=OA,
             aes(x=origin_longitude,y=origin_latitude),
             size = 2.5, 
             alpha = 1, 
             na.rm = T,
             shape = 20, 
             colour = "blue" ) +
  geom_point(data=OA,
             aes(x=destination_longitude,y=destination_latitiude),
             size = 2.5, 
             alpha = 1, 
             na.rm = T,
             shape = 20, 
             colour = "blue"
  ) +
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 12)) + 
  ggtitle("Oursin Airlines Inc.") 

OAmap




























############# Business questions##################


# 1) which airlines have the highest and lowest levels of satisfaction?
# use visualization
# 2) how is age affecting likelihood to recommend?
dfviz <- my_df
dfviz1 <- y_df
dfviz$ageGroup[dfviz$Age < 30] <- "29 or younger"
dfviz$ageGroup[dfviz$Age > 29 & dfviz$Age < 56] <- "30-55"
dfviz$ageGroup[dfviz$Age > 55] <- "56 or above"

# age group vs promoter score
# subsetting
youngAge <- subset(dfviz, dfviz$ageGroup == "29 or younger")
medianAge <- subset(dfviz, dfviz$ageGroup == "30-55")
oldAge <- subset(dfviz, dfviz$ageGroup == "56 or above")

# replicate age group
replicateyoung <- replicate(200, mean(sample(youngAge$Likelihood_to_recommend, size = 10, replace = TRUE)), simplify = TRUE) # replicate the sample mean
replicatemedian <- replicate(200, mean(sample(medianAge$Likelihood_to_recommend, size = 10, replace = TRUE)), simplify = TRUE) # replicate the sample mean
replicateold <- replicate(200, mean(sample(oldAge$Likelihood_to_recommend, size = 10, replace = TRUE)), simplify = TRUE) # replicate the sample mean
# add to a data frame
replicateAge <- data.frame(replicateyoung, replicatemedian, replicateold)

# Histogram for 29 or younger
repliAgeYoungHist <- ggplot(replicateAge) +
  aes(x = replicateAge$replicateyoung) +
  geom_histogram(bins = 10, fill = "white", color = "black") +
  ggtitle("Histogram of 29 or younger") +
  xlab("Likelihood to Recommend")
repliAgeYoungHist

# histogram for 30-55
repliAgeMedHist <- ggplot(replicateAge) +
  aes(x = replicateAge$replicatemedian) +
  geom_histogram(bins = 10, fill = "white", color = "black") +
  ggtitle("Histogram of age group 30-55") +
  xlab("Likelihood to Recommend")
repliAgeMedHist

# histogram for 56 or above
repliAgeOldHist <- ggplot(replicateAge) +
  aes(x = replicateAge$replicateold) +
  geom_histogram(bins = 10, fill = "white", color = "black") +
  ggtitle("Histogram of Age Group 56 or above") +
  xlab("Likelihood to Recommend")
repliAgeOldHist
install.packages("ggpubr")
library(ggpubr)
ggarrange(repliAgeYoungHist, repliAgeMedHist ,repliAgeOldHist ,labels = c("A", "B","C"),nrow = 2,ncol = 2)

# get the median value of each group to estimate the true mean
median(replicateyoung) #7.2
median(replicatemedian) #7.9
median(replicateold) #6.4
# replicatemedian > replicateyoung > replicateold


# score of different age group: boxplot
ageVsScore <- ggplot(dfviz) +
  aes(x = dfviz$ageGroup, y = dfviz$Likelihood_to_recommend, fill = dfviz$ageGroup) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Age Group VS Likelihood to Recommend") +
  labs(x = "Age Group", y = "Likelihood to Recommend", fill = "Age Group")
ageVsScore

# 3) How is gender affecting the likelihoood to recommend


# Gender vs liklihood to recommend (boxplot)
genderVsScore <- ggplot(dfviz) +
  aes(x = dfviz$Gender, y = dfviz$Likelihood_to_recommend, fill = dfviz$Gender) +
  geom_boxplot(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Gender VS Likelihood to Recommend") +
  labs(x = "Gender", y = "Likelihood to Recommend", fill = "Gender")
genderVsScore


# Gender by airline
genderVsRecommend <- ggplot(dfviz1) +
  aes(x = dfviz1$Likelihood_to_recommend, fill = dfviz1$Gender) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Gender Count VS Detractor, Passive, Promoter") +
  labs(x = "Likelihood to recommend", y = "Count", fill = "Gender")
genderVsRecommend

genderAirline <- ggplot(dfviz) +
  aes(fill = dfviz$Gender,x = dfviz$Partner_name) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  ggtitle("Gender VS Airline") +
  labs(x = "Partner Name", y = "Count", fill = "Gender")
genderAirline

# 4) how is price sensitivity affecting the likelihood?
priceSenVsScore <- ggplot(dfviz) +
  aes(x = dfviz$Price_Sensitivity, y = dfviz$Likelihood_to_recommend, fill = dfviz$Price_Sensitivity) +
  geom_boxplot(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Price Sensitivity VS Likelihood to Recommend") +
  labs(x = "Price Sensitivity", y = "Likelihood to Recommend", fill = "Price Sensitivity")
priceSenVsScore


priceSenVsRecommend <- ggplot(dfviz1) +
  aes(x = dfviz1$Likelihood_to_recommend, fill = dfviz1$Price_Sensitivity) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Price Sensitivity VS Detractor, Passive, Promoter") +
  labs(x = "Likelihood to recommend", y = "Count", fill = "Price Sensitivity")
priceSenVsRecommend


# 5) how type of travel is affecting likelihood to recommend
ggplot(y_df,aes(x=Type_of_travel)) + geom_histogram(stat="count",color="black",aes(fill=Likelihood_to_recommend))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

travelTypeRecommend <- ggplot(dfviz1) +
  aes(x=dfviz1$Type_of_travel, fill = dfviz1$Likelihood_to_recommend) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Travel Type vs likelihood to recommend") +
  labs(x = "Travel Type", y = "Count", fill = "promoter/passive/detractor")
travelTypeRecommend

# 6) how is airline status affecting ltr
airStatusRecommend <- ggplot(dfviz1) +
  aes(x=dfviz1$Airline_status, fill = dfviz1$Likelihood_to_recommend) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Airline Status vs liklihood to recommend") +
  labs(x = "Airline Status", y = "Count", fill = "promoter/passive/detractor")
airStatusRecommend
# 7) loyalty vs ltr
library(ggplot2)
#boxplot
ggplot(data = my_df, aes(x = Likelihood_to_recommend, y = Loyalty)) + geom_boxplot() + facet_wrap(~ Likelihood_to_recommend, scales="free")

#ggplot
travelLoyalty <- ggplot(dfviz1) +
  aes(x=dfviz1$Loyalty, fill = dfviz1$Likelihood_to_recommend) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Loyalty vs likelihood to recommend") +
  labs(x = "Loyalty", y = "Count", fill = "promoter/passive/detractor")
travelLoyalty

#8)how old are people who took these flights?
#9) why i chose flyfast and northwest for my analysis
























