email <- read.csv("http://courses.atlas.illinois.edu/fall2016/STAT/STAT200/RProgramming/data/spamdata.csv")

#glm() generalized machine model 
#fit a logistic regression predicting the probability that an email is spam
fit <- glm(spam ~ ., data=email, family=binomial) 
#spam ~. is a shorthand notation meanring to fit 'spam' using all columns other than than 'spam'

email$predicted <- as.integer(fit$fitted.values > 0.5)
#The values of P(spam) for all the 4601 emails in the data set has been calculated by the glm() function and is stored in the variable fit$fitted.values.

#create an contingency table/pivot table
with(email, table(predicted, spam))