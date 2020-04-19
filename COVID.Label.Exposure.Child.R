## ---------------------------
##
## Script name: COVID.Label.Exposure.Child.R
##
## Purpose of script: Label the Child COVID exposure data 
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
Install_And_Load <- function(packages) {
  k <- packages[!(packages %in% installed.packages()[,"Package"])];
  if(length(k))
  {install.packages(k, repos="https://cran.rstudio.com/");}
  
  for(package_name in packages)
  {library(package_name,character.only=TRUE, quietly = TRUE);}
}

Install_And_Load(c("Hmisc"))

## ---------------------------------------------------------------------

## Import data (COVID data - Child, Parent; ELS - T1, T2, T3)
source(here::here("Code","COVID.Import.Data.R"))

## ---------------------------------------------------------------------

#Setting Labels

label(CHILD$record_id)="Record ID"
label(CHILD$redcap_event_name)="Event Name"
label(CHILD$redcap_survey_identifier)="Survey Identifier"
label(CHILD$background_timestamp)="Survey Timestamp"
label(CHILD$covid_c_name)="What is your full name?"
label(CHILD$covid_c_pref_name)="What is your preferred name?"
label(CHILD$covid_background_a)="How old are you? "
label(CHILD$covid_background_b1)="What race(s) do you identify as?"
label(CHILD$covid_background_race)="Do you identify as Hispanic or Latino(a)?   (Mexican, Mexican American, Chicano, Puerto Rican, Cuban, South or Central American or other Spanish culture or origin)"
label(CHILD$covid_background_race_describe)="Please specify the race(s) you identify as:"
label(CHILD$covid_background_gender)="What is your current gender identity?"
label(CHILD$covid_background_genderb)="Please describe your current gender identity:"
label(CHILD$covid_background_1)="Are you enrolled in school/college for the current academic year (2019-2020)?"
label(CHILD$covid_background_2)="Which best describes the area in which you live?"
label(CHILD$covid_background_3)="How many people currently live in your home (excluding yourself)?"
label(CHILD$covid_background_4___1)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Biological mother)"
label(CHILD$covid_background_4___2)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Biological father)"
label(CHILD$covid_background_4___3)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Stepmother)"
label(CHILD$covid_background_4___4)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Stepfather)"
label(CHILD$covid_background_4___5)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Adoptive/Foster parent(s))"
label(CHILD$covid_background_4___6)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Sibling(s))"
label(CHILD$covid_background_4___7)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Other relative(s))"
label(CHILD$covid_background_4___8)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Other non-relative(s))"
label(CHILD$covid_background_4___9)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Roommate(s))"
label(CHILD$covid_background_4___10)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Significant other)"
label(CHILD$covid_background_4___11)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=Other)"
label(CHILD$covid_background_4___12)="Please specify your relationship to the people in your home.  Please select based on the home you currently spend the most time at. Check all that apply.  (choice=No one, I live alone)"
label(CHILD$covid_background_4a)="Who currently lives with you at home? Please describe."
label(CHILD$covid_adol_report_1)="How would you rate your overall physical health?"
label(CHILD$covid_background_health___1)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Seasonal allergies)"
label(CHILD$covid_background_health___2)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Asthma or other lung problems)"
label(CHILD$covid_background_health___3)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Heart problems)"
label(CHILD$covid_background_health___4)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Kidney problems)"
label(CHILD$covid_background_health___5)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Immune disorder)"
label(CHILD$covid_background_health___6)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Diabetes or high blood sugar)"
label(CHILD$covid_background_health___7)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Any recent infection (e.g., pneumonia, cold, flu, urinary tract infection, etc.))"
label(CHILD$covid_background_health___8)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Hypertension)"
label(CHILD$covid_background_health___9)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=High Cholesterol)"
label(CHILD$covid_background_health___10)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Cancer)"
label(CHILD$covid_background_health___11)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Arthritis)"
label(CHILD$covid_background_health___12)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Frequent or very bad headaches)"
label(CHILD$covid_background_health___13)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Epilepsy or seizures)"
label(CHILD$covid_background_health___14)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Serious stomach or bowel problems)"
label(CHILD$covid_background_health___15)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Serious acne or skin problems)"
label(CHILD$covid_background_health___16)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Emotion or mental health problems (ex. Depression or Anxiety))"
label(CHILD$covid_background_health___17)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Problems with alcohol or drugs)"
label(CHILD$covid_background_health___18)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Any recent Traumatic Brain Injury)"
label(CHILD$covid_background_health___19)="Has a health professional ever told you that you had any of the following health conditions? Check all that apply. (choice=Any recent, serious accident (e.g., car accident, bike accident, sports injury, etc.))"
label(CHILD$covid_adol_report_3)="How tall are you? "
label(CHILD$covid_adol_report_4)="How much do you weigh?"
label(CHILD$covid_adol_report_5)="How would you rate your overall mental/emotional health before the Coronavirus/COVID-19 crisis in your area?"
label(CHILD$background_complete)="Complete?"
label(CHILD$covid_exposure_timestamp)="Survey Timestamp"
label(CHILD$covid_exposure_c_1___1)="... have you been exposed to someone likely to have Coronavirus /COVID-19? (Check all that apply) (choice=Yes, someone with positive test)"
label(CHILD$covid_exposure_c_1___2)="... have you been exposed to someone likely to have Coronavirus /COVID-19? (Check all that apply) (choice=Yes, someone with medical diagnosis, but no test)"
label(CHILD$covid_exposure_c_1___3)="... have you been exposed to someone likely to have Coronavirus /COVID-19? (Check all that apply) (choice=Yes, someone with possible symptoms, but no diagnosis by a doctor)"
label(CHILD$covid_exposure_c_1___4)="... have you been exposed to someone likely to have Coronavirus /COVID-19? (Check all that apply) (choice=No)"
label(CHILD$covid_exposure_c_2)="... have you been diagnosed with Coronavirus/COVID-19 infection?"
label(CHILD$covid_exposure_c_3a___1)="Fever (choice=Yes)"
label(CHILD$covid_exposure_c_3a___0)="Fever (choice=No)"
label(CHILD$covid_exposure_c_3b___1)="Cough (choice=Yes)"
label(CHILD$covid_exposure_c_3b___0)="Cough (choice=No)"
label(CHILD$covid_exposure_c_3c___1)="Shortness of breath (choice=Yes)"
label(CHILD$covid_exposure_c_3c___0)="Shortness of breath (choice=No)"
label(CHILD$covid_exposure_c_3d___1)="Sore throat (choice=Yes)"
label(CHILD$covid_exposure_c_3d___0)="Sore throat (choice=No)"
label(CHILD$covid_exposure_c_3e___1)="Fatigue (choice=Yes)"
label(CHILD$covid_exposure_c_3e___0)="Fatigue (choice=No)"
label(CHILD$covid_exposure_c_3f___1)="Loss of taste or small (choice=Yes)"
label(CHILD$covid_exposure_c_3f___0)="Loss of taste or small (choice=No)"
label(CHILD$covid_exposure_c_3h___1)="Other (choice=Yes)"
label(CHILD$covid_exposure_c_3h___0)="Other (choice=No)"
label(CHILD$covid_exposure_c_3g)="Please describe any additional symptoms youve had in the past two weeks."
label(CHILD$covid_exposure_c_4___1)=".. has anyone in your family been diagnosed with Coronavirus/COVID-19? (Check all that apply) (choice=Yes, member of household)"
label(CHILD$covid_exposure_c_4___2)=".. has anyone in your family been diagnosed with Coronavirus/COVID-19? (Check all that apply) (choice=Yes, non-household member)"
label(CHILD$covid_exposure_c_4___3)=".. has anyone in your family been diagnosed with Coronavirus/COVID-19? (Check all that apply) (choice=No)"
label(CHILD$covid_exposure_c_6___1)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (Check all that apply) (choice=Fallen ill physically)"
label(CHILD$covid_exposure_c_6___2)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (Check all that apply) (choice=Hospitalized)"
label(CHILD$covid_exposure_c_6___3)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (Check all that apply) (choice=Put into self-quarantine with symptoms)"
label(CHILD$covid_exposure_c_6___4)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (Check all that apply) (choice=Put into self-quarantine without symptoms (e.g., due to possible exposure))"
label(CHILD$covid_exposure_c_6___5)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (Check all that apply) (choice=Lost job)"
label(CHILD$covid_exposure_c_6___6)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (Check all that apply) (choice=Reduced ability to earn money)"
label(CHILD$covid_exposure_c_6___7)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (Check all that apply) (choice=Passed away)"
label(CHILD$covid_exposure_c_6___8)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (Check all that apply) (choice=None of the above)"
label(CHILD$covid_exposure_c_7)="...being infected?"
label(CHILD$covid_exposure_c_8)="...friends of family being infected?"
label(CHILD$covid_exposure_c_9)="...your physical health being influenced by Coronavirus/COVID-19?"
label(CHILD$covid_exposure_c_10)="...your mental/emotional health being influenced by Coronavirus/COVID-19?"
label(CHILD$covid_exposure_c_11)="How much are you reading, or talking about Coronavirus/COVID-19?"
label(CHILD$covid_exposure_c_12)="Has the Coronavirus/COVID-19 crisis in your area led to any positive changes in your life?"
label(CHILD$covid_exposure_c_13)="Please specifiy:"
label(CHILD$covid_exposure_complete)="Complete?"
label(CHILD$covid_changes_timestamp)="Survey Timestamp"
label(CHILD$covid_change_c_1a)="...has your school building been closed? "
label(CHILD$covid_change_1c)="Are you attending classes in-person?"
label(CHILD$covid_change_c_1b)="Are classes in session?"
label(CHILD$covid_change_c_1d)="Have classes resumed online?"
label(CHILD$covid_change_c_1e)="Do you have easy access to the internet and a computer?"
label(CHILD$covid_change_c_1f)="Are there assignments for you to complete?"
label(CHILD$covid_change_c_1g)="Are you able to receive meals from the school?"
label(CHILD$covid_change_c_3)="How many people, from outside your household, have you had in-person conversation with over the past two weeks? "
label(CHILD$covid_change_c_4)="How much time have you spent going outside of the home in the past two weeks (e.g., going to stores, parks, etc.)?"
label(CHILD$covid_change_c_5)="... how stressful have the restrictions on leaving home been for you?"
label(CHILD$covid_change_c_6)="... have your contacts with people outside of your home changed relative to before the Coronavirus/COVID-19 crisis in your area?"
label(CHILD$covid_change_c_7)="... how much difficulty have you had following the recommendations for keeping away from close contact with people?"
label(CHILD$covid_change_c_8a)="... has the quality of relationships between you and members of your family changed?"
label(CHILD$covid_change_c_8b)="... how stressful have these changes in family contacts been for you?"
label(CHILD$covid_change_c_9a)="... has the quality of your relationships with friends changed?"
label(CHILD$covid_change_c_9b)="... how stressful have these changes in your social contacts been for you?"
label(CHILD$covid_change_c_10)="... how much has cancellation of important events (such as graduation, prom, vacation, etc.) in your life been difficult for you in the past two weeks?"
label(CHILD$covid_change_c_11)="... to what degree have changes related to Coronavirus/COVID-19 created financial problems for you or your family in the past two weeks?"
label(CHILD$covid_change_c_12)="... to what degree have you been concerned about the stability of your living situation?"
label(CHILD$covid_change_c_13)="... did you worry whether your food would run out because of a lack on money?"
label(CHILD$covid_change_c_14)="How hopeful are you that the Coronavirus/COVID-19 crisis problem will end soon?"
label(CHILD$covid_changes_complete)="Complete?"
label(CHILD$covid_emotions_behaviors_3_months_timestamp)="Survey Timestamp"
label(CHILD$covid_behav_c_1)="... how many hours per night did you sleep on average?"
label(CHILD$covid_behav_c_2)="... how many days per week did you exercise (e.g., increased heart rate, breathing) for at least 30 minutes?"
label(CHILD$covid_behav_c_3)="... how many days per week did you spend time outdoors?"
label(CHILD$covid_emotion_c_1)="... how worried were you generally?"
label(CHILD$covid_emotion_c_2)="... how happy versus sad were you?"
label(CHILD$covid_emotion_c_3)="... how much were you able to enjoy your usual activities?"
label(CHILD$covid_emotion_c_4)="... how relaxed versus anxious were you?"
label(CHILD$covid_emotion_c_5)="... how fidgety or restless were you?"
label(CHILD$covid_emotion_c_6)="... how fatigued or tired were you?"
label(CHILD$covid_emotion_c_7)="... how well were you able to concetrate or focus?"
label(CHILD$covid_emotion_c_8)="... how irritable or easily angered were you?"
label(CHILD$covid_emotion_c_9)="... how lonely were you?"
label(CHILD$covid_emotion_c_10)="... to what extent were you having negative thoughts, thought about unpleasant experiences, or thought about things that made you feel bad?"
label(CHILD$covid_emotion_c_11)="... watching TV or digital media (e.g., Netflix, YouTube, web surfing)?"
label(CHILD$covid_emotion_c_12)="... using social media (e.g., FaceTime, Facebook, Instagram, Twitter, Snapchat, TikTok)?"
label(CHILD$covid_emotion_c_13)="... playing video games?"
label(CHILD$covid_substance_c_1)="... alcohol?"
label(CHILD$covid_substance_c_2)="... vaping nicotine?"
label(CHILD$covid_substance_c_3)="... cigarettes or other tobacco?"
label(CHILD$covid_substance_c_4)="... marijuana/cannabis (e.g, joint, blunt, pipe, bong)?"
label(CHILD$covid_substance_c_5)="... opiates, heroin, or narcotics?"
label(CHILD$covid_exposure_c_6a)="... MDMA, molly, or ecstasy?"
label(CHILD$covid_substance_c_5b)="... hallucinogens (e.g. mushrooms, acid)?"
label(CHILD$covid_substance_c_6)="... other drugs including cocaine, crack, amphetamine, methamphetamine?"
label(CHILD$covid_substance_c_7)="... sleeping medications or sedatives/hypnotics?"
label(CHILD$covid_emotions_behaviors_3_months_complete)="Complete?"
label(CHILD$covid_emotions_behaviors_past_2_weeks_timestamp)="Survey Timestamp"
label(CHILD$covid_behav_c_4)="... how many hours per night have you slept on average?"
label(CHILD$covid_behav_c_5)="... how many days per week have you exercised (e.g., increased heart rate, breathing) for at least 30 minutes?"
label(CHILD$covid_behav_c_6)="... how many days per week have you spent time outdoors?"
label(CHILD$covid_emotion_c_14)="... how worried were you generally?"
label(CHILD$covid_emotion_c_15)="... how happy versus sad were you?"
label(CHILD$covid_emotion_c_16)="... how much were you been able to enjoy your usual activities?"
label(CHILD$covid_emotion_c_17)="... how relaxed versus anxious have you been?"
label(CHILD$covid_emotion_c_18)="... how fidgety or restless have you been?"
label(CHILD$covid_emotion_c_19)="... how fatigued or tired have you felt?"
label(CHILD$covid_emotion_c_20)="... how well were you been able to concetrate or focus?"
label(CHILD$covid_emotion_c_21)="... how irritable or easily angered were you?"
label(CHILD$covid_emotion_c_22)="... how lonely were you?"
label(CHILD$covid_emotion_c_23)="... to what extent did you have negative thoughts, thought about unpleasant experiences, or thought about things that made you feel bad?"
label(CHILD$covid_emotion_c_24)="... watching TV or digital media (e.g., Netflix, YouTube, web surfing)?"
label(CHILD$covid_emotion_c_25)="... using social media (e.g., FaceTime, Facebook, Instagram, Twitter, Snapchat, TikTok)?"
label(CHILD$covid_emotion_c_13_7011eb)="... playing video games?"
label(CHILD$covid_substance_c_9)="... alcohol?"
label(CHILD$covid_substance_c_10)="... vaped nicotine?"
label(CHILD$covid_substance_c_11)="... cigarettes or other tobacco?"
label(CHILD$covid_substance_c_13)="... marijuana/cannabis (e.g, joint, blunt, pipe, bong, edible)?"
label(CHILD$covid_substance_c_14)="... opiates, heroin, or narcotics?"
label(CHILD$covid_substance_c_14a)="... MDMA, molly, or ecstasy?"
label(CHILD$covid_substance_c_14b)="... hallucinogens (e.g. mushrooms, acid)?"
label(CHILD$covid_substance_c_15)="... other drugs including cocaine, crack, amphetamine, methamphetamine?"
label(CHILD$covid_substance_c_8)="... sleeping medications or sedatives/hypnotics?"
label(CHILD$covid_change_c_15___1)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Resource room)"
label(CHILD$covid_change_c_15___2)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Tutoring)"
label(CHILD$covid_change_c_15___3)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Mentoring programs)"
label(CHILD$covid_change_c_15___4)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=After school activities or programs)"
label(CHILD$covid_change_c_15___5)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Volunteer programs)"
label(CHILD$covid_change_c_15___6)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Psychotherapy)"
label(CHILD$covid_change_c_15___7)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Psychiatric care)"
label(CHILD$covid_change_c_15___8)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Occupational therapy)"
label(CHILD$covid_change_c_15___9)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Physical therapy)"
label(CHILD$covid_change_c_15___10)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Speech/language therapy)"
label(CHILD$covid_change_c_15___11)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Sporting activities)"
label(CHILD$covid_change_c_15___12)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Medical care for chronic illnesses)"
label(CHILD$covid_change_c_15___13)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (check all that apply) (choice=Other)"
label(CHILD$covid_emotions_behaviors_past_2_weeks_complete)="Complete?"


