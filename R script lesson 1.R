survey <- read.csv("http://courses.las.illinois.edu/stat/stat100/survey/archive/Stat100_200_2016fall_survey02.csv")
summary(survey$gender) #get a summary of data in the gender column
summary(survey$homeTown)
summary(survey$president)
barplot(table(survey$president)) 

median(survey$partyHr)
cor(survey$partyHr,survey$drinks) #calculate the correlation coefficient between the average party hours/week and average drinks/week
plot(drinks ~ partyHr, data=survey)
library(lattice)
xyplot(drinks ~ partyHr | gender, data=survey)
xyplot(drinks ~ partyHr | ethnicity, data=survey)
xyplot(drinks ~ partyHr | ethnicity*gender, data=survey) #for split plots with ethnicity and gender

histogram(~drinks |ethnicity, breaks=-0.5:50.5, data=survey)

fit <- lm(drinks ~ partyHr, data=survey)
#fit a linear model predicting average drinks/week from average party hours/week
fit

plot(drinks ~ partyHr, data=survey)
abline(fit)
#plot the regression line and data together
