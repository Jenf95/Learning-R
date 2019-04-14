survey <- read.csv("http://courses.las.illinois.edu/stat/stat100/survey/archive/Stat100_2016fall_survey02.csv")
View(survey)
survey$AS <- as.integer(survey[[21]]=="respect for their elders") + as.integer(survey[[22]]=="good manners") + as.integer(survey[[23]]=="obedience") + as.integer(survey[[24]]=="well-behaved")

#calculate the average of the authoritarian score for the supporters of each presidential candidate
tapply(survey$AS, survey$president, mean)

#perform an F test on sigficance of the difference between different presidents
summary(aov(AS ~ president, data=survey))

#returns a p-value table for two-sided pair-wise t-test without any correction
pairwise.t.test(survey$AS, survey$president, p.adjust="none")

# Create subset condition to filter out Donald Trump supporters
subset <- survey$president != "Donald Trump" 
# Perform pairwise t-tests with Bonferroni correction on the subset of data
pairwise.t.test(survey$AS[subset], survey$president[subset], p.adjust="bonferroni")