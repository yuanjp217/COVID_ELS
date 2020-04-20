## ---------------------------
##
## Script name: COVID.Correlation.graph.R
##
## Purpose of script: Visualize the correlation of COVID data
##
## Author: Dr. Anthony J. Gifuni
##
## Date Created: 2018-04-20
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
Install_And_Load <- function(packages) {
  k <- packages[!(packages %in% installed.packages()[,"Package"])];
  if(length(k))
  {install.packages(k, repos="https://cran.rstudio.com/");}
  
  for(package_name in packages)
  {library(package_name,character.only=TRUE, quietly = TRUE);}
}

Install_And_Load(c("ggplot2", "tidyverse"))
## ---------------------------------------------------------------------

## Import data (COVID data - Child, Parent; ELS - T1, T2, T3)
source(here::here("Code","COVID.Import.Data.R"))

## ---------------------------------------------------------------------

## Label Exposure Data
source(here::here("Code","COVID.Label.Exposure.Child.R"))

## ---------------------------------------------------------------------

## Scoring COVID outcomes
source(here::here("Code","COVID.Score.Outcome.R"))

## ---------------------------------------------------------------------
outcome.measures = c("CESDC_total", 
                     "STAI_total",
                     "MASC_total",
                     "MASC_phys",
                     "MASC_harm",
                     "MASC_social",
                     "MASC_sep",
                     "DERS_total",
                     "MSPSS_total",
                     "RRS_total",
                     "UCLA_total",
                     "PSS_total",
                     "FCS_total",
                     "RISC_total",
                     "SOCS_total")

exposure.measures<- c("covid_exposure_c_2",
                      "covid_exposure_c_4___1",
                      "covid_exposure_c_4___2",
                      "covid_exposure_c_6___1",
                      "covid_exposure_c_6___2",
                      "covid_exposure_c_6___3",
                      "covid_exposure_c_6___4",
                      "covid_exposure_c_6___5",
                      "covid_exposure_c_6___6",
                      "covid_exposure_c_6___7",
                      "covid_exposure_c_7",
                      "covid_exposure_c_8",
                      "covid_exposure_c_11",
                      "covid_change_c_5",
                      "covid_change_c_6",
                      "covid_change_c_7",
                      "covid_change_c_8a",
                      "covid_change_c_8b",
                      "covid_change_c_9a",
                      "covid_change_c_9b",
                      "covid_change_c_10",
                      "covid_change_c_11",
                      "covid_change_c_12",
                      "covid_change_c_13",
                      "covid_change_c_14")


covid.exposure.labels = c("Received COVID diagnosis", 
                   "COVID diagnosis in the family",
                   "COVID diagnosis in a relative",
                   "Family member ill",
                   "Family member hospitalized",
                   "Family member in self-quarantine w/ Sx",
                   "Family member in self-quarantine w/out Sx",
                   "Family member lost job",
                   "Family member loss money",
                   "Family member died",
                   "Worry of being infected",
                   "Worry of others being infected",
                   "Media exposure to COVID",
                   "Stress of house restriction",
                   "Reduced contacts with others",
                   "Difficulty following recommendations",
                   "Quality of familial relationship",
                   "Stress due to familial relationships",
                   "Quality of relationship with friends",
                   "Stress due to peer relationships",
                   "Cancellation of events",
                   "Familial financial problems",
                   "Instability of living situation",
                   "Food insecurity",
                   "Hope")

outcome.labels = c("Depression", 
                     "Anxiety (STAI)",
                     "Anxiety (MASC)",
                     "MASC_phys",
                     "MASC_harm",
                     "MASC_social",
                     "MASC_sep",
                     "Emotional Dysregulation",
                     "Social Support",
                     "Ruminations",
                     "Loneliness",
                     "Perceived Stress",
                     "Familial conflicts",
                     "Resilience",
                     "OCD")


CHILD.select <- CHILD[, c(outcome.measures, exposure.measures)]
names(CHILD.select) <- c(outcome.labels,covid.exposure.labels)

CHILD.select<- sapply( CHILD.select, as.numeric )


cormat <- round(cor(CHILD.select, use = "pairwise.complete.obs"),2)
head(cormat)

library(reshape2)
melted_cormat <- melt(cormat)
head(melted_cormat)


ggheatmap<- ggplot(data = melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 45, vjust = 1,size = 6, hjust = 1),
        axis.text.y = element_text(angle = 0, vjust = 1,size = 6, hjust = 1))+
  coord_fixed()

ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 2) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(1, 1),
    legend.direction = "horizontal")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))


