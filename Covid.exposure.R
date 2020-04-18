## ---------------------------
##
## Script name: COVID exposure
## Purpose of script: Examine emotional regulation at T3 and COVID timepoints, change in emotional regulation, and their relation with psychological outcomes during COVID outbreak
##
##
## Author: Dr. Anthony J. Gifuni
##
## Date Created: 2018-04-11
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
##
## set libraries

Install_And_Load <- function(packages) {
  k <- packages[!(packages %in% installed.packages()[,"Package"])];
  if(length(k))
  {install.packages(k, repos="https://cran.rstudio.com/");}
  
  for(package_name in packages)
  {library(package_name,character.only=TRUE, quietly = TRUE);}
}

Install_And_Load(c("tidyverse"))
## ---------------------------------------------------------------------
## set working directory for Mac and PC


# box.dir <- "/Users/gifuni/Box" #This will change on local machine
box.dir<- "/Users/rachelweisenburger/Box/Externally_Shareable_Files" #for Rachel
data.dir <- "/mooddata_nophi/ELS_RDoC/T-COVID-19/DATA/" 
#results.dir <- #This will change on local machine


## ---------------------------------------------------------------------
#Import data

data.child.file <- "ELS_COVID_CHILD.csv"
CHILD.csv <- paste0(box.dir,data.dir,data.child.file )
CHILD.exposure <- read.csv(CHILD.csv)

## ---------------------------------------------------------------------

#COVID direct exposure:

#"... have you been diagnosed with Coronavirus/COVID-19 infection?"
# Answers: ("Yes, I have/had a positive test","Yes, I have/had a medical diagnosis, but no test","Yes, I have/had some possible symptoms, but no diagnosis by a doctor","No")
CHILD.exposure$Covid.self.diagnosis <-  as.numeric(4 != as.numeric(CHILD.exposure$covid_exposure_c_2))
# ".. has anyone in your family been diagnosed with Coronavirus/COVID-19?"
#Family member in the household
CHILD.exposure$Covid.household.diagnosis <- as.numeric(CHILD.exposure$covid_exposure_c_4___1)
#Family member not in the household
CHILD.exposure$Covid.nonhousehold.diagnosis <- as.numeric(CHILD.exposure$covid_exposure_c_4___2)
#Any family member
CHILD.exposure$Covid.allfamily.diagnosis <- as.numeric( CHILD.exposure$Covid.household.diagnosis + CHILD.exposure$Covid.nonhousehold.diagnosis > 0)

#Covid adverse events in the family
#fallen ill
CHILD.exposure$Covid.family.ill <- as.numeric(CHILD.exposure$covid_exposure_c_6___1)
#Hospitalized
CHILD.exposure$Covid.family.hospitalized <- as.numeric(CHILD.exposure$covid_exposure_c_6___2)
#Quarantined with symptoms
CHILD.exposure$Covid.family.quarantineSx <- as.numeric(CHILD.exposure$covid_exposure_c_6___3)
#Quarantined without symptoms
CHILD.exposure$Covid.family.quarantineNoSx <- as.numeric(CHILD.exposure$covid_exposure_c_6___4)
#Loss job
CHILD.exposure$Covid.family.jobloss <- as.numeric(CHILD.exposure$covid_exposure_c_6___5)
#Decrease ability to earn money
CHILD.exposure$Covid.family.lossmoney <- as.numeric(CHILD.exposure$covid_exposure_c_6___6)
#Death
#Covid.family.death <- as.numeric(covid_exposure_c_6___7)
#Currently no death in our sample.


#Worries of being infected
CHILD.exposure$Worry.self.infection <- as.numeric(CHILD.exposure$covid_exposure_c_7)
#Worries that someone might be infected
CHILD.exposure$Worry.other.infection <- as.numeric(CHILD.exposure$covid_exposure_c_8)
#Exposure to COVID information
CHILD.exposure$Media.exposure <- as.numeric(CHILD.exposure$covid_exposure_c_11)

# Stress of restrictions 
#"... how stressful have the restrictions on leaving home been for you?"
CHILD.exposure$stress.restriction.home = as.numeric(CHILD.exposure$covid_change_c_5)

#"... have your contacts with people outside of your home changed relative to before the Coronavirus/COVID-19 crisis in your area?"
CHILD.exposure$change.social.contact = as.numeric(CHILD.exposure$covid_change_c_6)

#"... how much difficulty have you had following the recommendations for keeping away from close contact with people?"
CHILD.exposure$difficulty.following.restriction = as.numeric(CHILD.exposure$covid_change_c_7)

#"... has the quality of relationships between you and members of your family changed?"
CHILD.exposure$change.family.relation = 6 - as.numeric(CHILD.exposure$covid_change_c_8a)

#"... how stressful have these changes in family contacts been for you?"
CHILD.exposure$stress.family.restrictions = as.numeric(CHILD.exposure$covid_change_c_8b)

#"... has the quality of your relationships with friends changed?"
CHILD.exposure$change.friend.relation = 6 - as.numeric(CHILD.exposure$covid_change_c_9a)

#"... how stressful have these changes in your social contacts been for you?"
CHILD.exposure$stress.friend.restrictions =  as.numeric(CHILD.exposure$covid_change_c_9b)

#"... how much has cancellation of important events (such as graduation, prom, vacation, etc.) in your life been difficult for you in the past two weeks?"
CHILD.exposure$stress.event.cancellation = as.numeric(CHILD.exposure$covid_change_c_10)

#"... to what degree have changes related to Coronavirus/COVID-19 created financial problems for you or your family in the past two weeks?"
CHILD.exposure$stress.financial = as.numeric(CHILD.exposure$covid_change_c_11)

#"... to what degree have changes related to Coronavirus/COVID-19 created financial problems for you or your family in the past two weeks?"
CHILD.exposure$stress.stability = as.numeric(CHILD.exposure$covid_change_c_12)

#"... did you worry whether your food would run out because of a lack on money?"
#Yes or No...
CHILD.exposure$stress.food=as.numeric(CHILD.exposure$covid_change_c_13) 

#"How hopeful are you that the Coronavirus/COVID-19 crisis problem will end soon?"
CHILD.exposure$covid.hopelessness =6 - as.numeric(CHILD.exposure$covid_change_c_14)

#Covid total stress measures:

CHILD.exposure$COVID.STRESS <- CHILD.exposure$Worry.self.infection +
  CHILD.exposure$Worry.other.infection + 
  CHILD.exposure$Media.exposure +
  CHILD.exposure$stress.restriction.home +
  CHILD.exposure$change.social.contact +
  CHILD.exposure$difficulty.following.restriction +
  CHILD.exposure$change.family.relation +
  CHILD.exposure$stress.family.restrictions +
  CHILD.exposure$change.friend.relation +
  CHILD.exposure$stress.friend.restrictions +
  CHILD.exposure$stress.event.cancellation +
  CHILD.exposure$stress.financial +
  CHILD.exposure$stress.stability +
  CHILD.exposure$stress.food * 5 +   ### N.B. Stress.food is a 0 vs 1 item. Here multiplied by 5 to weight with other factors
  CHILD.exposure$covid.hopelessness 

