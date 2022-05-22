# Data Prep
# Creating new variables and dataframes

# Extreme Event Experience Variables
d$EEExposureAll <- ifelse(d$PersonalExpYN == 2, 0, d$EEExposure)  # adding 0's for those who have not experienced extreme events
d$extremeExperienceYN <- ifelse(d$PersonalExpYN == 2, 0, d$PersonalExpYN)  # changing No = 2 to No = 0

# Political Variables
d$biden <- ifelse(d$DemoPresElection == 3, 1, 0)
d$trump <- ifelse(d$DemoPresElection == 2, 1, 0)
d$nonvoter <- ifelse(d$DemoPresElection == 1, 1, 0)
d$thirdparty <- ifelse(d$DemoPresElection == 4, 1, 0)

# Demographic Variables
# Converting demographic variables into categories for regression analysis
d$bipoc <- ifelse(d$DemoRace == "White", 0, 1)

d$age <- NA
d$age <- ifelse(d$DemoAge == 1, (18+24)/2, d$age)
d$age <- ifelse(d$DemoAge == 2, (25+34)/2, d$age)
d$age <- ifelse(d$DemoAge == 3, (35+44)/2, d$age)
d$age <- ifelse(d$DemoAge == 4, (45+54)/2, d$age)
d$age <- ifelse(d$DemoAge == 5, (55+64)/2, d$age)
d$age <- ifelse(d$DemoAge == 6, 70, d$age)
table(d$age)

# Checking to see if non-binary people are more like women or men in climate priority -> similar distribution to females
d %>% group_by(DemoGender,PriorityClimate) %>% mutate(n=n()) %>% 
  group_by(DemoGender) %>% distinct(PriorityClimate,DemoGender,n)%>%
  mutate(Per=n/sum(n), np=paste0(n," (",round(Per*100,2)," %)")) %>%
  dplyr::select(-n,-Per) %>% spread(PriorityClimate,np)
# Setting male as the indicator variable, grouping female and non-binary as comparison group
d$male <- ifelse(d$DemoGender == "Man", 1, 0)
table(d$DemoGender)
table(d$male)

# Checking education categories as they relate to climate priority
d %>% group_by(DemoEdu,PriorityClimate) %>% mutate(n=n()) %>% 
  group_by(DemoEdu) %>% distinct(PriorityClimate,DemoEdu,n)%>%
  mutate(Per=n/sum(n), np=paste0(n," (",round(Per*100,2)," %)")) %>%
  dplyr::select(-n,-Per) %>% spread(PriorityClimate,np)

# Setting education as a binary variable for college degree
d$collegeGrad <- ifelse(d$DemoEdu == "College (2 or 4 year)" | d$DemoEdu == "Graduate degree", 1, 0)

# Converting salary categories to endpoints or means of each income grouping and converting to $1000's of dollars
table(d$DemoSalary)
d$income <- NA
d$income <- ifelse(d$DemoSalary == 1, 10, d$income)
d$income <- ifelse(d$DemoSalary == 2, (10+25)/2, d$income)
d$income <- ifelse(d$DemoSalary == 3, (25+50)/2, d$income)
d$income <- ifelse(d$DemoSalary == 4, (50+75)/2, d$income)
d$income <- ifelse(d$DemoSalary == 5, (75+100)/2, d$income)
d$income <- ifelse(d$DemoSalary == 6, (100+150)/2, d$income)
d$income <- ifelse(d$DemoSalary == 7, (150+200)/2, d$income)
d$income <- ifelse(d$DemoSalary == 8, 200, d$income)
table(d$income)

# Converting climate change belief into binary variables for each category
d$ccHumanCaused <- ifelse(d$CCHumanCaused == 1, 1, 0)
d$ccNatureCaused <- ifelse(d$CCHumanCaused == 2, 1, 0)
d$ccNotHappening <- ifelse(d$CCHumanCaused == 3, 1, 0)


# Cleaning up dataframe
# NOTE: the starts_with("Q") drops quiz scores. Not needed for this study, but something to retain for later
# NOTE: IP address should be taken out earlier before making this public
# NOTE: Taking out RV (values) for now
d %>%
  dplyr::select(-ResponseId, -invalidResponse, -starts_with("Q"), -Status, 
                -Progress, -Finished, -RecordedDate, 
                -DistributionChannel, -UserLanguage, -ConsentForm, -starts_with("RV"), 
                -DemoAge, -DemoGender, -DemoRace, -DemoEdu, -DemoSalary,
                -Score, -opp, -RISN, -rid, gc, -term, -starts_with("Create.New"),
                -StartDate, -EndDate) -> d


#### Removing observations missing variables in the main model ####
# Removes 260 observations leaving 5808 observations for analysis
d %>% 
  filter(!is.na(DemoPresElection)) %>%
  filter(!is.na(EEIntensityAll)) %>%
  filter(!is.na(PriorityClimate)) %>%
  filter(!is.na(PsyDistLocal)) %>%
  filter(!is.na(CCHumanCaused)) %>%
  filter(!is.na(income)) %>%
  filter(!is.na(age)) %>%
  filter(!is.na(bipoc))%>%
  filter(!is.na(collegeGrad)) %>%
  filter(!is.na(male)) -> d
