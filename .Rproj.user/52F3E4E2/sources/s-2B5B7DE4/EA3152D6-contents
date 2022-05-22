# Master Data Analysis 
# Written by Trisha R. Shrum
# Analyzing data produced by /Users/tshrum/Projects/Gould_Shrum/data/FINAL_Climate_Change_Experience_and_Beliefs_Survey.qsf
# Survey design by Rachelle Gould & Trisha Shrum

# Clearing environment for a clean slate
rm(list = ls()) 

# Loading packages
source('r/load.R')

d <- read_csv('data/extremeData_noID.csv')

# Checking for problems with zip code and dropping mismatched states and zip codes
# This code takes awhile to run, so only rerun if original data changes
# Reduces 6139 observations to 6068 observations. 71 observations were removed for state/zip mismatches.
source('r/locationCheck.R')
#write_csv(d, "data/extremeData_locationChecked.csv")
#d <- read_csv("data/extremeData_locationChecked.csv")

# Creates variables for analysis and removes observations missing key variables
source('r/dataPrep.R')

# Saving data after processing in R
write.csv(d, file = "data/extremeData_afterR.csv")