#Setting Units


#Setting Factors(will create new variable for factors)
CHILD$redcap_event_name.factor = factor(CHILD$redcap_event_name,levels=c("covid_t1_arm_1","covid_t2_arm_1","covid_t3_arm_1"))
CHILD$covid_background_b1.factor = factor(CHILD$covid_background_b1,levels=c("1","2","3","4","5","6","7"))
CHILD$covid_background_race.factor = factor(CHILD$covid_background_race,levels=c("1","0"))
CHILD$covid_background_gender.factor = factor(CHILD$covid_background_gender,levels=c("1","2","3","4","5","6"))
CHILD$covid_background_1.factor = factor(CHILD$covid_background_1,levels=c("1","2","3","4","5"))
CHILD$covid_background_2.factor = factor(CHILD$covid_background_2,levels=c("1","2","3","4","5"))
CHILD$covid_background_4___1.factor = factor(CHILD$covid_background_4___1,levels=c("0","1"))
CHILD$covid_background_4___2.factor = factor(CHILD$covid_background_4___2,levels=c("0","1"))
CHILD$covid_background_4___3.factor = factor(CHILD$covid_background_4___3,levels=c("0","1"))
CHILD$covid_background_4___4.factor = factor(CHILD$covid_background_4___4,levels=c("0","1"))
CHILD$covid_background_4___5.factor = factor(CHILD$covid_background_4___5,levels=c("0","1"))
CHILD$covid_background_4___6.factor = factor(CHILD$covid_background_4___6,levels=c("0","1"))
CHILD$covid_background_4___7.factor = factor(CHILD$covid_background_4___7,levels=c("0","1"))
CHILD$covid_background_4___8.factor = factor(CHILD$covid_background_4___8,levels=c("0","1"))
CHILD$covid_background_4___9.factor = factor(CHILD$covid_background_4___9,levels=c("0","1"))
CHILD$covid_background_4___10.factor = factor(CHILD$covid_background_4___10,levels=c("0","1"))
CHILD$covid_background_4___11.factor = factor(CHILD$covid_background_4___11,levels=c("0","1"))
CHILD$covid_background_4___12.factor = factor(CHILD$covid_background_4___12,levels=c("0","1"))
CHILD$covid_adol_report_1.factor = factor(CHILD$covid_adol_report_1,levels=c("1","2","3","4","5"))
CHILD$covid_background_health___1.factor = factor(CHILD$covid_background_health___1,levels=c("0","1"))
CHILD$covid_background_health___2.factor = factor(CHILD$covid_background_health___2,levels=c("0","1"))
CHILD$covid_background_health___3.factor = factor(CHILD$covid_background_health___3,levels=c("0","1"))
CHILD$covid_background_health___4.factor = factor(CHILD$covid_background_health___4,levels=c("0","1"))
CHILD$covid_background_health___5.factor = factor(CHILD$covid_background_health___5,levels=c("0","1"))
CHILD$covid_background_health___6.factor = factor(CHILD$covid_background_health___6,levels=c("0","1"))
CHILD$covid_background_health___7.factor = factor(CHILD$covid_background_health___7,levels=c("0","1"))
CHILD$covid_background_health___8.factor = factor(CHILD$covid_background_health___8,levels=c("0","1"))
CHILD$covid_background_health___9.factor = factor(CHILD$covid_background_health___9,levels=c("0","1"))
CHILD$covid_background_health___10.factor = factor(CHILD$covid_background_health___10,levels=c("0","1"))
CHILD$covid_background_health___11.factor = factor(CHILD$covid_background_health___11,levels=c("0","1"))
CHILD$covid_background_health___12.factor = factor(CHILD$covid_background_health___12,levels=c("0","1"))
CHILD$covid_background_health___13.factor = factor(CHILD$covid_background_health___13,levels=c("0","1"))
CHILD$covid_background_health___14.factor = factor(CHILD$covid_background_health___14,levels=c("0","1"))
CHILD$covid_background_health___15.factor = factor(CHILD$covid_background_health___15,levels=c("0","1"))
CHILD$covid_background_health___16.factor = factor(CHILD$covid_background_health___16,levels=c("0","1"))
CHILD$covid_background_health___17.factor = factor(CHILD$covid_background_health___17,levels=c("0","1"))
CHILD$covid_background_health___18.factor = factor(CHILD$covid_background_health___18,levels=c("0","1"))
CHILD$covid_background_health___19.factor = factor(CHILD$covid_background_health___19,levels=c("0","1"))
CHILD$covid_adol_report_5.factor = factor(CHILD$covid_adol_report_5,levels=c("1","2","3","4","5"))
CHILD$background_complete.factor = factor(CHILD$background_complete,levels=c("0","1","2"))
CHILD$covid_exposure_c_1___1.factor = factor(CHILD$covid_exposure_c_1___1,levels=c("0","1"))
CHILD$covid_exposure_c_1___2.factor = factor(CHILD$covid_exposure_c_1___2,levels=c("0","1"))
CHILD$covid_exposure_c_1___3.factor = factor(CHILD$covid_exposure_c_1___3,levels=c("0","1"))
CHILD$covid_exposure_c_1___4.factor = factor(CHILD$covid_exposure_c_1___4,levels=c("0","1"))
CHILD$covid_exposure_c_2.factor = factor(CHILD$covid_exposure_c_2,levels=c("1","2","3","4"))
CHILD$covid_exposure_c_3a___1.factor = factor(CHILD$covid_exposure_c_3a___1,levels=c("0","1"))
CHILD$covid_exposure_c_3a___0.factor = factor(CHILD$covid_exposure_c_3a___0,levels=c("0","1"))
CHILD$covid_exposure_c_3b___1.factor = factor(CHILD$covid_exposure_c_3b___1,levels=c("0","1"))
CHILD$covid_exposure_c_3b___0.factor = factor(CHILD$covid_exposure_c_3b___0,levels=c("0","1"))
CHILD$covid_exposure_c_3c___1.factor = factor(CHILD$covid_exposure_c_3c___1,levels=c("0","1"))
CHILD$covid_exposure_c_3c___0.factor = factor(CHILD$covid_exposure_c_3c___0,levels=c("0","1"))
CHILD$covid_exposure_c_3d___1.factor = factor(CHILD$covid_exposure_c_3d___1,levels=c("0","1"))
CHILD$covid_exposure_c_3d___0.factor = factor(CHILD$covid_exposure_c_3d___0,levels=c("0","1"))
CHILD$covid_exposure_c_3e___1.factor = factor(CHILD$covid_exposure_c_3e___1,levels=c("0","1"))
CHILD$covid_exposure_c_3e___0.factor = factor(CHILD$covid_exposure_c_3e___0,levels=c("0","1"))
CHILD$covid_exposure_c_3f___1.factor = factor(CHILD$covid_exposure_c_3f___1,levels=c("0","1"))
CHILD$covid_exposure_c_3f___0.factor = factor(CHILD$covid_exposure_c_3f___0,levels=c("0","1"))
CHILD$covid_exposure_c_3h___1.factor = factor(CHILD$covid_exposure_c_3h___1,levels=c("0","1"))
CHILD$covid_exposure_c_3h___0.factor = factor(CHILD$covid_exposure_c_3h___0,levels=c("0","1"))
CHILD$covid_exposure_c_4___1.factor = factor(CHILD$covid_exposure_c_4___1,levels=c("0","1"))
CHILD$covid_exposure_c_4___2.factor = factor(CHILD$covid_exposure_c_4___2,levels=c("0","1"))
CHILD$covid_exposure_c_4___3.factor = factor(CHILD$covid_exposure_c_4___3,levels=c("0","1"))
CHILD$covid_exposure_c_6___1.factor = factor(CHILD$covid_exposure_c_6___1,levels=c("0","1"))
CHILD$covid_exposure_c_6___2.factor = factor(CHILD$covid_exposure_c_6___2,levels=c("0","1"))
CHILD$covid_exposure_c_6___3.factor = factor(CHILD$covid_exposure_c_6___3,levels=c("0","1"))
CHILD$covid_exposure_c_6___4.factor = factor(CHILD$covid_exposure_c_6___4,levels=c("0","1"))
CHILD$covid_exposure_c_6___5.factor = factor(CHILD$covid_exposure_c_6___5,levels=c("0","1"))
CHILD$covid_exposure_c_6___6.factor = factor(CHILD$covid_exposure_c_6___6,levels=c("0","1"))
CHILD$covid_exposure_c_6___7.factor = factor(CHILD$covid_exposure_c_6___7,levels=c("0","1"))
CHILD$covid_exposure_c_6___8.factor = factor(CHILD$covid_exposure_c_6___8,levels=c("0","1"))
CHILD$covid_exposure_c_7.factor = factor(CHILD$covid_exposure_c_7,levels=c("1","2","3","4","5"))
CHILD$covid_exposure_c_8.factor = factor(CHILD$covid_exposure_c_8,levels=c("1","2","3","4","5"))
CHILD$covid_exposure_c_9.factor = factor(CHILD$covid_exposure_c_9,levels=c("1","2","3","4","5"))
CHILD$covid_exposure_c_10.factor = factor(CHILD$covid_exposure_c_10,levels=c("1","2","3","4","5"))
CHILD$covid_exposure_c_11.factor = factor(CHILD$covid_exposure_c_11,levels=c("1","2","3","4","5"))
CHILD$covid_exposure_c_12.factor = factor(CHILD$covid_exposure_c_12,levels=c("1","2","3"))
CHILD$covid_exposure_complete.factor = factor(CHILD$covid_exposure_complete,levels=c("0","1","2"))
CHILD$covid_change_c_1a.factor = factor(CHILD$covid_change_c_1a,levels=c("1","0"))
CHILD$covid_change_1c.factor = factor(CHILD$covid_change_1c,levels=c("1","0"))
CHILD$covid_change_c_1b.factor = factor(CHILD$covid_change_c_1b,levels=c("1","0"))
CHILD$covid_change_c_1d.factor = factor(CHILD$covid_change_c_1d,levels=c("1","0"))
CHILD$covid_change_c_1e.factor = factor(CHILD$covid_change_c_1e,levels=c("1","0"))
CHILD$covid_change_c_1f.factor = factor(CHILD$covid_change_c_1f,levels=c("1","0"))
CHILD$covid_change_c_1g.factor = factor(CHILD$covid_change_c_1g,levels=c("1","0"))
CHILD$covid_change_c_4.factor = factor(CHILD$covid_change_c_4,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_5.factor = factor(CHILD$covid_change_c_5,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_6.factor = factor(CHILD$covid_change_c_6,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_7.factor = factor(CHILD$covid_change_c_7,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_8a.factor = factor(CHILD$covid_change_c_8a,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_8b.factor = factor(CHILD$covid_change_c_8b,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_9a.factor = factor(CHILD$covid_change_c_9a,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_9b.factor = factor(CHILD$covid_change_c_9b,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_10.factor = factor(CHILD$covid_change_c_10,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_11.factor = factor(CHILD$covid_change_c_11,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_12.factor = factor(CHILD$covid_change_c_12,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_13.factor = factor(CHILD$covid_change_c_13,levels=c("1","0"))
CHILD$covid_change_c_14.factor = factor(CHILD$covid_change_c_14,levels=c("1","2","3","4","5"))
CHILD$covid_changes_complete.factor = factor(CHILD$covid_changes_complete,levels=c("0","1","2"))
CHILD$covid_behav_c_1.factor = factor(CHILD$covid_behav_c_1,levels=c("1","2","3","4"))
CHILD$covid_behav_c_2.factor = factor(CHILD$covid_behav_c_2,levels=c("1","2","3","4","5"))
CHILD$covid_behav_c_3.factor = factor(CHILD$covid_behav_c_3,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_1.factor = factor(CHILD$covid_emotion_c_1,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_2.factor = factor(CHILD$covid_emotion_c_2,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_3.factor = factor(CHILD$covid_emotion_c_3,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_4.factor = factor(CHILD$covid_emotion_c_4,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_5.factor = factor(CHILD$covid_emotion_c_5,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_6.factor = factor(CHILD$covid_emotion_c_6,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_7.factor = factor(CHILD$covid_emotion_c_7,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_8.factor = factor(CHILD$covid_emotion_c_8,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_9.factor = factor(CHILD$covid_emotion_c_9,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_10.factor = factor(CHILD$covid_emotion_c_10,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_11.factor = factor(CHILD$covid_emotion_c_11,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_12.factor = factor(CHILD$covid_emotion_c_12,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_13.factor = factor(CHILD$covid_emotion_c_13,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_1.factor = factor(CHILD$covid_substance_c_1,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_2.factor = factor(CHILD$covid_substance_c_2,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_3.factor = factor(CHILD$covid_substance_c_3,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_4.factor = factor(CHILD$covid_substance_c_4,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_5.factor = factor(CHILD$covid_substance_c_5,levels=c("1","2","3","4","5"))
CHILD$covid_exposure_c_6a.factor = factor(CHILD$covid_exposure_c_6a,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_5b.factor = factor(CHILD$covid_substance_c_5b,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_6.factor = factor(CHILD$covid_substance_c_6,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_7.factor = factor(CHILD$covid_substance_c_7,levels=c("1","2","3","4","5"))
CHILD$covid_emotions_behaviors_3_months_complete.factor = factor(CHILD$covid_emotions_behaviors_3_months_complete,levels=c("0","1","2"))
CHILD$covid_behav_c_4.factor = factor(CHILD$covid_behav_c_4,levels=c("1","2","3","4"))
CHILD$covid_behav_c_5.factor = factor(CHILD$covid_behav_c_5,levels=c("1","2","3","4","5"))
CHILD$covid_behav_c_6.factor = factor(CHILD$covid_behav_c_6,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_14.factor = factor(CHILD$covid_emotion_c_14,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_15.factor = factor(CHILD$covid_emotion_c_15,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_16.factor = factor(CHILD$covid_emotion_c_16,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_17.factor = factor(CHILD$covid_emotion_c_17,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_18.factor = factor(CHILD$covid_emotion_c_18,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_19.factor = factor(CHILD$covid_emotion_c_19,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_20.factor = factor(CHILD$covid_emotion_c_20,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_21.factor = factor(CHILD$covid_emotion_c_21,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_22.factor = factor(CHILD$covid_emotion_c_22,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_23.factor = factor(CHILD$covid_emotion_c_23,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_24.factor = factor(CHILD$covid_emotion_c_24,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_25.factor = factor(CHILD$covid_emotion_c_25,levels=c("1","2","3","4","5"))
CHILD$covid_emotion_c_13_7011eb.factor = factor(CHILD$covid_emotion_c_13_7011eb,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_9.factor = factor(CHILD$covid_substance_c_9,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_10.factor = factor(CHILD$covid_substance_c_10,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_11.factor = factor(CHILD$covid_substance_c_11,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_13.factor = factor(CHILD$covid_substance_c_13,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_14.factor = factor(CHILD$covid_substance_c_14,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_14a.factor = factor(CHILD$covid_substance_c_14a,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_14b.factor = factor(CHILD$covid_substance_c_14b,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_15.factor = factor(CHILD$covid_substance_c_15,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_8.factor = factor(CHILD$covid_substance_c_8,levels=c("1","2","3","4","5"))
CHILD$covid_change_c_15___1.factor = factor(CHILD$covid_change_c_15___1,levels=c("0","1"))
CHILD$covid_change_c_15___2.factor = factor(CHILD$covid_change_c_15___2,levels=c("0","1"))
CHILD$covid_change_c_15___3.factor = factor(CHILD$covid_change_c_15___3,levels=c("0","1"))
CHILD$covid_change_c_15___4.factor = factor(CHILD$covid_change_c_15___4,levels=c("0","1"))
CHILD$covid_change_c_15___5.factor = factor(CHILD$covid_change_c_15___5,levels=c("0","1"))
CHILD$covid_change_c_15___6.factor = factor(CHILD$covid_change_c_15___6,levels=c("0","1"))
CHILD$covid_change_c_15___7.factor = factor(CHILD$covid_change_c_15___7,levels=c("0","1"))
CHILD$covid_change_c_15___8.factor = factor(CHILD$covid_change_c_15___8,levels=c("0","1"))
CHILD$covid_change_c_15___9.factor = factor(CHILD$covid_change_c_15___9,levels=c("0","1"))
CHILD$covid_change_c_15___10.factor = factor(CHILD$covid_change_c_15___10,levels=c("0","1"))
CHILD$covid_change_c_15___11.factor = factor(CHILD$covid_change_c_15___11,levels=c("0","1"))
CHILD$covid_change_c_15___12.factor = factor(CHILD$covid_change_c_15___12,levels=c("0","1"))
CHILD$covid_change_c_15___13.factor = factor(CHILD$covid_change_c_15___13,levels=c("0","1"))
CHILD$covid_emotions_behaviors_past_2_weeks_complete.factor = factor(CHILD$covid_emotions_behaviors_past_2_weeks_complete,levels=c("0","1","2"))

levels(CHILD$redcap_event_name.factor)=c("COVID T1","COVID T2","COVID T3")
levels(CHILD$covid_background_b1.factor)=c("American Indian or Alaska Native","Asian","Black or African American","Native Hawaiian or Other Pacific Islander","White","Bi/Multiracial","Other")
levels(CHILD$covid_background_race.factor)=c("Yes","No")
levels(CHILD$covid_background_gender.factor)=c("Male","Female","Non-binary/ Other gender","Questioning/ Unsure","Prefer to self describe:","Prefer not to say")
levels(CHILD$covid_background_1.factor)=c("Not in school","Elementary school","Junior High or Middle School","High school","College/Vocational")
levels(CHILD$covid_background_2.factor)=c("Large city","Suburbs of a large city","Small city","Town or village","Rural area")
levels(CHILD$covid_background_4___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___2.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___3.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___4.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___5.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___6.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___7.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___8.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___9.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___10.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___11.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_4___12.factor)=c("Unchecked","Checked")
levels(CHILD$covid_adol_report_1.factor)=c("Excellent","Very Good","Good","Fair","Poor")
levels(CHILD$covid_background_health___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___2.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___3.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___4.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___5.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___6.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___7.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___8.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___9.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___10.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___11.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___12.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___13.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___14.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___15.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___16.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___17.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___18.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___19.factor)=c("Unchecked","Checked")
levels(CHILD$covid_adol_report_5.factor)=c("Excellent","Very Good","Good","Fair","Poor")
levels(CHILD$background_complete.factor)=c("Incomplete","Unverified","Complete")
levels(CHILD$covid_exposure_c_1___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_1___2.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_1___3.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_1___4.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_2.factor)=c("Yes, I have/had a positive test","Yes, I have/had a medical diagnosis, but no test","Yes, I have/had some possible symptoms, but no diagnosis by a doctor","No")
levels(CHILD$covid_exposure_c_3a___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3a___0.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3b___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3b___0.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3c___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3c___0.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3d___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3d___0.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3e___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3e___0.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3f___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3f___0.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3h___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_3h___0.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_4___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_4___2.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_4___3.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_6___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_6___2.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_6___3.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_6___4.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_6___5.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_6___6.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_6___7.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_6___8.factor)=c("Unchecked","Checked")
levels(CHILD$covid_exposure_c_7.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_exposure_c_8.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_exposure_c_9.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_exposure_c_10.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_exposure_c_11.factor)=c("Never","Rarely","Occasionally","Often","Most of the time")
levels(CHILD$covid_exposure_c_12.factor)=c("None","Only a few","Some")
levels(CHILD$covid_exposure_complete.factor)=c("Incomplete","Unverified","Complete")
levels(CHILD$covid_change_c_1a.factor)=c("Yes","No")
levels(CHILD$covid_change_1c.factor)=c("Yes","No")
levels(CHILD$covid_change_c_1b.factor)=c("Yes","No")
levels(CHILD$covid_change_c_1d.factor)=c("Yes","No")
levels(CHILD$covid_change_c_1e.factor)=c("Yes","No")
levels(CHILD$covid_change_c_1f.factor)=c("Yes","No")
levels(CHILD$covid_change_c_1g.factor)=c("Yes","No")
levels(CHILD$covid_change_c_4.factor)=c("Not at all","1-2 days per week","A few days per week","Several days per week","Everyday")
levels(CHILD$covid_change_c_5.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_change_c_6.factor)=c("A lot less","A little less","About the same","A little more","A lot more")
levels(CHILD$covid_change_c_7.factor)=c("None","A little","Moderate","A lot","A great amount")
levels(CHILD$covid_change_c_8a.factor)=c("A lot worse","A little worse","About the same","A little better","A lot better")
levels(CHILD$covid_change_c_8b.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_change_c_9a.factor)=c("A lot worse","A little worse","About the same","A little better","A lot better")
levels(CHILD$covid_change_c_9b.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_change_c_10.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_change_c_11.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_change_c_12.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_change_c_13.factor)=c("Yes","No")
levels(CHILD$covid_change_c_14.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_changes_complete.factor)=c("Incomplete","Unverified","Complete")
levels(CHILD$covid_behav_c_1.factor)=c("less than 6 hours","6-8 hours","8-10 hours","more than 10 hours")
levels(CHILD$covid_behav_c_2.factor)=c("None","1-2 days","3-4 days","5-6 days","Daily")
levels(CHILD$covid_behav_c_3.factor)=c("None","1-2 days","3-4 days","5-6 days","Daily")
levels(CHILD$covid_emotion_c_1.factor)=c("Not worried at all","Slightly worried","Moderately worried","Very worried","Extremely worried")
levels(CHILD$covid_emotion_c_2.factor)=c("Very sad/depressed/unhappy","Moderately sad/depressed/unhappy","Neutral","Moderately happy/cheerful","Very happy/cheerful")
levels(CHILD$covid_emotion_c_3.factor)=c("Not at all","Slightly","Moderately","Very much","A lot")
levels(CHILD$covid_emotion_c_4.factor)=c("Very relaxed/calm","Moderately relaxed/calm","Neutral","Moderately nervous/anxious","Very nervous/anxious")
levels(CHILD$covid_emotion_c_5.factor)=c("Not fidgety/restless at all","Slightly fidgety/fatigued","Moderately fidgety/restless","Very fidgety/restless","Extremely fidgety/restless")
levels(CHILD$covid_emotion_c_6.factor)=c("Not fatigued or tired at all","Slightly fatigued or tired","Moderately fatigued or tired","Very fatigued or tired","Extremely fatigued or tired")
levels(CHILD$covid_emotion_c_7.factor)=c("Very focused/attentive","Moderately focused/attentive","Neutral","Moderately unfocused/distracted","Very unfocused/distracted")
levels(CHILD$covid_emotion_c_8.factor)=c("Not irritable or easily angered at all","Slightly irritable or easy angered","Moderately irritable or easily angered","Very irritable or easily angered","Extremely irritable or easily angered")
levels(CHILD$covid_emotion_c_9.factor)=c("Not lonely at all","Slightly lonely","Moderately lonely","Very lonely","Extremely lonely")
levels(CHILD$covid_emotion_c_10.factor)=c("Not at all","Rarely","Occasionally","Often","A lot of the time")
levels(CHILD$covid_emotion_c_11.factor)=c("No TV or digital media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$covid_emotion_c_12.factor)=c("No social media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$covid_emotion_c_13.factor)=c("No video games","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$covid_substance_c_1.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_2.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_3.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_4.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_5.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_exposure_c_6a.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_5b.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_6.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_7.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_emotions_behaviors_3_months_complete.factor)=c("Incomplete","Unverified","Complete")
levels(CHILD$covid_behav_c_4.factor)=c("less than 6 hours","6-8 hours","8-10 hours","more than 10 hours")
levels(CHILD$covid_behav_c_5.factor)=c("None","1-2 days","3-4 days","5-6 days","Daily")
levels(CHILD$covid_behav_c_6.factor)=c("None","1-2 days","3-4 days","5-6 days","Daily")
levels(CHILD$covid_emotion_c_14.factor)=c("Not worried at all","Slightly worried","Moderately worried","Very worried","Extremely worried")
levels(CHILD$covid_emotion_c_15.factor)=c("Very sad/depressed/unhappy","Moderately sad/depressed/unhappy","Neutral","Moderately happy/cheerful","Very happy/cheerful")
levels(CHILD$covid_emotion_c_16.factor)=c("Not at all","Slightly","Moderately","Very much","A lot")
levels(CHILD$covid_emotion_c_17.factor)=c("Very relaxed/calm","Moderately relaxed/calm","Neutral","Moderately nervous/anxious","Very nervous/anxious")
levels(CHILD$covid_emotion_c_18.factor)=c("Not fidgety/restless at all","Slightly fidgety/fatigued","Moderately fidgety/restless","Very fidgety/restless","Extremely fidgety/restless")
levels(CHILD$covid_emotion_c_19.factor)=c("Not fatigued or tired at all","Slightly fatigued or tired","Moderately fatigued or tired","Very fatigued or tired","Extremely fatigued or tired")
levels(CHILD$covid_emotion_c_20.factor)=c("Very focused/attentive","Moderately focused/attentive","Neutral","Moderately unfocused/distracted","Very unfocused/distracted")
levels(CHILD$covid_emotion_c_21.factor)=c("Not irritable or easily angered at all","Slightly irritable or easy angered","Moderately irritable or easily angered","Very irritable or easily angered","Extremely irritable or easily angered")
levels(CHILD$covid_emotion_c_22.factor)=c("Not lonely at all","Slightly lonely","Moderately lonely","Very lonely","Extremely lonely")
levels(CHILD$covid_emotion_c_23.factor)=c("Not at all","Rarely","Occasionally","Often","A lot of the time")
levels(CHILD$covid_emotion_c_24.factor)=c("No TV or digital media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$covid_emotion_c_25.factor)=c("No social media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$covid_emotion_c_13_7011eb.factor)=c("No social media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$covid_substance_c_9.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_10.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_11.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_13.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_14.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_14a.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_14b.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_15.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_substance_c_8.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_change_c_15___1.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___2.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___3.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___4.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___5.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___6.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___7.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___8.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___9.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___10.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___11.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___12.factor)=c("Unchecked","Checked")
levels(CHILD$covid_change_c_15___13.factor)=c("Unchecked","Checked")
levels(CHILD$covid_emotions_behaviors_past_2_weeks_complete.factor)=c("Incomplete","Unverified","Complete")









