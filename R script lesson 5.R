#non-parametric test
stat200 <- read.csv("http://courses.las.illinois.edu/stat/stat100/survey/archive/Stat200_2016fall_survey23_combined.csv")
View(stat200)
wilcox.test(gradeVsLearning ~ greek, data=stat200) 
#to determine if there's any difference in gradevslearning for sorority/frat and non sororrity/fraternity students

stat100 <- read.csv("http://courses.las.illinois.edu/stat/stat100/survey/archive/Stat100_2016fall_survey23_combined.csv")
wilcox.test(stat200$gradeVsLearning, stat100$gradeVsLearning)
#to determine if there's difference between stat100 and stat200 students


kruskal.test(economy ~ ethnicity, data = stat100)
#to determine if theres difference between different ethnic groups

pairwise.wilcox.test(stat100$economy, stat100$ethnicity, p.adjust='bonferroni')
#perform pairwise wilcox test to see which pairs of groups are significantly different, with bonferroni correction

