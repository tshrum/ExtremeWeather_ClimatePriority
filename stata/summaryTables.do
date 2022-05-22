* Summary Tables


clear
use extremeSurveyData.dta

* Dropping observations missing variables included in the full analysis

drop if missing(age)
drop if missing(income)
drop if missing(trump)
drop if missing(collegeGrad)
drop if missing(bipoc)
drop if missing(state_d)

est clear

estpost tabstat extremeExperienceYN income age bipoc collegeGrad male biden trump nonvoter, c(stat) stat(mean sd min max n)

esttab using "output/table1.tex", replace ///
 cells("mean(fmt(%13.2fc)) sd(fmt(%13.2fc)) min(fmt(%13.0fc)) max(fmt(%13.0fc)) count(fmt(%13.0fc))") nonumber ///
  nomtitle nonote noobs label booktabs f collabels("Mean" "SD" "Min" "Max" "N")
