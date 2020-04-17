## ---------------------------
##
## Script name: Emotional regulation at T3 and COVID timepoint: relation with psychological outcomes during COVID outbreak
##
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


box.dir <- "/Users/gifuni/Box" #This will change on local machine
data.dir <- "/mooddata_nophi/ELS_RDoC/T-COVID-19/DATA/" 
results.dir <- #This will change on local machine


## ---------------------------------------------------------------------
#Import data

data.child.file <- "ELS_COVID_CHILD.csv"
CHILD.csv <- paste0(box.dir,data.dir,data.child.file )
CHILD <- read.csv(COVID.child.T1.csv)

names(CHILD)

## ---------------------------------------------------------------------
#Scoring measures
attach(CHILD)

# SCORING DERS
#REVERSE CODE #1, #2, #6, #7, #8, #10, #17, #20, #22, #24, #34 THEN SUM ALL
CHILD$DERS_nonaccept<- covid_ders_c_11 + covid_ders_c_12 + covid_ders_c_21 + covid_ders_c_23 +  covid_ders_c_25 + covid_ders_c_29  
CHILD$DERS_goals<- covid_ders_c_13 + covid_ders_c_18 + abs(covid_ders_c_20-6) + covid_ders_c_26 + covid_ders_c_33
CHILD$DERS_impulse<- covid_ders_c_3 + covid_ders_c_14 + covid_ders_c_19 + abs(covid_ders_c_24-6) + covid_ders_c_27 + covid_ders_c_32
CHILD$DERS_awareness<- abs(covid_ders_c_2-6) + abs(covid_ders_c_6-6) + abs(covid_ders_c_8-6) + abs(covid_ders_c_10-6) + abs(covid_ders_c_17-6) + abs(covid_ders_c_34-6)
CHILD$DERS_strategies<- covid_ders_c_15 + covid_ders_c_16 + abs(covid_ders_c_22-6) + covid_ders_c_28 + covid_ders_c_30 + covid_ders_c_31 + covid_ders_c_35 + covid_ders_c_36
CHILD$DERS_clarity<- covid_ders_c_4 + abs(covid_ders_c_1-6) + covid_ders_c_5 + abs(covid_ders_c_7-6) + covid_ders_c_9

CHILD$DERS_total<- DERS_nonaccept + DERS_goals + DERS_impulse + DERS_awareness + DERS_strategies + DERS_clarity

# SCORING MASC
#SUM ALL

CHILD$masc_TR<- covid_masc_1 + covid_masc_8 + covid_masc_15 + covid_masc_20 + covid_masc_27 + covid_masc_35
CHILD$masc_SA<- covid_masc_5 + covid_masc_12 + covid_masc_18 + covid_masc_24 + covid_masc_31 + covid_masc_38
CHILD$masc_per<- covid_masc_2 + covid_masc_11 + covid_masc_21 + covid_masc_28
CHILD$masc_AC<- covid_masc_6 + covid_masc_13 + covid_masc_25 + covid_masc_32 + covid_masc_36 
CHILD$masc_HR<- covid_masc_3 + covid_masc_10 + covid_masc_16 + covid_masc_22 + covid_masc_29
CHILD$masc_PP<- covid_masc_14 + covid_masc_33 + covid_masc_37 + covid_masc_39
CHILD$masc_ADI<- covid_masc_1 + covid_masc_6 + covid_masc_10 + covid_masc_11 + covid_masc_12 + covid_masc_16 + covid_masc_21 + covid_masc_23 + covid_masc_30 + covid_masc_33

CHILD$MASC_phys<- masc_TR + masc_SA
CHILD$MASC_harm<- masc_per + masc_AC
CHILD$MASC_social<- masc_HR + masc_PP
CHILD$MASC_sep<- covid_masc_4 + covid_masc_7 + covid_masc_9 + covid_masc_17 +covid_masc_19 +covid_masc_23 + covid_masc_26 + covid_masc_30 + covid_masc_34

CHILD$MASC_total<- MASC_phys + MASC_harm + MASC_social + MASC_sep

CHILD$MASC_phys_tscore <- NA
CHILD$MASC_harm_tscore <- NA
CHILD$MASC_social_tscore<- NA
CHILD$MASC_sep_tscore <- NA
CHILD$MASC_tscore <- NA
CHILD$MASC_inconsistency <- NA
CHILD$MASC_inconsistency<- abs(covid_masc_2-covid_masc_11) + abs(covid_masc_3-covid_masc_10)+ abs(covid_masc_8-covid_masc_15) + abs(covid_masc_12-covid_masc_18) + abs(covid_masc_13-covid_masc_36) + abs(covid_masc_14-covid_masc_33) + abs(covid_masc_16-covid_masc_22) + abs(covid_masc_30-covid_masc_34)

