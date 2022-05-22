* Master File
* The impact of personal experience of extreme climate events on climate change opinionsupport
* Project leads: Rachelle Gould and Trisha Shrum


******************************************
* Import survey data *
******************************************

import delimited "data/extremeData_afterR.csv", case(preserve) clear
gen id = _n

* Destringing variables
destring zip, replace force
destring ccHumanCaused, replace force
destring ccNatureCaused, replace force
destring ccNotHappening, replace force
destring extremeExperienceYN, replace force
destring PriorityClimate, replace force
destring trump, replace force
destring age, replace force
destring collegeGrad, replace force
destring income, replace force
destring bipoc, replace force
destring nonvoter, replace force
destring thirdparty, replace force
destring biden, replace force
destring CCHumanCaused, replace force
destring EEIntensityAll, replace force
destring EEIntensity, replace force
destring PsyDistLocal, replace force


* Variable Lables
lab var extremeExperienceYN "Extreme Weather Impact"
lab var income "Income (1000s USD)"
lab var age "Age"
lab var bipoc "BIPOC"
lab var collegeGrad "College Graduate"
lab var male "Male"
lab var biden "Biden Voter (2020)"
lab var trump "Trump Voter (2020)"
lab var nonvoter "Non-Voter (2020)"

encode state, generate(state_d)


* Save survey data
save extremeSurveyData.dta, replace
