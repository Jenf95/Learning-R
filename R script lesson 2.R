survey <- read.csv("http://courses.las.illinois.edu/stat/stat100/survey/archive/Stat200_2017spring_survey01.csv")
View(survey)
survey <- survey[survey$shoeNums!=0,] #delete the row in shoeNums that the value is 0
cor(survey$shoeNums,survey$shoeSize) #find the correlation coefficient between number of shoes and shoe size

fit <- lm(shoeNums ~ shoeSize, data=survey)
summary(fit)

#stratification
survey_male <- survey[survey$gender=="Male",]
survey_female <- survey[survey$gender=="Female",]
fit_male <- lm(shoeNums ~ shoeSize, data=survey_male)
fit_female <- lm(shoeNums ~ shoeSize, data=survey_female)

plot(shoeNums ~shoeSize, data = survey_male)
abline(fit_male)

#turn female variable into 1 and not female into 0 
survey$gender <- as.integer(servey$gender == 'Female')

#fitting a linear model without an interaction term
fit1 <- lm(shoeNums ~ shoeSize + gender, data=survey)

#fitting a linear model with an interaction term
fit2 <- lm(shoeNums ~ shoeSize*gender, data=survey)

