## ---------------------------
##
## Script name: COVID.Label.Exposure.Child.R
##
## Purpose of script: Label the Child COVID exposure data 
##
## Authors: Dr. Anthony J. Gifuni & Rachel Weisenburger
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
#source(here::here("Code","COVID.Import.Data.R"))

## ---------------------------------------------------------------------

#Setting Labels

#label(CHILD$record_id)="Record ID"
#label(CHILD$redcap_event_name)="Event Name"
#label(CHILD$redcap_survey_identifier)="Survey Identifier"
#label(CHILD$background_timestamp)="Survey Timestamp"
#label(CHILD$covid_c_name)="What is your full name?"
#label(CHILD$covid_c_pref_name)="What is your preferred name?"
label(CHILD$covid_background_a)="How old are you? "
label(CHILD$covid_background_b1)="What race(s) do you identify as?"
label(CHILD$covid_background_race)="Do you identify as Hispanic or Latino(a)?"
label(CHILD$covid_background_race_describe)="Please specify the race(s) you identify as:"
label(CHILD$covid_background_gender)="What is your current gender identity?"
label(CHILD$covid_background_genderb)="Please describe your current gender identity:"
label(CHILD$covid_background_1)="Are you enrolled in school/college for the current academic year (2019-2020)?"
label(CHILD$covid_background_2)="Which best describes the area in which you live?"
label(CHILD$covid_background_3)="How many people currently live in your home (excluding yourself)?"
label(CHILD$covid_background_4___1)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Biological mother)"
label(CHILD$covid_background_4___2)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Biological father)"
label(CHILD$covid_background_4___3)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Stepmother)"
label(CHILD$Home_stepfather.TC)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Stepfather)"
label(CHILD$covid_background_4___5)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Adoptive/Foster parent(s))"
label(CHILD$covid_background_4___6)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Sibling(s))"
label(CHILD$covid_background_4___7)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Other relative(s))"
label(CHILD$covid_background_4___8)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Other non-relative(s))"
label(CHILD$covid_background_4___9)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Roommate(s))"
label(CHILD$covid_background_4___10)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Significant other)"
label(CHILD$covid_background_4___11)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=Other)"
label(CHILD$covid_background_4___12)="Please specify your relationship to the people in your home. Please select based on the home you currently spend the most time at. Check all that apply. (choice=No one, I live alone)"
label(CHILD$covid_background_4a)="Who currently lives with you at home? Please describe."
label(CHILD$covid_adol_report_1)="How would you rate your overall physical health?"
label(CHILD$covid_background_health___1)="Has a health professional ever told you that you had any of the following health conditions? (choice=Seasonal allergies)"
label(CHILD$covid_background_health___2)="Has a health professional ever told you that you had any of the following health conditions? (choice=Asthma or other lung problems)"
label(CHILD$covid_background_health___3)="Has a health professional ever told you that you had any of the following health conditions? (choice=Heart problems)"
label(CHILD$covid_background_health___4)="Has a health professional ever told you that you had any of the following health conditions? (choice=Kidney problems)"
label(CHILD$covid_background_health___5)="Has a health professional ever told you that you had any of the following health conditions? (choice=Immune disorder)"
label(CHILD$covid_background_health___6)="Has a health professional ever told you that you had any of the following health conditions? (choice=Diabetes or high blood sugar)"
label(CHILD$covid_background_health___7)="Has a health professional ever told you that you had any of the following health conditions? (choice=Any recent infection (e.g., pneumonia, cold, flu, urinary tract infection, etc.))"
label(CHILD$covid_background_health___8)="Has a health professional ever told you that you had any of the following health conditions? (choice=Hypertension)"
label(CHILD$covid_background_health___9)="Has a health professional ever told you that you had any of the following health conditions? (choice=High Cholesterol)"
label(CHILD$covid_background_health___10)="Has a health professional ever told you that you had any of the following health conditions? (choice=Cancer)"
label(CHILD$covid_background_health___11)="Has a health professional ever told you that you had any of the following health conditions? (choice=Arthritis)"
label(CHILD$covid_background_health___12)="Has a health professional ever told you that you had any of the following health conditions? (choice=Frequent or very bad headaches)"
label(CHILD$covid_background_health___13)="Has a health professional ever told you that you had any of the following health conditions? (choice=Epilepsy or seizures)"
label(CHILD$covid_background_health___14)="Has a health professional ever told you that you had any of the following health conditions? (choice=Serious stomach or bowel problems)"
label(CHILD$covid_background_health___15)="Has a health professional ever told you that you had any of the following health conditions? (choice=Serious acne or skin problems)"
label(CHILD$covid_background_health___15)="Has a health professional ever told you that you had any of the following health conditions? (choice=Emotion or mental health problems (ex. Depression or Anxiety))"
label(CHILD$covid_background_health___17)="Has a health professional ever told you that you had any of the following health conditions? (choice=Problems with alcohol or drugs)"
label(CHILD$covid_background_health___18)="Has a health professional ever told you that you had any of the following health conditions? (choice=Any recent Traumatic Brain Injury)"
label(CHILD$covid_background_health___19)="Has a health professional ever told you that you had any of the following health conditions? (choice=Any recent, serious accident (e.g., car accident, bike accident, sports injury, etc.))"
label(CHILD$covid_adol_report_3)="How tall are you? "
label(CHILD$covid_adol_report_4)="How much do you weigh?"
label(CHILD$covid_adol_report_5)="How would you rate your overall mental/emotional health before the Coronavirus/COVID-19 crisis in your area?"
label(CHILD$background_complete)="Complete?"
label(CHILD$covid_exposure_timestamp)="Survey Timestamp"
label(CHILD$covid_exposure_c_1___1)="... have you been exposed to someone likely to have COVID-19? (choice=Yes, someone with positive test"
label(CHILD$covid_exposure_c_1___2)="... have you been exposed to someone likely to have COVID-19? (choice=Yes, someone with medical diagnosis, but no test)"
label(CHILD$covid_exposure_c_1___3)="... have you been exposed to someone likely to have COVID-19? (choice=Yes, someone with possible symptoms, but no diagnosis by a doctor)"
label(CHILD$covid_exposure_c_1___4)="... have you been exposed to someone likely to have COVID-19? (choice=No)"
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
label(CHILD$covid_exposure_c_4___1)=".. has anyone in your family been diagnosed with Coronavirus/COVID-19? (choice=Yes, member of household)"
label(CHILD$covid_exposure_c_4___2)=".. has anyone in your family been diagnosed with Coronavirus/COVID-19? (choice=Yes, non-household member)"
label(CHILD$covid_exposure_c_4___3)=".. has anyone in your family been diagnosed with Coronavirus/COVID-19? (choice=No)"
label(CHILD$covid_exposure_c_6___1)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (choice=Fallen ill physically)"
label(CHILD$covid_exposure_c_6___2)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (choice=Hospitalized)"
label(CHILD$covid_exposure_c_6___3)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (choice=Put into self-quarantine with symptoms)"
label(CHILD$covid_exposure_c_6___4)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (choice=Put into self-quarantine without symptoms (e.g., due to possible exposure))"
label(CHILD$covid_exposure_c_6___5)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (choice=Lost job)"
label(CHILD$covid_exposure_c_6___6)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (choice=Reduced ability to earn money)"
label(CHILD$covid_exposure_c_6___7)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (choice=Passed away)"
label(CHILD$covid_exposure_c_6___8)="... have any of the following happened to your family members because of Coronavirus/COVID-19? (choice=None of the above)"
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
label(CHILD$covid_change_c_15___1)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Resource room)"
label(CHILD$covid_change_c_15___2)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Tutoring)"
label(CHILD$covid_change_c_15___3)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Mentoring programs)"
label(CHILD$covid_change_c_15___4)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=After school activities or programs)"
label(CHILD$covid_change_c_15___5)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Volunteer programs)"
label(CHILD$covid_change_c_15___6)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Psychotherapy)"
label(CHILD$covid_change_c_15___7)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Psychiatric care)"
label(CHILD$covid_change_c_15___8)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Occupational therapy)"
label(CHILD$covid_change_c_15___9)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Physical therapy)"
label(CHILD$covid_change_c_15___10)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Speech/language therapy)"
label(CHILD$covid_change_c_15___11)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Sporting activities)"
label(CHILD$covid_change_c_15___12)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Medical care for chronic illnesses)"
label(CHILD$covid_change_c_15___13)="Which of the following supports were in place for you before the Coronavirus/COVID-19 crisis and have been disrupted over the PAST TWO WEEKS? (choice=Other)"
label(CHILD$covid_emotions_behaviors_past_2_weeks_complete)="Complete?"

