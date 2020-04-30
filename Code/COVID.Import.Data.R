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

Install_And_Load(c("here","tidyverse"))

## ---------------------------------------------------------------------
#Import data

CHILD <- read.csv(here::here("Data","ELS_COVID_Child.csv"))
PARENT <- read.csv(here::here("Data","ELS_COVID_PARENT.csv"))
ELS.T1 <- read.csv(here::here("Data","ELS_T1_COVID_Curated.csv"))
ELS.T2 <- read.csv(here::here("Data","ELS_T2_COVID_Curated.csv"))
ELS.T3 <- read.csv(here::here("Data","ELS_T3_COVID_Curated.csv"))
ELS_DEMO<- read.csv(here::here("Data", "ELS_DEMO.csv"))
ELS_sumsev<- read.csv(here::here("Data","ELS_Severity_Scores.csv"))
CHILD.TIGER <- read.csv(here::here("Data","TIGER_COVID_Child.csv"))
TIGER.Amyg <- read.csv(here::here("Data","TIGER_ELS_RSFC_April2020.csv"))
TIGER.Curated <- read.csv(here::here("Data","TIGER_ELS_GOLDEN_Curated_3.13.2020.csv"))

## ---------------------------------------------------------------------

## Create ELS_ID variable in CHILD data.frame

CHILD <- CHILD %>%
  mutate(ELS_ID = as.numeric(substr(record_id,1,3)))

## ---------------------------------------------------------------------
#Remove the non tiger subjects. 
TIGER.Curated <- TIGER.Curated[grep("-T1",TIGER.Amyg$ID),]

#Create IDs for merging
TIGER.Curated <- TIGER.Curated %>%
  mutate(ID = as.numeric(substr(SubjID,1,nchar(as.character(SubjID))-3)))  

## ---------------------------------------------------------------------
#RS TIGER
#Remove the non tiger subjects. 
TIGER.Amyg <- TIGER.Amyg[grep("-T1",TIGER.Amyg$ID),]

# TIGER.Amyg <- TIGER.Amyg.backup
TIGER.Amyg <- TIGER.Amyg %>%
  mutate(ID = as.numeric(substr(ID,1,nchar(as.character(ID))-3))) 



