#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 


dat <- read_dta(file= "input/anes_timeseries_2016_dta.zip")
dat <- read_dta(file= "input/anes_timeseries_2012_dta.zip")
dat <- read.csv(file = "input/anes_timeseries_2016_methodology_csv.zip")
dat <- read.csv(file= "input/anes_timeseries_2016_voteval.csv.zip")
dat <- read.csv(file= "input/anes_timeseries_2012_voteval.csv.zip")

#source in any useful functions
source("useful_functions.R")