##Renaming NIH Variables to be more descriptive
CHILD <- rename(CHILD, 
                "Subject_ID_Timepoint" = "record_id", 
                "Child_gender_identity.TC" = "covid_background_gender",
                "Child_Age.TC" = "covid_background_a",
                "Child_Race.TC" = "covid_background_b1",
                "Child_Ethnicity.TC" = "covid_background_race",
                "School_type.TC"="covid_background_1", 
                "Area_live.TC" = "covid_background_2",
                "Number_people_home.TC"="covid_background_3",
                "Home_biomother.TC" = "covid_background_4___1",
                "Home_biofather.TC" = "covid_background_4___2",
                "Home_stepmother.TC" = "covid_background_4___3",
                "Home_stepfather.TC" = "covid_background_4___4",
                "Home_adopt_parent.TC" = "covid_background_4___5",
                "Home_sibling.TC" = "covid_background_4___6",
                "Home_other_relat.TC" = "covid_background_4___7",
                "Home_nonrelat.TC" = "covid_background_4___8",
                "Home_roommate.TC" =  "covid_background_4___9",
                "Home_sig_other.TC" =  "covid_background_4___10",
                "Home_other.TC"  = "covid_background_4___11",
                "Home_alone.TC"  = "covid_background_4___12",
                "Home_other_describe.TC" = "covid_background_4a",
                "Physical_health_rating.TC"="covid_adol_report_1",
                "Seasonal_allergies.TC"="covid_background_health___1",
                "Asthma_lung_problems.TC"="covid_background_health___2",
                "Heart_problems.TC"="covid_background_health___3",
                "Kidney_problems.TC"="covid_background_health___4",
                "Immune_disorder.TC"="covid_background_health___5",
                "Diabetes.TC"="covid_background_health___6",
                "Recent_infection.TC"="covid_background_health___7",
                "Hypertension.TC"="covid_background_health___8",
                "High_cholesterol.TC"="covid_background_health___9",
                "Cancer.TC"="covid_background_health___10",
                "Arthritis.TC"= "covid_background_health___11",
                "Headaches.TC"="covid_background_health___12",
                "Epilepsy_seizures.TC"="covid_background_health___13",
                "Stomach_problems.TC"="covid_background_health___14",
                "Skin_problems.TC"="covid_background_health___15",
                "Psych_problems.TC"="covid_background_health___16",
                "Substance_problems.TC"="covid_background_health___17",
                "TBI.TC"="covid_background_health___18",
                "Serious_accident.TC"="covid_background_health___19",
                "Child_height.TC" = "covid_adol_report_3",
                "Child_weight.TC" = "covid_adol_report_4", 
                "Mental_health_rating.TC"="covid_adol_report_5",
                "Exposed_dx_pos_test.TC"  = "covid_exposure_c_1___1",
                "Exposed_dx_no_test.TC"  = "covid_exposure_c_1___2",
                "Exposed_symptoms_no_test.TC"  =  "covid_exposure_c_1___3",
                "Exposed_no.TC"  =  "covid_exposure_c_1___4",
                "Covid_child_dx.TC"  =  "covid_exposure_c_2",
                "Covid_child_fever.TC"  =  "covid_exposure_c_3a___1",
                "Covid_child_no_fever.TC"  =  "covid_exposure_c_3a___0",
                "Covid_child_cough.TC"  =  "covid_exposure_c_3b___1",
                "Covid_child_no_cough.TC"  =  "covid_exposure_c_3b___0",
                "Covid_child_short_breath.TC"  =  "covid_exposure_c_3c___1",
                "Covid_child_no_short_breath.TC"  =  "covid_exposure_c_3c___0",
                "Covid_child_sore_throat.TC"  =  "covid_exposure_c_3d___1",
                "Covid_child_no_sore_throat.TC"  =  "covid_exposure_c_3d___0",
                "Covid_child_fatigue.TC"  =  "covid_exposure_c_3e___1",
                "Covid_child_no_fatigue.TC"  =  "covid_exposure_c_3e___0",
                "Covid_child_loss_taste_smell.TC"  =  "covid_exposure_c_3f___1",
                "Covid_child_no_loss_taste_smell.TC"  = "covid_exposure_c_3f___0",
                "Covid_child_other_symptom.TC"  =  "covid_exposure_c_3h___1",
                "Covid_child_no_other_symptom.TC"  =  "covid_exposure_c_3h___0",
                "Covid_child_other_symptom_desc.TC"  = "covid_exposure_c_3g",
                "Mem_household_covid_dx.TC" = "covid_exposure_c_4___1",
                "Non_mem_household_covid_dx.TC" = "covid_exposure_c_4___2",
                "No_fam_covid_dx.TC" = "covid_exposure_c_4___3",
                "Fam_member_ill.TC"= "covid_exposure_c_6___1",
                "Fam_member_hospitalized.TC"= "covid_exposure_c_6___2",
                "Fam_member_selfquar_symp.TC"= "covid_exposure_c_6___3",
                "Fam_member_selfquar_nosymp.TC"= "covid_exposure_c_6___4",
                "Fam_member_lost_job.TC"=" covid_exposure_c_6___5",
                "Fam_member_less_money.TC"= "covid_exposure_c_6___6",
                "Fam_member_pass_away.TC"= "covid_exposure_c_6___7",
                "No_fam_member_changes.TC"= "covid_exposure_c_6___8",
                "Worry_self_infected.TC" ="covid_exposure_c_7",
                "Worry_fam_infected.TC" ="covid_exposure_c_8",
                "Self_phys_health_influence.TC" = "covid_exposure_c_9",
                "Self_mental_health_influence.TC" = "covid_exposure_c_10",
                "Read_talk_virus.TC" = "covid_exposure_c_11",
                "Covid_positive_changes.TC"="covid_exposure_c_12",
                "Covid_positive_changes_desc.TC"="covid_exposure_c_13",
                "School_building_closed.TC" = "covid_change_c_1a",
                "Classes_in_person.TC" ="covid_change_1c",
                "Classes_in_session.TC"= "covid_change_c_1b",
                "Classes_online.TC" = "covid_change_c_1d", 
                "Access_to_internet.TC"= "covid_change_c_1e",
                "Assignments.TC"= "covid_change_c_1f",
                "Meals_from_school.TC" ="covid_change_c_1g",
                "Num_contacts_outside_household.TC"= "covid_change_c_3",
                "Time_going_oustide.TC"= "covid_change_c_4",
                "Stress_of_restrictions.TC"= "covid_change_c_5",
                "Contacts_outside_change.TC"= "covid_change_c_6",
                "Diff_following_contact_rules.TC"= "covid_change_c_7", 
                "Quality_relations_family_change.TC"= "covid_change_c_8a", 
                "Stress_relations_family_change.TC"= "covid_change_c_8b", 
                "Quality_relations_friends_change.TC"= "covid_change_c_9a" ,
                "Stress_relations_friends_change.TC"= "covid_change_c_9b",
                "Cancelling_events_difficulty.TC"= "covid_change_c_10" ,
                "Family_financial_problems.TC"= "covid_change_c_11",
                "Worry_living_stability.TC"= "covid_change_c_12",
                "Worry_no_food.TC"= "covid_change_c_13",
                "Hope_crisis_end.TC"= "covid_change_c_14",
                "Hours_sleep_3months.TC"= "covid_behav_c_1",
                "Days_exercise_3months.TC" = "covid_behav_c_2", 
                "Days_outdoors_3months.TC" = "covid_behav_c_3",
                "Worried_3months.TC" = "covid_emotion_c_1",
                "Happy_sad_3months.TC"="covid_emotion_c_2",
                "Anhedonia_3months.TC"="covid_emotion_c_3",
                "Relaxed_anxious_3months.TC"="covid_emotion_c_4", 
                "Fidgety_restless_3months.TC"="covid_emotion_c_5",
                "Fatigued_tired_3months.TC"="covid_emotion_c_6", 
                "Concentration_3months.TC"="covid_emotion_c_7", 
                "Irritability_3months.TC"="covid_emotion_c_8",
                "Loneliness_3months.TC"="covid_emotion_c_9", 
                "Neg_thoughts_3monthss.TC"= "covid_emotion_c_10",
                "Time_watching_TV_3months.TC" = "covid_emotion_c_11",
                "Time_social_media_3months.TC"= "covid_emotion_c_12",
                "Time_video_games_3months.TC" = "covid_emotion_c_13", 
                "Alcohol_3months.TC" = "covid_substance_c_1", 
                "Vaping_nicotine_3months.TC" = "covid_substance_c_2", 
                "Cigs_tobacco_3months.TC" = "covid_substance_c_3", 
                "Cannabis_3months.TC" = "covid_substance_c_4", 
                "Opiates_heropin_narcs_3months.TC" = "covid_substance_c_5",
                "MDMA_molly_ecstasy_3months.TC" = "covid_exposure_c_6a", 
                "Halluc_3months.TC" = "covid_substance_c_5b",
                "Other_drugs_3months.TC" = "covid_substance_c_6",
                "Sleep_meds_seds_hypnot_3months.TC" = "covid_substance_c_7",
                "Hours_sleep_2weeks.TC"="covid_behav_c_4",
                "Days_exercise_2weeks.TC"="covid_behav_c_5",
                "Days_outdoors_2weeks.TC"="covid_behav_c_6",
                "Worried_2weeks.TC"="covid_emotion_c_14",
                "Happy_sad_2weeks.TC"="covid_emotion_c_15",
                "Anhedonia_2weeks.TC"="covid_emotion_c_16",
                "Relaxed_anxious_2weeks.TC"="covid_emotion_c_17",
                "Fidgety_restless_2weeks.TC"="covid_emotion_c_18",
                "Fatigued_tired_2weeks.TC"="covid_emotion_c_19",
                "Concentration_2weeks.TC"="covid_emotion_c_20",
                "Irritability_2weeks.TC"="covid_emotion_c_21",
                "Loneliness_2weeks.TC"="covid_emotion_c_22",
                "Neg_thoughts_2weeks.TC"="covid_emotion_c_23",
                "Time_watching_TV_2weeks.TC"="covid_emotion_c_24",
                "Time_social_media_2weeks.TC"="covid_emotion_c_25",
                "Time_video_games_2weeks.TC"="covid_emotion_c_13_7011eb",
                "Alcohol_2weeks.TC" = "covid_substance_c_9",
                "Vaping_nicotine_2weeks.TC" = "covid_substance_c_10",
                "Cigs_tobacco_2weeks.TC" = "covid_substance_c_11",
                "Cannabis_2weeks.TC" = "covid_substance_c_13",
                "Opiates_heropin_narcs_2weeks.TC" = "covid_substance_c_14",
                "MDMA_molly_ecstasy_2weeks.TC" = "covid_substance_c_14a",
                "Halluc_2weeks.TC" = "covid_substance_c_14b",
                "Other_drugs_2weeks.TC" = "covid_substance_c_15",
                "Sleep_meds_seds_hypnot_2weeks.TC" ="covid_substance_c_8",
                "Resource_room.TC"="covid_change_c_15___1",
                "Tutoring.TC"="covid_change_c_15___2",
                "Mentoring_programs.TC"="covid_change_c_15___3",
                "After_school_programs.TC"="covid_change_c_15___4",
                "Volunteer_programs.TC"="covid_change_c_15___5",
                "Psychotherapy.TC"="covid_change_c_15___6",
                "Psychiatric_care.TC"="covid_change_c_15___7",
                "Occup_therapy.TC"="covid_change_c_15___8",
                "Phys_therapy.TC"="covid_change_c_15___9",
                "Speech_therapy.TC"="covid_change_c_15___10",
                "Sport_activities.TC"="covid_change_c_15___11",
                "Medical_care.TC"="covid_change_c_15___12",
                "Other_support_specify.TC"="covid_change_c_15___13"
)