# SCORING STAI
#SUM ALL
CHILD$STAI_total<- covid_stai_1 + covid_stai_2 + covid_stai_3 + covid_stai_4 + covid_stai_5 + covid_stai_6

# SCORING RRS-A
#TAKE THE MEAN
CHILD$RRS_total<- ((covid_rrs_a_c_1 + covid_rrs_a_c_2 + covid_rrs_a_c_3 + covid_rrs_a_c_4 + covid_rrs_a_c_5 + covid_rrs_a_c_6 + covid_rrs_a_c_7 + covid_rrs_a_c_8 + covid_rrs_a_c_9 + covid_rrs_a_c_10)/10)*10
CHILD$RRS_reflect<- ((covid_rrs_a_c_1 + covid_rrs_a_c_3 + covid_rrs_a_c_4 + covid_rrs_a_c_7 + covid_rrs_a_c_8)/5)*5
CHILD$RRS_brood<- ((covid_rrs_a_c_2 + covid_rrs_a_c_5 + covid_rrs_a_c_6 + covid_rrs_a_c_9 + covid_rrs_a_c_10)/5)*5

# SCORING PSS
#REVERSE CODE #4, #5, #7, AND #8, THEN SUM ALL
CHILD$PSS_total<- covid_pss_c_1 + covid_pss_c_2 + covid_pss_c_3 + abs(covid_pss_c_4-4) + abs(covid_pss_c_5-4) + covid_pss_c_6 + abs(covid_pss_c_7-4) + abs(covid_pss_c_8-4)

# SCORING MSPSS
CHILD$MSPSS_total<- ((mspss_1 + mspss_2 + mspss_3 + mspss_4 + mspss_5 + mspss_6 + mspss_7 + mspss_8 + mspss_9 + mspss_10 + mspss_11 + mspss_12)/12)*12
CHILD$MSPSS_fam<- ((mspss_3 + mspss_4 + mspss_8 + mspss_11)/4)*4
CHILD$MSPSS_fri<- ((mspss_6 + mspss_7 + mspss_9 + mspss_12)/4)*4
CHILD$MSPSS_so<- ((mspss_1 + mspss_2 + mspss_5 + mspss_10)/4)*4

# SCORING UCLA
#REVERSE CODE #3 AND #6, THEN SUM ALL 
CHILD$UCLA_total<- covid_ucla_c_1 + covid_ucla_c_2 + abs(covid_ucla_c_3-5) + covid_ucla_c_4 + covid_ucla_c_5 + abs(covid_ucla_c_6-5) + covid_ucla_c_7 + covid_ucla_c_8

#SCORING CESD-C
CHILD$CESDC_total<- covid_cesd_c_1 + covid_cesd_c_2 + covid_cesd_c_3 +covid_cesd_c_4 + covid_cesd_c_5 + covid_cesd_c_6 + covid_cesd_c_7 + covid_cesd_c_8 + covid_cesd_c_9 + covid_cesd_c_10 + covid_cesd_c_11 + covid_cesd_c_12 + covid_cesd_c_13 + covid_cesd_c_14 + covid_cesd_c_15 + covid_cesd_c_16 + covid_cesd_c_17 + covid_cesd_c_18 + covid_cesd_c_19 + covid_cesd_c_20

# SOCRING FCS
CHILD$FCS_total<- covid_fam_con_1 + covid_fam_con_2	+ covid_fam_con_3	+ covid_fam_con_4	+ covid_fam_con_5	+ covid_fam_con_6	+ covid_fam_con_7	+ covid_fam_con_8	+ covid_fam_con_9	+ covid_fam_con_10

# SCORING CD RISC-10
CHILD$RISC_total<- covid_cd_risc_1 + covid_cd_risc_2 + covid_cd_risc_3 + covid_cd_risc_4 + covid_cd_risc_5 + covid_cd_risc_6 + covid_cd_risc_7 + covid_cd_risc_8 + covid_cd_risc_9 + covid_cd_risc_10

# SCORING SOCS

CHILD$SOCS_total<- covid_socs_1 + covid_socs_2 + covid_socs_3 + covid_socs_4 + covid_socs_5 + covid_socs_6 + covid_socs_7

detach(CHILD)

# Incorporating data from earlier time points
```{r, include=FALSE}
#Sum all variables


DATA.ELS.T1 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T1_COVID_Curated.csv") 
DATA.ELS.T2 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T2_COVID_Curated.csv") 
DATA.ELS.T3 <- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_T3_COVID_Curated.csv")
DATA.ELS<- read.csv("/Users/anthonygifuni/Dropbox/ELS_COVID/Data/ELS_Severity_Scores.csv")


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




