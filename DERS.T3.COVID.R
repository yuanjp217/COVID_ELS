## ---------------------------
##
## Script name: Emotional regulation at T3 and COVID timepoint: relation with psychological outcomes during COVID outbreak
##
## Purpose of script: Examine emotional regulation at T3 and COVID timepoints, change in emotional regulation, and their relation with psychological outcomes during COVID outbreak
##
##
## Authors: Dr. Anthony J. Gifuni & Rachel Weisenburger
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
box.dir<- "/Users/rachelweisenburger/Box/Externally_Shareable_Files" #RW
data.dir <- "/mooddata_nophi/ELS_RDoC/T-COVID-19/DATA/" #RW
#results.dir <- #This will change on local machine


## ---------------------------------------------------------------------
#Import data

data.child.file <- "ELS_COVID_CHILD.csv"
CHILD.csv <- paste0(box.dir,data.dir,data.child.file )
CHILD <- read.csv(CHILD.csv)

## ---------------------------------------------------------------------
#Scoring measures

# SCORING DERS
#REVERSE CODE #1, #2, #6, #7, #8, #10, #17, #20, #22, #24, #34 THEN SUM ALL
CHILD$DERS_nonaccept.TC<- CHILD$covid_ders_c_11 + CHILD$covid_ders_c_12 + CHILD$covid_ders_c_21 + CHILD$covid_ders_c_23 +  CHILD$covid_ders_c_25 + CHILD$covid_ders_c_29  
CHILD$DERS_goals.TC<- CHILD$covid_ders_c_13 + CHILD$covid_ders_c_18 + abs(CHILD$covid_ders_c_20-6) + CHILD$covid_ders_c_26 + CHILD$covid_ders_c_33
CHILD$DERS_impulse.TC<- CHILD$covid_ders_c_3 + CHILD$covid_ders_c_14 + CHILD$covid_ders_c_19 + abs(CHILD$covid_ders_c_24-6) + CHILD$covid_ders_c_27 + CHILD$covid_ders_c_32
CHILD$DERS_awareness.TC<- abs(CHILD$covid_ders_c_2-6) + abs(CHILD$covid_ders_c_6-6) + abs(CHILD$covid_ders_c_8-6) + abs(CHILD$covid_ders_c_10-6) + abs(CHILD$covid_ders_c_17-6) + abs(CHILD$covid_ders_c_34-6)
CHILD$DERS_strategies.TC<- CHILD$covid_ders_c_15 + CHILD$covid_ders_c_16 + abs(CHILD$covid_ders_c_22-6) + CHILD$covid_ders_c_28 + CHILD$covid_ders_c_30 + CHILD$covid_ders_c_31 + CHILD$covid_ders_c_35 + CHILD$covid_ders_c_36
CHILD$DERS_clarity.TC<- CHILD$covid_ders_c_4 + abs(CHILD$covid_ders_c_1-6) + CHILD$covid_ders_c_5 + abs(CHILD$covid_ders_c_7-6) + CHILD$covid_ders_c_9

CHILD$DERS_total.TC<- CHILD$DERS_nonaccept.TC + CHILD$DERS_goals.TC + CHILD$DERS_impulse.TC + CHILD$DERS_awareness.TC + CHILD$DERS_strategies.TC + CHILD$DERS_clarity.TC

# SCORING MASC
#SUM SUBSCALES & SUM FOR TOTAL
CHILD$masc_TR<- CHILD$covid_masc_1 + CHILD$covid_masc_8 + CHILD$covid_masc_15 + CHILD$covid_masc_20 + CHILD$covid_masc_27 + CHILD$covid_masc_35
CHILD$masc_SA<- CHILD$covid_masc_5 + CHILD$covid_masc_12 + CHILD$covid_masc_18 + CHILD$covid_masc_24 + CHILD$covid_masc_31 + CHILD$covid_masc_38
CHILD$masc_per<- CHILD$covid_masc_2 + CHILD$covid_masc_11 + CHILD$covid_masc_21 + CHILD$covid_masc_28
CHILD$masc_AC<- CHILD$covid_masc_6 + CHILD$covid_masc_13 + CHILD$covid_masc_25 + CHILD$covid_masc_32 + CHILD$covid_masc_36 
CHILD$masc_HR<- CHILD$covid_masc_3 + CHILD$covid_masc_10 + CHILD$covid_masc_16 + CHILD$covid_masc_22 + CHILD$covid_masc_29
CHILD$masc_PP<- CHILD$covid_masc_14 + CHILD$covid_masc_33 + CHILD$covid_masc_37 + CHILD$covid_masc_39
CHILD$masc_ADI<- CHILD$covid_masc_1 + CHILD$covid_masc_6 + CHILD$covid_masc_10 + CHILD$covid_masc_11 + CHILD$covid_masc_12 + CHILD$covid_masc_16 + CHILD$covid_masc_21 + CHILD$covid_masc_23 + CHILD$covid_masc_30 + CHILD$covid_masc_33

