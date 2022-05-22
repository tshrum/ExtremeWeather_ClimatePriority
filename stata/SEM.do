
* Structural Equation Modeling

use extremeSurveyData.dta


* Modeling PsyDistLocal as Mediator


************************************ 
********** Full Sample *************
************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)), nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal  male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)), nocapslatent 
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  


tobit PriorityClimate EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d, ll(1) ul(4) 




************************************ 
********** Human Caused *************
************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if ccHumanCaused == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll_std]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if ccHumanCaused == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  


************************************ 
********** Nature Caused *************
************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if ccNatureCaused == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if ccNatureCaused == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  


************************************ 
********** CC Not Happening *************
************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if ccNotHappening == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if ccNotHappening == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])

* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  


************************************ 
********** Trump Voters *************
************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if trump == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male age income bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male age income bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male age income bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if trump == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  


************************************ 
********** Biden Voters *************
************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if biden == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male age income bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male age income bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male age income bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if biden == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  




*********************************************************************** 
********** Only Those Who Have Experienced Extreme Events *************
********** 			ALL BELIEFS & POLITICAL PREFERENCES   *************
***********************************************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if extremeExperienceYN == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll_std]) / _b[PriorityClimate:_cons]  


* with demographic control variables and state dummies
gsem 	(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if extremeExperienceYN == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  


*********************************************************************** 
********** Only Those Who Have Experienced Extreme Events *************
********** 			Climate Change Human-Caused           *************
***********************************************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if extremeExperienceYN == 1 & ccHumanCaused == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll_std]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if extremeExperienceYN == 1 & ccHumanCaused == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  


*********************************************************************** 
********** Only Those Who Have Experienced Extreme Events *************
********** 			Climate Change NATURE-Caused           *************
***********************************************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if extremeExperienceYN == 1 & ccNatureCaused == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll_std]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if extremeExperienceYN == 1 & ccNatureCaused == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  



*********************************************************************** 
********** Only Those Who Have Experienced Extreme Events *************
********** 			Climate Change NOT HAPPENING          *************
***********************************************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if extremeExperienceYN == 1 & ccNotHappening == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll_std]) / _b[PriorityClimate:_cons]  

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male trump age income nonvoter bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if extremeExperienceYN == 1 & ccNotHappening == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  




*********************************************************************** 
********** Only Those Who Have Experienced Extreme Events *************
********** 					Trump Voters      		      *************
***********************************************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if extremeExperienceYN == 1 & trump == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]   

* with demographic control variables and state dummies
gsem 	(EEIntensityAll male age income bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male age income bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if extremeExperienceYN == 1 & trump == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  


*********************************************************************** 
********** Only Those Who Have Experienced Extreme Events *************
********** 					Biden Voters      		      *************
***********************************************************************
gsem 	(EEIntensityAll -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll -> PsyDistLocal, ) ///
		(PsyDistLocal -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) if extremeExperienceYN == 1 & biden == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect as a percentage of the y-intercept
di (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]   


* with demographic control variables and state dummies
gsem 	(EEIntensityAll male age income bipoc collegeGrad i.state_d-> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity)) ///
		(EEIntensityAll male age income bipoc collegeGrad i.state_d -> PsyDistLocal, ) ///
		(PsyDistLocal male trump age income nonvoter bipoc collegeGrad i.state_d -> PriorityClimate, ///
			family(gaussian, lcensored(1) rcensored(4)) link(identity))  if extremeExperienceYN == 1 & biden == 1, nocapslatent
* Indirect effect
nlcom _b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll]  
* Total Effect
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll])
* Total Effect as a percentage of the y-intercept
nlcom (_b[PriorityClimate:PsyDistLocal]*_b[PsyDistLocal:EEIntensityAll] + _b[PriorityClimate:EEIntensityAll]) / _b[PriorityClimate:_cons]  