#Setting Units


#Setting Factors(will create new variable for factors)
#CHILD$redcap_event_name.factor = factor(CHILD$redcap_event_name,levels=c("covid_t1_arm_1","covid_t2_arm_1","covid_t3_arm_1"))
CHILD$Child_Race.TC.factor = factor(CHILD$Child_Race.TC,levels=c("1","2","3","4","5","6","7"))
CHILD$Child_Ethnicity.TC.factor = factor(CHILD$Child_Ethnicity.TC,levels=c("1","0"))
CHILD$Child_gender_identity.TC.factor = factor(CHILD$Child_gender_identity.TC,levels=c("1","2","3","4","5","6"))
CHILD$School_type.TC.factor = factor(CHILD$School_type.TC,levels=c("1","2","3","4","5"))
CHILD$Area_live.TC.factor = factor(CHILD$Area_live.TC,levels=c("1","2","3","4","5"))
CHILD$Home_biomother.TC.factor = factor(CHILD$Home_biomother.TC,levels=c("0","1"))
CHILD$Home_biofather.TC.factor = factor(CHILD$Home_biofather.TC,levels=c("0","1"))
CHILD$Home_stepmother.TC.factor = factor(CHILD$Home_stepmother.TC,levels=c("0","1"))
CHILD$Home_stepfather.TC.factor = factor(CHILD$Home_stepfather.TC,levels=c("0","1"))
CHILD$Home_adopt_parent.TC.factor = factor(CHILD$Home_adopt_parent.TC,levels=c("0","1"))
CHILD$Home_sibling.TC.factor = factor(CHILD$Home_sibling.TC,levels=c("0","1"))
CHILD$Home_other_relat.TC.factor = factor(CHILD$Home_other_relat.TC,levels=c("0","1"))
CHILD$Home_nonrelat.TC.factor = factor(CHILD$Home_nonrelat.TC,levels=c("0","1"))
CHILD$Home_roommate.TC.factor = factor(CHILD$Home_roommate.TC,levels=c("0","1"))
CHILD$Home_sig_other.TC.factor = factor(CHILD$Home_sig_other.TC,levels=c("0","1"))
CHILD$Home_other.TC.factor = factor(CHILD$Home_other.TC,levels=c("0","1"))
CHILD$Home_alone.TC.factor = factor(CHILD$Home_alone.TC,levels=c("0","1"))
CHILD$Physical_health_rating.TC.factor = factor(CHILD$Physical_health_rating.TC,levels=c("1","2","3","4","5"))
CHILD$Seasonal_allergies.TC.factor = factor(CHILD$Seasonal_allergies.TC,levels=c("0","1"))
CHILD$Asthma_lung_problems.TC.factor = factor(CHILD$Asthma_lung_problems.TC,levels=c("0","1"))
CHILD$Heart_problems.TC.factor = factor(CHILD$Heart_problems.TC,levels=c("0","1"))
CHILD$Kidney_problems.TC.factor = factor(CHILD$Kidney_problems.TC,levels=c("0","1"))
CHILD$Immune_disorder.TC.factor = factor(CHILD$Immune_disorder.TC,levels=c("0","1"))
CHILD$ Diabetes.TC.factor = factor(CHILD$ Diabetes.TC,levels=c("0","1"))
CHILD$Recent_infection.TC.factor = factor(CHILD$Recent_infection.TC,levels=c("0","1"))
CHILD$Hypertension.TC.factor = factor(CHILD$Hypertension.TC,levels=c("0","1"))
CHILD$High_cholesterol.TC.factor = factor(CHILD$High_cholesterol.TC,levels=c("0","1"))
CHILD$Cancer.TC.factor = factor(CHILD$Cancer.TC,levels=c("0","1"))
CHILD$Arthritis.TC.factor = factor(CHILD$Arthritis.TC,levels=c("0","1"))
CHILD$Headaches.TC.factor = factor(CHILD$Headaches.TC,levels=c("0","1"))
CHILD$Epilepsy_seizures.TC.factor = factor(CHILD$Epilepsy_seizures.TC,levels=c("0","1"))
CHILD$Stomach_problems.TC.factor = factor(CHILD$Stomach_problems.TC,levels=c("0","1"))
CHILD$Skin_problems.TC.factor = factor(CHILD$Skin_problems.TC,levels=c("0","1"))
CHILD$Psych_problems.TC.factor = factor(CHILD$Psych_problems.TC,levels=c("0","1"))
CHILD$Substance_problems.TC.factor = factor(CHILD$Substance_problems.TC,levels=c("0","1"))
CHILD$TBI.TC.factor = factor(CHILD$TBI.TC,levels=c("0","1"))
CHILD$Serious_accident.TC.factor = factor(CHILD$Serious_accident.TC,levels=c("0","1"))
CHILD$Mental_health_rating.TC.factor = factor(CHILD$Mental_health_rating.TC,levels=c("1","2","3","4","5"))
CHILD$background_complete.factor = factor(CHILD$background_complete,levels=c("0","1","2"))
CHILD$Exposed_dx_pos_test.TC.factor = factor(CHILD$Exposed_dx_pos_test.TC,levels=c("0","1"))
CHILD$Exposed_dx_no_test.TC.factor = factor(CHILD$Exposed_dx_no_test.TC,levels=c("0","1"))
CHILD$Exposed_symptoms_no_test.TC.factor = factor(CHILD$Exposed_symptoms_no_test.TC,levels=c("0","1"))
CHILD$Exposed_no.TC.factor = factor(CHILD$Exposed_no.TC,levels=c("0","1"))
CHILD$Covid_child_dx.TC.factor = factor(CHILD$Covid_child_dx.TC,levels=c("1","2","3","4"))
CHILD$Covid_child_fever.TC.factor = factor(CHILD$Covid_child_fever.TC,levels=c("0","1"))
CHILD$Covid_child_no_fever.TC.factor = factor(CHILD$Covid_child_no_fever.TC,levels=c("0","1"))
CHILD$Covid_child_cough.TC.factor = factor(CHILD$Covid_child_cough.TC,levels=c("0","1"))
CHILD$Covid_child_no_cough.TC.factor = factor(CHILD$Covid_child_no_cough.TC,levels=c("0","1"))
CHILD$Covid_child_short_breath.TC.factor = factor(CHILD$Covid_child_short_breath.TC,levels=c("0","1"))
CHILD$Covid_child_no_short_breath.TC.factor = factor(CHILD$Covid_child_no_short_breath.TC,levels=c("0","1"))
CHILD$Covid_child_sore_throat.TC.factor = factor(CHILD$Covid_child_sore_throat.TC,levels=c("0","1"))
CHILD$Covid_child_no_sore_throat.TC.factor = factor(CHILD$Covid_child_no_sore_throat.TC,levels=c("0","1"))
CHILD$Covid_child_fatigue.TC.factor = factor(CHILD$Covid_child_fatigue.TC,levels=c("0","1"))
CHILD$Covid_child_no_fatigue.TC.factor = factor(CHILD$Covid_child_no_fatigue.TC,levels=c("0","1"))
CHILD$Covid_child_loss_taste_smell.TC.factor = factor(CHILD$Covid_child_loss_taste_smell.TC,levels=c("0","1"))
CHILD$Covid_child_no_loss_taste_smell.TC.factor = factor(CHILD$Covid_child_no_loss_taste_smell.TC,levels=c("0","1"))
CHILD$Covid_child_other_symptom.TC.factor = factor(CHILD$Covid_child_other_symptom.TC,levels=c("0","1"))
CHILD$Covid_child_no_other_symptom.TC.factor = factor(CHILD$Covid_child_no_other_symptom.TC,levels=c("0","1"))
CHILD$Mem_household_covid_dx.TC.factor = factor(CHILD$Mem_household_covid_dx.TC,levels=c("0","1"))
CHILD$Non_mem_household_covid_dx.TC.factor = factor(CHILD$Non_mem_household_covid_dx.TC,levels=c("0","1"))
CHILD$No_fam_covid_dx.TC.factor = factor(CHILD$No_fam_covid_dx.TC,levels=c("0","1"))
CHILD$Fam_member_ill.TC.factor = factor(CHILD$Fam_member_ill.TC,levels=c("0","1"))
CHILD$Fam_member_hospitalized.TC.factor = factor(CHILD$Fam_member_hospitalized.TC,levels=c("0","1"))
CHILD$Fam_member_selfquar_symp.TC.factor = factor(CHILD$Fam_member_selfquar_symp.TC,levels=c("0","1"))
CHILD$Fam_member_selfquar_nosymp.TC.factor = factor(CHILD$Fam_member_selfquar_nosymp.TC,levels=c("0","1"))
CHILD$Fam_member_lost_job.TC.factor = factor(CHILD$Fam_member_lost_job.TC,levels=c("0","1"))
CHILD$Fam_member_less_money.TC.factor = factor(CHILD$Fam_member_less_money.TC,levels=c("0","1"))
CHILD$Fam_member_pass_away.TC.factor = factor(CHILD$Fam_member_pass_away.TC,levels=c("0","1"))
CHILD$No_fam_member_changes.TC.factor = factor(CHILD$No_fam_member_changes.TC,levels=c("0","1"))
CHILD$Worry_self_infected.TC.factor = factor(CHILD$Worry_self_infected.TC,levels=c("1","2","3","4","5"))
CHILD$Worry_fam_infected.TC.factor = factor(CHILD$Worry_fam_infected.TC,levels=c("1","2","3","4","5"))
CHILD$Self_phys_health_influence.TC.factor = factor(CHILD$Self_phys_health_influence.TC,levels=c("1","2","3","4","5"))
CHILD$Self_mental_health_influence.TC.factor = factor(CHILD$Self_mental_health_influence.TC,levels=c("1","2","3","4","5"))
CHILD$Read_talk_virus.TC.factor = factor(CHILD$Read_talk_virus.TC,levels=c("1","2","3","4","5"))
CHILDCovid_positive_changes.TC.factor = factor(CHILD$Covid_positive_changes.TC,levels=c("1","2","3"))
CHILD$covid_exposure_complete.factor = factor(CHILD$covid_exposure_complete,levels=c("0","1","2"))
CHILD$School_building_closed.TC.factor = factor(CHILD$School_building_closed.TC,levels=c("1","0"))
CHILD$Classes_in_person.TC.factor = factor(CHILD$Classes_in_person.TC,levels=c("1","0"))
CHILD$Classes_in_session.TC.factor = factor(CHILD$Classes_in_session.TC,levels=c("1","0"))
CHILD$Classes_online.TC.factor = factor(CHILD$Classes_online.TC,levels=c("1","0"))
CHILD$Access_to_internet.TC.factor = factor(CHILD$Access_to_internet.TC,levels=c("1","0"))
CHILD$Assignments.TC.factor = factor(CHILD$Assignments.TC,levels=c("1","0"))
CHILD$Meals_from_school.TC.factor = factor(CHILD$Meals_from_school.TC,levels=c("1","0"))
CHILD$Time_going_oustide.TC.factor = factor(CHILD$Time_going_oustide.TC,levels=c("1","2","3","4","5"))
CHILD$Stress_of_restrictions.TC.factor = factor(CHILD$Stress_of_restrictions.TC,levels=c("1","2","3","4","5"))
CHILD$Contacts_outside_change.TC.factor = factor(CHILD$Contacts_outside_change.TC,levels=c("1","2","3","4","5"))
CHILD$Diff_following_contact_rules.TC.factor = factor(CHILD$Diff_following_contact_rules.TC,levels=c("1","2","3","4","5"))
CHILD$Quality_relations_family_change.TC.factor = factor(CHILD$Quality_relations_family_change.TC,levels=c("1","2","3","4","5"))
CHILD$Stress_relations_family_change.TC.factor = factor(CHILD$Stress_relations_family_change.TC,levels=c("1","2","3","4","5"))
CHILD$Quality_relations_friends_change.TC.factor = factor(CHILD$Quality_relations_friends_change.TC,levels=c("1","2","3","4","5"))
CHILD$Stress_relations_friends_change.TC.factor = factor(CHILD$Stress_relations_friends_change.TC,levels=c("1","2","3","4","5"))
CHILD$Cancelling_events_difficulty.TC.factor = factor(CHILD$Cancelling_events_difficulty.TC,levels=c("1","2","3","4","5"))
CHILD$Family_financial_problems.TC.factor = factor(CHILD$Family_financial_problems.TC,levels=c("1","2","3","4","5"))
CHILD$Worry_living_stability.TC.factor = factor(CHILD$Worry_living_stability.TC,levels=c("1","2","3","4","5"))
CHILD$Worry_no_food.TC.factor = factor(CHILD$Worry_no_food.TC,levels=c("1","0"))
CHILD$Hope_crisis_end.TC.factor = factor(CHILD$Hope_crisis_end.TC,levels=c("1","2","3","4","5"))
CHILD$covid_changes_complete.factor = factor(CHILD$covid_changes_complete,levels=c("0","1","2"))
CHILD$Hours_sleep_3months.TC.factor = factor(CHILD$Hours_sleep_3months.TC,levels=c("1","2","3","4"))
CHILD$Days_exercise_3months.TC.factor = factor(CHILD$Days_exercise_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Days_outdoors_3months.TC.factor = factor(CHILD$Days_outdoors_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Worried_3months.TC.factor = factor(CHILD$Worried_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Happy_sad_3months.TC.factor = factor(CHILD$Happy_sad_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Anhedonia_3months.TC.factor = factor(CHILD$Anhedonia_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Relaxed_anxious_3months.TC.factor = factor(CHILD$Relaxed_anxious_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Fidgety_restless_3months.TC.factor = factor(CHILD$Fidgety_restless_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Fatigued_tired_3months.TC.factor = factor(CHILD$Fatigued_tired_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Concentration_3months.TC.factor = factor(CHILD$Concentration_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Irritability_3months.TC.factor = factor(CHILD$Irritability_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Loneliness_3months.TC.factor = factor(CHILD$Loneliness_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Neg_thoughts_3monthss.TC.factor = factor(CHILD$Neg_thoughts_3monthss.TC,levels=c("1","2","3","4","5"))
CHILD$Time_watching_TV_3months.TC.factor = factor(CHILD$Time_watching_TV_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Time_social_media_3months.TC.factor = factor(CHILD$Time_social_media_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Time_video_games_3months.TC.factor = factor(CHILD$Time_video_games_3months.TC,levels=c("1","2","3","4","5"))
CHILD$covid_substance_c_1.factor = factor(CHILD$covid_substance_c_1,levels=c("1","2","3","4","5"))
CHILD$Vaping_nicotine_3months.TC.factor = factor(CHILD$Vaping_nicotine_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Cigs_tobacco_3months.TC.factor = factor(CHILD$Cigs_tobacco_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Cannabis_3months.TC.factor = factor(CHILD$Cannabis_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Opiates_heropin_narcs_3months.TC.factor = factor(CHILD$Opiates_heropin_narcs_3months.TC,levels=c("1","2","3","4","5"))
CHILD$MDMA_molly_ecstasy_3months.TCfactor = factor(CHILD$MDMA_molly_ecstasy_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Halluc_3months.TC.factor = factor(CHILD$Halluc_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Other_drugs_3months.TC.factor = factor(CHILD$Other_drugs_3months.TC,levels=c("1","2","3","4","5"))
CHILD$Sleep_meds_seds_hypnot_3months.TC.factor = factor(CHILD$Sleep_meds_seds_hypnot_3months.TC,levels=c("1","2","3","4","5"))
CHILD$covid_emotions_behaviors_3_months_complete.factor = factor(CHILD$covid_emotions_behaviors_3_months_complete,levels=c("0","1","2"))
CHILD$Hours_sleep_2weeks.TC.factor = factor(CHILD$Hours_sleep_2weeks.TC,levels=c("1","2","3","4"))
CHILD$Days_exercise_2weeks.TC.factor = factor(CHILD$Days_exercise_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Days_outdoors_2weeks.TC.factor = factor(CHILD$Days_outdoors_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Worried_2weeks.TC.factor = factor(CHILD$Worried_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Happy_sad_2weeks.TC.factor = factor(CHILD$Happy_sad_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Anhedonia_2weeks.TC.factor = factor(CHILD$Anhedonia_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Relaxed_anxious_2weeks.TC.factor = factor(CHILD$Relaxed_anxious_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Fidgety_restless_2weeks.TC.factor = factor(CHILD$Fidgety_restless_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Fatigued_tired_2weeks.TC.factor = factor(CHILD$Fatigued_tired_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Concentration_2weeks.TC.factor = factor(CHILD$Concentration_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Irritability_2weeks.TC.factor = factor(CHILD$Irritability_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Loneliness_2weeks.TC.factor = factor(CHILD$Loneliness_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Neg_thoughts_2weeks.TC.factor = factor(CHILD$Neg_thoughts_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Time_watching_TV_2weeks.TC.factor = factor(CHILD$Time_watching_TV_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Time_social_media_2weeks.TC.factor = factor(CHILD$Time_social_media_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Time_video_games_2weeks.TC.factor = factor(CHILD$Time_video_games_2weeks.TClevels=c("1","2","3","4","5"))
CHILD$Alcohol_2weeks.TC.factor = factor(CHILD$Alcohol_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Vaping_nicotine_2weeks.TC.factor = factor(CHILD$Vaping_nicotine_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Cigs_tobacco_2weeks.TC.factor = factor(CHILD$Cigs_tobacco_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Cannabis_2weeks.TC.factor = factor(CHILD$Cannabis_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Opiates_heropin_narcs_2weeks.TC.factor = factor(CHILD$Opiates_heropin_narcs_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$MDMA_molly_ecstasy_2weeks.TC.factor = factor(CHILD$MDMA_molly_ecstasy_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Halluc_2weeks.TC.factor = factor(CHILD$Halluc_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Other_drugs_2weeks.TC.factor = factor(CHILD$Other_drugs_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Sleep_meds_seds_hypnot_2weeks.TC.factor = factor(CHILD$Sleep_meds_seds_hypnot_2weeks.TC,levels=c("1","2","3","4","5"))
CHILD$Resource_room.TC.factor = factor(CHILD$Resource_room.TC,levels=c("0","1"))
CHILD$Tutoring.TC.factor = factor(CHILD$Tutoring.TC,levels=c("0","1"))
CHILD$Mentoring_programs.TC.factor = factor(CHILD$Mentoring_programs.TC,levels=c("0","1"))
CHILD$After_school_programs.TC.factor = factor(CHILD$After_school_programs.TC,levels=c("0","1"))
CHILD$Volunteer_programs.TC.factor = factor(CHILD$Volunteer_programs.TC,levels=c("0","1"))
CHILD$Psychotherapy.TC.factor = factor(CHILD$Psychotherapy.TC,levels=c("0","1"))
CHILD$Psychiatric_care.TC.factor = factor(CHILD$Psychiatric_care.TC,levels=c("0","1"))
CHILD$Occup_therapy.TC.factor = factor(CHILD$Occup_therapy.TC,levels=c("0","1"))
CHILD$Phys_therapy.TC.factor = factor(CHILD$Phys_therapy.TC,levels=c("0","1"))
CHILD$peech_therapy.TC.factor = factor(CHILD$peech_therapy.TC,levels=c("0","1"))
CHILD$Sport_activities.TC.factor = factor(CHILD$Sport_activities.TC,levels=c("0","1"))
CHILD$Medical_care.TC.factor = factor(CHILD$Medical_care.TC,levels=c("0","1"))
CHILD$Other_support_specify.TC.factor = factor(CHILD$Other_support_specify.TC,levels=c("0","1"))
CHILD$covid_emotions_behaviors_past_2_weeks_complete.factor = factor(CHILD$covid_emotions_behaviors_past_2_weeks_complete,levels=c("0","1","2"))

#levels(CHILD$redcap_event_name.factor)=c("COVID T1","COVID T2","COVID T3")
levels(CHILD$covid_background_b1.factor)=c("American Indian or Alaska Native","Asian","Black or African American","Native Hawaiian or Other Pacific Islander","White","Bi/Multiracial","Other")
levels(CHILD$covid_background_race.factor)=c("Yes","No")
levels(CHILD$covid_background_gender.factor)=c("Male","Female","Non-binary/ Other gender","Questioning/ Unsure","Prefer to self describe:","Prefer not to say")
levels(CHILD$covid_background_1.factor)=c("Not in school","Elementary school","Junior High or Middle School","High school","College/Vocational")
levels(CHILD$covid_background_2.factor)=c("Large city","Suburbs of a large city","Small city","Town or village","Rural area")
levels(CHILD$covid_background_4___1.factor)=c("Unchecked","Checked")
levels(CHILD$Home_biofather.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_stepmother.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_stepfather.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_adopt_parent.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_sibling.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_other_relat.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_nonrelat.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_roommate.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_sig_other.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_other.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Home_alone.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Physical_health_rating.TC.factor)=c("Excellent","Very Good","Good","Fair","Poor")
levels(CHILD$Seasonal_allergies.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Asthma_lung_problems.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Heart_problems.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Kidney_problems.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Immune_disorder.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Diabetes.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Recent_infection.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Hypertension.TC.factor)=c("Unchecked","Checked")
levels(CHILD$High_cholesterol.TC.factor)=c("Unchecked","Checked")
levels(CHILD$covid_background_health___10.factor)=c("Unchecked","Checked")
levels(CHILD$Arthritis.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Headaches.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Epilepsy_seizures.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Stomach_problems.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Skin_problems.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Psych_problems.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Substance_problems.TC.factor)=c("Unchecked","Checked")
levels(CHILD$TBI.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Serious_accident.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Mental_health_rating.TC.factor)=c("Excellent","Very Good","Good","Fair","Poor")
levels(CHILD$background_complete.factor)=c("Incomplete","Unverified","Complete")
levels(CHILD$Exposed_dx_pos_test.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Exposed_dx_no_test.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Exposed_symptoms_no_test.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Exposed_no.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_dx.TC.factor)=c("Yes, I have/had a positive test","Yes, I have/had a medical diagnosis, but no test","Yes, I have/had some possible symptoms, but no diagnosis by a doctor","No")
levels(CHILD$Covid_child_fever.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_no_fever.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_cough.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_no_cough.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_short_breath.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_no_short_breath.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_sore_throat.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_no_sore_throat.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_fatigue.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_no_fatigue.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_loss_taste_smell.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_no_loss_taste_smell.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_other_symptom.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Covid_child_no_other_symptom.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Mem_household_covid_dx.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Non_mem_household_covid_dx.TC.factor)=c("Unchecked","Checked")
levels(CHILD$No_fam_covid_dx.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Fam_member_ill.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Fam_member_hospitalized.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Fam_member_selfquar_symp.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Fam_member_selfquar_nosymp.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Fam_member_lost_job.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Fam_member_less_money.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Fam_member_pass_away.TC.factor)=c("Unchecked","Checked")
levels(CHILD$No_fam_member_changes.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Worry_self_infected.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Worry_fam_infected.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Self_phys_health_influence.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Self_mental_health_influence.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Read_talk_virus.TC.factor)=c("Never","Rarely","Occasionally","Often","Most of the time")
levels(CHILD$Covid_positive_changes.TC.factor)=c("None","Only a few","Some")
levels(CHILD$covid_exposure_complete.factor)=c("Incomplete","Unverified","Complete")
levels(CHILD$School_building_closed.TC.factor)=c("Yes","No")
levels(CHILD$Classes_in_person.TC.factor)=c("Yes","No")
levels(CHILD$Classes_in_session.TC.factor)=c("Yes","No")
levels(CHILD$Classes_online.TC.factor)=c("Yes","No")
levels(CHILD$Access_to_internet.TC.factor)=c("Yes","No")
levels(CHILD$Assignments.TC.factor)=c("Yes","No")
levels(CHILD$Meals_from_school.TC.factor)=c("Yes","No")
levels(CHILD$Time_going_oustide.TC.factor)=c("Not at all","1-2 days per week","A few days per week","Several days per week","Everyday")
levels(CHILD$Stress_of_restrictions.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Contacts_outside_change.TC.factor)=c("A lot less","A little less","About the same","A little more","A lot more")
levels(CHILD$Diff_following_contact_rules.TC.factor)=c("None","A little","Moderate","A lot","A great amount")
levels(CHILD$Quality_relations_family_change.TC.factor)=c("A lot worse","A little worse","About the same","A little better","A lot better")
levels(CHILD$Stress_relations_family_change.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Quality_relations_friends_change.TC.factor)=c("A lot worse","A little worse","About the same","A little better","A lot better")
levels(CHILD$Stress_relations_friends_change.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Cancelling_events_difficulty.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Family_financial_problems.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Worry_living_stability.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$Worry_no_food.TC.factor)=c("Yes","No")
levels(CHILD$Hope_crisis_end.TC.factor)=c("Not at all","Slightly","Moderately","Very","Extremely")
levels(CHILD$covid_changes_complete.factor)=c("Incomplete","Unverified","Complete")
levels(CHILD$Hours_sleep_3months.TC.factor)=c("less than 6 hours","6-8 hours","8-10 hours","more than 10 hours")
levels(CHILD$Days_exercise_3months.TC.factor)=c("None","1-2 days","3-4 days","5-6 days","Daily")
levels(CHILD$Days_outdoors_3months.TC.factor)=c("None","1-2 days","3-4 days","5-6 days","Daily")
levels(CHILD$Worried_3months.TC.factor)=c("Not worried at all","Slightly worried","Moderately worried","Very worried","Extremely worried")
levels(CHILD$Happy_sad_3months.TC)=c("Very sad/depressed/unhappy","Moderately sad/depressed/unhappy","Neutral","Moderately happy/cheerful","Very happy/cheerful")
levels(CHILD$Anhedonia_3months.TC.factor)=c("Not at all","Slightly","Moderately","Very much","A lot")
levels(CHILD$Relaxed_anxious_3months.TC.factor)=c("Very relaxed/calm","Moderately relaxed/calm","Neutral","Moderately nervous/anxious","Very nervous/anxious")
levels(CHILD$Fidgety_restless_3months.TC.factor)=c("Not fidgety/restless at all","Slightly fidgety/fatigued","Moderately fidgety/restless","Very fidgety/restless","Extremely fidgety/restless")
levels(CHILD$Fatigued_tired_3months.TC.factor)=c("Not fatigued or tired at all","Slightly fatigued or tired","Moderately fatigued or tired","Very fatigued or tired","Extremely fatigued or tired")
levels(CHILD$Concentration_3months.TC.factor)=c("Very focused/attentive","Moderately focused/attentive","Neutral","Moderately unfocused/distracted","Very unfocused/distracted")
levels(CHILD$Irritability_3months.TC.factor)=c("Not irritable or easily angered at all","Slightly irritable or easy angered","Moderately irritable or easily angered","Very irritable or easily angered","Extremely irritable or easily angered")
levels(CHILD$Loneliness_3months.TC.factor)=c("Not lonely at all","Slightly lonely","Moderately lonely","Very lonely","Extremely lonely")
levels(CHILD$Neg_thoughts_3monthss.TC.factor)=c("Not at all","Rarely","Occasionally","Often","A lot of the time")
levels(CHILD$Time_watching_TV_3months.TC.factor)=c("No TV or digital media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$Time_social_media_3months.TC.factor)=c("No social media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$Time_video_games_3months.TC.factor)=c("No video games","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$Alcohol_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Vaping_nicotine_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Cigs_tobacco_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Cannabis_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Opiates_heropin_narcs_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$MDMA_molly_ecstasy_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Halluc_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Other_drugs_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Sleep_meds_seds_hypnot_3months.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$covid_emotions_behaviors_3_months_complete.factor)=c("Incomplete","Unverified","Complete")
levels(CHILD$Hours_sleep_2weeks.TC.factor)=c("less than 6 hours","6-8 hours","8-10 hours","more than 10 hours")
levels(CHILD$Days_exercise_2weeks.TC.factor)=c("None","1-2 days","3-4 days","5-6 days","Daily")
levels(CHILD$Days_outdoors_2weeks.TC.factor)=c("None","1-2 days","3-4 days","5-6 days","Daily")
levels(CHILD$Worried_2weeks.TC.factor)=c("Not worried at all","Slightly worried","Moderately worried","Very worried","Extremely worried")
levels(CHILD$Happy_sad_2weeks.TC.factor)=c("Very sad/depressed/unhappy","Moderately sad/depressed/unhappy","Neutral","Moderately happy/cheerful","Very happy/cheerful")
levels(CHILD$Anhedonia_2weeks.TC.factor)=c("Not at all","Slightly","Moderately","Very much","A lot")
levels(CHILD$Relaxed_anxious_2weeks.TC.factor)=c("Very relaxed/calm","Moderately relaxed/calm","Neutral","Moderately nervous/anxious","Very nervous/anxious")
levels(CHILD$Fidgety_restless_2weeks.TC.factor)=c("Not fidgety/restless at all","Slightly fidgety/fatigued","Moderately fidgety/restless","Very fidgety/restless","Extremely fidgety/restless")
levels(CHILD$Fatigued_tired_2weeks.TC.factor)=c("Not fatigued or tired at all","Slightly fatigued or tired","Moderately fatigued or tired","Very fatigued or tired","Extremely fatigued or tired")
levels(CHILD$Concentration_2weeks.TC.factor)=c("Very focused/attentive","Moderately focused/attentive","Neutral","Moderately unfocused/distracted","Very unfocused/distracted")
levels(CHILD$Irritability_2weeks.TC.factor)=c("Not irritable or easily angered at all","Slightly irritable or easy angered","Moderately irritable or easily angered","Very irritable or easily angered","Extremely irritable or easily angered")
levels(CHILD$Loneliness_2weeks.TC.factor)=c("Not lonely at all","Slightly lonely","Moderately lonely","Very lonely","Extremely lonely")
levels(CHILD$Neg_thoughts_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","A lot of the time")
levels(CHILD$Time_watching_TV_2weeks.TC.factor)=c("No TV or digital media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$Time_social_media_2weeks.TC.factor)=c("No social media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$Time_video_games_2weeks.TC.factor)=c("No social media","Under 1 hour","1-3 hours","4-6 hours","More than 6 hours")
levels(CHILD$Alcohol_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Vaping_nicotine_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Cigs_tobacco_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Cannabis_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Opiates_heropin_narcs_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$MDMA_molly_ecstasy_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Halluc_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Other_drugs_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Sleep_meds_seds_hypnot_2weeks.TC.factor)=c("Not at all","Rarely","Occasionally","Often","Regularly")
levels(CHILD$Resource_room.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Tutoring.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Mentoring_programs.TC.factor)=c("Unchecked","Checked")
levels(CHILD$After_school_programs.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Volunteer_programs.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Psychotherapy.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Psychiatric_care.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Occup_therapy.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Phys_therapy.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Speech_therapy.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Sport_activities.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Medical_care.TC.factor)=c("Unchecked","Checked")
levels(CHILD$Other_support_specify.TC.factor)=c("Unchecked","Checked")
levels(CHILD$covid_emotions_behaviors_past_2_weeks_complete.factor)=c("Incomplete","Unverified","Complete")




##video game section