CHILD$MASC_phys.TC<- CHILD$masc_TR + CHILD$masc_SA
CHILD$MASC_harm.TC<- CHILD$masc_per + CHILD$masc_AC
CHILD$MASC_social.TC<- CHILD$masc_HR + CHILD$masc_PP
CHILD$MASC_sep.TC<- CHILD$covid_masc_4 + CHILD$covid_masc_7 + CHILD$covid_masc_9 + CHILD$covid_masc_17 + CHILD$covid_masc_19 + CHILD$covid_masc_23 + CHILD$covid_masc_26 + CHILD$covid_masc_30 + CHILD$covid_masc_34

CHILD$MASC_total.TC<- CHILD$MASC_phys.TC + CHILD$MASC_harm.TC + CHILD$MASC_social.TC + CHILD$MASC_sep.TC

CHILD$MASC_phys_tscore <- NA
CHILD$MASC_harm_tscore <- NA
CHILD$MASC_social_tscore<- NA
CHILD$MASC_sep_tscore <- NA
CHILD$MASC_tscore <- NA
CHILD$MASC_inconsistency <- NA
CHILD$MASC_inconsistency<- abs(CHILD$covid_masc_2-CHILD$covid_masc_11) + abs(CHILD$covid_masc_3-covid_masc_10)+ abs(covid_masc_8-covid_masc_15) + abs(covid_masc_12-covid_masc_18) + abs(covid_masc_13-covid_masc_36) + abs(covid_masc_14-covid_masc_33) + abs(covid_masc_16-covid_masc_22) + abs(covid_masc_30-covid_masc_34)

# SCORING STAI
#SUM ALL
CHILD$STAI_total.TC<- CHILD$covid_stai_1 + CHILD$covid_stai_2 + CHILD$covid_stai_3 + CHILD$covid_stai_4 + CHILD$covid_stai_5 + CHILD$covid_stai_6

# SCORING RRS-A
#TAKE THE MEAN
CHILD$RRS_total.TC<- ((CHILD$covid_rrs_a_c_1 + CHILD$covid_rrs_a_c_2 + CHILD$covid_rrs_a_c_3 + CHILD$covid_rrs_a_c_4 + CHILD$covid_rrs_a_c_5 + CHILD$covid_rrs_a_c_6 + CHILD$covid_rrs_a_c_7 + CHILD$covid_rrs_a_c_8 + CHILD$covid_rrs_a_c_9 + CHILD$covid_rrs_a_c_10)/10)*10
CHILD$RRS_reflect.TC<- ((CHILD$covid_rrs_a_c_1 + CHILD$covid_rrs_a_c_3 + CHILD$covid_rrs_a_c_4 + CHILD$covid_rrs_a_c_7 + CHILD$covid_rrs_a_c_8)/5)*5
CHILD$RRS_brood.TC<- ((CHILD$covid_rrs_a_c_2 + CHILD$covid_rrs_a_c_5 + CHILD$covid_rrs_a_c_6 + CHILD$covid_rrs_a_c_9 + CHILD$covid_rrs_a_c_10)/5)*5

# SCORING PSS
#REVERSE CODE #4, #5, #7, AND #8, THEN SUM ALL
CHILD$PSS_total.TC<- CHILD$covid_pss_c_1 + CHILD$covid_pss_c_2 + CHILD$covid_pss_c_3 + abs(CHILD$covid_pss_c_4-4) + abs(CHILD$covid_pss_c_5-4) + CHILD$covid_pss_c_6 + abs(CHILD$covid_pss_c_7-4) + abs(CHILD$covid_pss_c_8-4)

