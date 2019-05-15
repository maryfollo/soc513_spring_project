#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 

library(haven) 
library(readr)
anes2016 <- read_dta(file= "input/anes_timeseries_2016_dta.zip")
anes2012 <- read_dta(file= "input/anes_timeseries_2012_dta.zip")

voteval2016 <- read_csv(file= "input/anes_timeseries_2016_voteval_csv.zip")
voteval2012 <- read_csv(file= "input/anes_timeseries_2012_voteval_csv.zip")

#source in any useful functions
source("useful_functions.R")