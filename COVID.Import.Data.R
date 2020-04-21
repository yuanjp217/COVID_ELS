## ---------------------------
##
## Script name: COVID.Import.Data.R
##
## Purpose of script: Import the Child COVID data for child and parents
##
## Author: Dr. Anthony J. Gifuni
##
## Date Created: 2018-04-18
##
## Copyright (c) SNAP Lab, 2020
## Email: gifuni@stanford.edu
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------------------------------------------------

## set libraries

Install_And_Load <- function(packages) {
  k <- packages[!(packages %in% installed.packages()[,"Package"])];
  if(length(k))
  {install.packages(k, repos="https://cran.rstudio.com/");}
  
  for(package_name in packages)
  {library(package_name,character.only=TRUE, quietly = TRUE);}
}

Install_And_Load(c("here"))

## ---------------------------------------------------------------------
#Import data

CHILD <- read.csv(here::here("Data","ELS_COVID_Child.csv"))
PARENT <- read.csv(here::here("Data","ELS_COVID_CHILD.csv"))
ELS.T1 <- read.csv(here::here("Data","ELS_T1_COVID_Curated.csv"))
ELS.T2 <- read.csv(here::here("Data","ELS_T2_COVID_Curated.csv"))
ELS.T3 <- read.csv(here::here("Data","ELS_T3_COVID_Curated.csv"))
ELS_DEMO<- read.csv(here::here("Data", "ELS_DEMO.csv"))
ELS_sumsev<- read.csv(here::here("Data","ELS_Severity_Scores.csv"))