# SCORING MSPSS
#TAKE THE MEAN
CHILD$MSPSS_total.TC<- ((CHILD$mspss_1 + CHILD$mspss_2 + CHILD$mspss_3 + CHILD$mspss_4 + CHILD$mspss_5 + CHILD$mspss_6 + CHILD$mspss_7 + CHILD$mspss_8 + CHILD$mspss_9 + CHILD$mspss_10 + CHILD$mspss_11 + CHILD$mspss_12)/12)*12
CHILD$MSPSS_fam.TC<- ((CHILD$mspss_3 + CHILD$mspss_4 + CHILD$mspss_8 + CHILD$mspss_11)/4)*4
CHILD$MSPSS_fri.TC<- ((CHILD$mspss_6 + CHILD$mspss_7 + CHILD$mspss_9 + CHILD$mspss_12)/4)*4
CHILD$MSPSS_so.TC<- ((CHILD$mspss_1 + CHILD$mspss_2 + CHILD$mspss_5 + CHILD$mspss_10)/4)*4

# SCORING UCLA
#REVERSE CODE #3 AND #6, THEN SUM ALL 
CHILD$UCLA_total.TC<- CHILD$covid_ucla_c_1 + CHILD$covid_ucla_c_2 + abs(CHILD$covid_ucla_c_3-5) + CHILD$covid_ucla_c_4 + CHILD$covid_ucla_c_5 + abs(CHILD$covid_ucla_c_6-5) + CHILD$covid_ucla_c_7 + CHILD$covid_ucla_c_8

#SCORING CESD-C
#SUM ALL
CHILD$CESDC_total.TC<- CHILD$covid_cesd_c_1 + CHILD$covid_cesd_c_2 + CHILD$covid_cesd_c_3 +CHILD$covid_cesd_c_4 + CHILD$covid_cesd_c_5 + CHILD$covid_cesd_c_6 + CHILD$covid_cesd_c_7 + CHILD$covid_cesd_c_8 + CHILD$covid_cesd_c_9 + CHILD$covid_cesd_c_10 + CHILD$covid_cesd_c_11 + CHILD$covid_cesd_c_12 + CHILD$covid_cesd_c_13 + CHILD$covid_cesd_c_14 + CHILD$covid_cesd_c_15 + CHILD$covid_cesd_c_16 + CHILD$covid_cesd_c_17 + CHILD$covid_cesd_c_18 + CHILD$covid_cesd_c_19 + CHILD$covid_cesd_c_20

# SOCRING FCS
#SUM ALL
CHILD$FCS_total.TC<- CHILD$covid_fam_con_1 + CHILD$covid_fam_con_2	+ CHILD$covid_fam_con_3	+ CHILD$covid_fam_con_4	+ CHILD$covid_fam_con_5	+ CHILD$covid_fam_con_6	+ CHILD$covid_fam_con_7	+ CHILD$covid_fam_con_8	+ CHILD$covid_fam_con_9	+ CHILD$covid_fam_con_10

# SCORING CD RISC-10
#SUM ALL
CHILD$RISC_total.TC<- CHILD$covid_cd_risc_1 + CHILD$covid_cd_risc_2 + CHILD$covid_cd_risc_3 + CHILD$covid_cd_risc_4 + CHILD$covid_cd_risc_5 + CHILD$covid_cd_risc_6 + CHILD$covid_cd_risc_7 + CHILD$covid_cd_risc_8 + CHILD$covid_cd_risc_9 + CHILD$covid_cd_risc_10

# SCORING SOCS
#SUM ALL
CHILD$SOCS_total.TC<- CHILD$covid_socs_1 + CHILD$covid_socs_2 + CHILD$covid_socs_3 + CHILD$covid_socs_4 + CHILD$covid_socs_5 + CHILD$covid_socs_6 + CHILD$covid_socs_7

## Incorporating data from earlier time points

#Importing data
#DATA.ELS.T1 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T1_COVID_Curated.csv") 
#DATA.ELS.T2 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T2_COVID_Curated.csv") 
#DATA.ELS.T3 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T3_COVID_Curated.csv")
#DATA.ELS<- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_Severity_Scores.csv") #els sumsevtype and stress sensitivity

