# Analyses of psychological outcomes during the COVID pandemic 

The Early Life Stress (ELS) Study follows a community sample of adolescents measuring a host of psychobiological variables. 

The Teen Inflammation Glutamate & Emotional Regulation (TIGER) study follows clinically depressed adolescents at three time points 9 months apart.

This repo contains the code for analysing the data collected during the COVID pandemic and examining the relationship between these and prior measures collected in the ELS and TIGER Study.

The raw data and basic scripts are housed on BOX (accessed reserved to the lab).  

Everyone involved in either study is invited to download the codes for their own analysis, propose changes and add their own scripts.

Further project coordination info can be found by lab members on the google spreadsheet.

## CRISIS Evaluation
The psychological assessments included the CRISIS v0.1 evaluation tool developped by the NIMH.
https://github.com/nimh-mbdu/CRISIS


## STEPS TO CREATE THE PROJECT DIRECTORY

Before cloning the directory on your computer, we suggest that you follow the following step to enable the compatibility of ours scripts. The current scripts are designed to work within a R Project on your local machine.

1) Open RStudio, and create a new R project.

2) In the terminal:
   > cd /path/to/Rproject

3) > git clone https://github.com/gifuni/COVID_ELS.git

   OR
   
   > git clone https://github.com/YourUserName/COVID_ELS.git #Clone your forked repo

4) >mv COVID_ELS Code #Changing the name of the directory

   >mkdir Data
   
   >mkdir Results

5) Download data files from BOX to the .../Rproject/Data directory.

6) The code should now be functional.


Created for the Stanford Neurodevelopmental Affect and Psychopathology Lab.
