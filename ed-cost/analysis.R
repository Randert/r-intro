# Educational cost exploratory data analysis -- see README.md for data details

#### Set up ####

# Set your working directory
setwd('~/Documents/info-370/r-intro/ed-cost/')

# Install external libraries for use - only needs to be done once on your machine
# install.packages(dplry) 
# install.packages(plotly)
# install.packages(stringr)

# Load the libraries into R - needs to be done each time you want to use the library
library(dplyr) 
library(stringr)
library(ggplot2)
library(plotly)

# Set margin spacing for graphics
par(mar=c(5,8,4,2))

# Load data into R using the `read.csv` function
ed.data <- read.csv('./data/cost-data.csv')

#### Getting to know your data #####

# View it
View(ed.data)

# Determine shape of the dataset
dim(ed.data)

# View / change column names
colnames(ed.data)
colnames(ed.data)[8] <- 'tuition.2012'
colnames(ed.data)[9] <- 'tuition.2014'

# Use the `nrow` function to determine how many institutions there are
nrow(ed.data)

# What was the most expensive school in 2014 (base R calculation)?
most.expensive <- ed.data[ed.data$tuition.2014 == max(ed.data$tuition.2014),] # using basic R selection
most.expensive$tuition.2014
#Most expensive is New England Culinary institute and it was $88550

# What was the most expensive school in 2014 (using dplyr)?
most.expensive <- ed.data %>% 
      filter(tuition.2014 == max(tuition.2014)) %>%  
      select(Name.of.institution)
most.expensive$Name.of.institution
#This also says most expensive is New England Culinary institute

# What was the least expensive school in 2014?
least.expensive <- ed.data %>% 
  filter(tuition.2014 == min(tuition.2014)) %>%  
  select(Name.of.institution, tuition.2014)
#The least expensive was Diamond Beauty College and cost was $200


#### What is the average annual tuition by sector in 2014? ####
sector.anual.tuition <- ed.data %>%
  group_by(Sector,Sector.name) %>%              
  summarise(mean = mean(tuition.2014))

sector.grouped <- ed.data %>%
  group_by(Sector.name)



# Show a `barplot of the cost by sector
barplot(sector.anual.tuition$mean)



#### How did the cost of UW rank against other Washington schools? ####


#### Which *sector* had the largest average change in tuition? ####


##### Which state has the most higher-ed institutions? #####


##### Bonus: Map the number of schools using plotly #####
# Hint: See https://plot.ly/r/choropleth-maps/