#DATA.ELS.T1 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T1_COVID_Curated.csv")
DATA.ELS.T1 <- read.csv("/Users/rachelweisenburger/Box/Externally_Shareable_Files/mooddata_nophi/ELS_RDoC/T-COVID-19/DATA/ELS_T1_COVID_Curated.csv") #RW
#DATA.ELS.T2 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T2_COVID_Curated.csv")
DATA.ELS.T2 <- read.csv("/Users/rachelweisenburger/Box/Externally_Shareable_Files/mooddata_nophi/ELS_RDoC/T-COVID-19/DATA/ELS_T1_COVID_Curated.csv") #RW
#DATA.ELS.T3 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T3_COVID_Curated.csv")
DATA.ELS.T3 <- read.csv("/Users/rachelweisenburger/Box/Externally_Shareable_Files/mooddata_nophi/ELS_RDoC/T-COVID-19/DATA/ELS_T1_COVID_Curated.csv") #RW

names(DATA.ELS.T3)

DATA.ELS.T1$ELS_ID
DATA.ELS.T2$ELS_ID
DATA.ELS.T3$ELS_ID

CHILD$ELS_ID <- as.numeric(substr(CHILD$record_id,1,3)) 

CHILD.complete <- CHILD[!is.na(CHILD$covid_background_gender),]

CHILD.complete$ELS_ID 

CHILD.T3 <- merge(CHILD.complete, DATA.ELS.T3, by = "ELS_ID", all.x = TRUE )



#Correspondance between DERS before and after COVID

library("ggpmisc")
library("ggplot2")
CHILD$DERS_total<- DERS_nonaccept + DERS_goals + DERS_impulse + DERS_awareness + DERS_strategies + DERS_clarity

CHILD.T3$DERS_awareness

#Total
VAR.Tcovid = "DERS_total"
VAR.T3 =  "DERS_total.T3"

DATA <- CHILD.T3[, c(VAR.T3, VAR.Tcovid)]
DATA.complete <- DATA[complete.cases(DATA), ]
gg <- ggscatter(DATA.complete, x = VAR.T3, y = VAR.Tcovid, add = "reg.line") +
  stat_regline_equation(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid])) +
  stat_cor(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid] *0.9 )) 
print(gg)

T3.covid.diff <- t.test(DATA.complete[,VAR.T3],
                        DATA.complete[,VAR.Tcovid],
                        paired=TRUE,
                        conf.level=0.95)
print(VAR.Tcovid)
print(T3.covid.diff)


Difference =  DATA.complete[,VAR.Tcovid] - DATA.complete[,VAR.T3] 
print(hist(Difference,   
           col="gray", 
           main=paste0("Histogram of ",VAR.Tcovid, " differences"),
           xlab="Difference"))

#Non-Acceptance:
VAR.Tcovid = "DERS_nonaccept"
VAR.T3 =  "DERS_nonaccept.T3"

DATA <- CHILD.T3[, c(VAR.T3, VAR.Tcovid)]
DATA.complete <- DATA[complete.cases(DATA), ]
gg1 <- ggscatter(DATA.complete, x = VAR.T3, y = VAR.Tcovid, add = "reg.line") +
  stat_regline_equation(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid])) +
  stat_cor(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid] *0.9 ))
print(gg1)

T3.covid.diff <- t.test(DATA.complete[,VAR.T3],
                        DATA.complete[,VAR.Tcovid],
                        paired=TRUE,
                        conf.level=0.95)
print(VAR.Tcovid)
print(T3.covid.diff)

Difference =  DATA.complete[,VAR.Tcovid] - DATA.complete[,VAR.T3] 
print(hist(Difference,   
           col="gray", 
           main=paste0("Histogram of ",VAR.Tcovid, " differences"),
           xlab="Difference"))

#Goals
VAR.Tcovid = "DERS_goals"
VAR.T3 =  "DERS_goals.T3"

DATA <- CHILD.T3[, c(VAR.T3, VAR.Tcovid)]
DATA.complete <- DATA[complete.cases(DATA), ]
gg2 <- ggscatter(DATA.complete, x = VAR.T3, y = VAR.Tcovid, add = "reg.line") +
  stat_regline_equation(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid])) +
  stat_cor(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid] *0.9 ))
print(gg2)

T3.covid.diff <- t.test(DATA.complete[,VAR.T3],
                        DATA.complete[,VAR.Tcovid],
                        paired=TRUE,
                        conf.level=0.95)
print(VAR.Tcovid)
print(T3.covid.diff)

Difference =  DATA.complete[,VAR.Tcovid] - DATA.complete[,VAR.T3] 
print(hist(Difference,   
           col="gray", 
           main=paste0("Histogram of ",VAR.Tcovid, " differences"),
           xlab="Difference"))

#Impulse
VAR.Tcovid = "DERS_impulse"
VAR.T3 =  "DERS_impulse.T3"

DATA <- CHILD.T3[, c(VAR.T3, VAR.Tcovid)]
DATA.complete <- DATA[complete.cases(DATA), ]
gg3 <- ggscatter(DATA.complete, x = VAR.T3, y = VAR.Tcovid, add = "reg.line") +
  stat_regline_equation(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid])) +
  stat_cor(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid] *0.9 ))
print(gg3)

T3.covid.diff <- t.test(DATA.complete[,VAR.T3],
                        DATA.complete[,VAR.Tcovid],
                        paired=TRUE,
                        conf.level=0.95)
print(VAR.Tcovid)
print(T3.covid.diff)

Difference =  DATA.complete[,VAR.Tcovid] - DATA.complete[,VAR.T3] 
print(hist(Difference,   
           col="gray", 
           main=paste0("Histogram of ",VAR.Tcovid, " differences"),
           xlab="Difference"))

#Awareness
VAR.Tcovid = "DERS_awareness"
VAR.T3 =  "DERS_awareness.T3"

DATA <- CHILD.T3[, c(VAR.T3, VAR.Tcovid)]
DATA.complete <- DATA[complete.cases(DATA), ]
gg4 <- ggscatter(DATA.complete, x = VAR.T3, y = VAR.Tcovid, add = "reg.line") +
  stat_regline_equation(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid])) +
  stat_cor(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid] *0.9 ))
print(gg4)

T3.covid.diff <- t.test(DATA.complete[,VAR.T3],
                        DATA.complete[,VAR.Tcovid],
                        paired=TRUE,
                        conf.level=0.95)
print(VAR.Tcovid)
print(T3.covid.diff)

Difference =  DATA.complete[,VAR.Tcovid] - DATA.complete[,VAR.T3] 
print(hist(Difference,   
           col="gray", 
           main=paste0("Histogram of ",VAR.Tcovid, " differences"),
           xlab="Difference"))

#Strategies
VAR.Tcovid = "DERS_strategies"
VAR.T3 =  "DERS_strategies.T3"

DATA <- CHILD.T3[, c(VAR.T3, VAR.Tcovid)]
DATA.complete <- DATA[complete.cases(DATA), ]
gg5 <- ggscatter(DATA.complete, x = VAR.T3, y = VAR.Tcovid, add = "reg.line") +
  stat_regline_equation(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid])) +
  stat_cor(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid] *0.9 ))
print(gg5)

T3.covid.diff <- t.test(DATA.complete[,VAR.T3],
                        DATA.complete[,VAR.Tcovid],
                        paired=TRUE,
                        conf.level=0.95)
print(VAR.Tcovid)
print(T3.covid.diff)

Difference =  DATA.complete[,VAR.Tcovid] - DATA.complete[,VAR.T3] 
print(hist(Difference,   
           col="gray", 
           main=paste0("Histogram of ",VAR.Tcovid, " differences"),
           xlab="Difference"))

#Clarity
VAR.Tcovid = "DERS_clarity"
VAR.T3 =  "DERS_clarity.T3"

DATA <- CHILD.T3[, c(VAR.T3, VAR.Tcovid)]
DATA.complete <- DATA[complete.cases(DATA), ]
gg6 <- ggscatter(DATA.complete, x = VAR.T3, y = VAR.Tcovid, add = "reg.line") +
  stat_regline_equation(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid])) +
  stat_cor(label.x = min(DATA.complete[,VAR.T3]), label.y = max(DATA.complete[,VAR.Tcovid] *0.9 ))
print(gg6)

T3.covid.diff <- t.test(DATA.complete[,VAR.T3],
                        DATA.complete[,VAR.Tcovid],
                        paired=TRUE,
                        conf.level=0.95)
print(VAR.Tcovid)
print(T3.covid.diff)

Difference =  DATA.complete[,VAR.Tcovid] - DATA.complete[,VAR.T3] 
print(hist(Difference,   
           col="gray", 
           main=paste0("Histogram of ",VAR.Tcovid, " differences"),
           xlab="Difference"))




