#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 

library(haven) 
library(readr)
anes2016 <- read_dta(file= "input/anes_timeseries_2016_dta.zip")
anes2012 <- read_dta(file= "input/anes_timeseries_2012_dta.zip")

voteval2016 <- read_csv(file= "input/anes_timeseries_2016_voteval_csv.zip")
voteval2012 <- read_csv(file= "input/anes_timeseries_2012_voteval_csv.zip")

#source in any useful functions
source("useful_functions.R")

anes2016$vote <- ifelse(anes2016$V162034==2, "No vote",
                        ifelse(anes2016$V162034a==1, "Clinton",
                               ifelse(anes2016$V162034a==2, "Trump",
                                      ifelse(anes2016$V162034a>2, "Third party", NA))))

table(anes2016$vote, anes2016$V162034a, exclude=NULL)


anes2012$vote<-ifelse(anes2012$rvote2012_x==2, "Not Vote",
                      ifelse(anes2012$presvote2012_x==1, "Obama", 
                             ifelse(anes2012$presvote2012_x==2, "Romney", 
                                    ifelse(anes2012$presvote2012_x==5, "Other", NA))))

table(anes2012$vote, anes2012$presvote2012_x, exclude=NULL)


anes2016$media_att<-ifelse(anes2016$V161009==1, "A great deal", 
                  ifelse(anes2016$V161009==2, "A lot", 
                         ifelse(anes2016$V161009==3, "A moderate amount", 
                                ifelse(anes2016$V161009==4, "A little", 
                                       ifelse(anes2016$V161009==5, "None at all", NA)))))
table(anes2016$media_att)

anes2016$gender <- ifelse(anes2016$V165723==1, "Male", 
                          ifelse(anes2016$V165723==2, "Female",
                                 ifelse(anes2016$V165508==1, "Male", 
                                        ifelse(anes2016$V165508==2, "Female",
                                               NA))))
table(anes2016$gender, anes2016$V165723, anes2016$V165508, exclude=NULL)


anes2016$partyreg<-ifelse(anes2016$V161019==1, "Democratic Party", 
                     ifelse(anes2016$V161019==2, "Republican Party", 
                            ifelse(anes2016$V161019==4, "None or Independent", 
                                   ifelse(anes2016$V161019==5, "Other",
                                          ifelse(anes2016$V162030==1, "Democratic Party", 
                                                 ifelse(anes2016$V162030==2, "Republican Party",
                                                        ifelse(anes2016$V162030==4, "None or Independent", 
                                                               ifelse(anes2016$V162030==5, "Other", NA))))))))  


table(anes2016$pre_partyreg)
table(anes2016$post_partyreg)

anes2016$media_pol<- ifelse(anes2016$V162257==1, "Very closely", 
                            ifelse(anes2016$V162257==2, "Fairly closely", 
                                   ifelse(anes2016$V162257==3, "Not very closely", 
                                          ifelse(anes2016$V162257==4, "Not at all", NA))))
table(anes2016$media_pol)

table(anes2012$sample_state)
anes2012$state<-factor(anes2012$sample_state)



state_codes <- sort(unique(anes2016$V161010d))
anes2016$state <- factor(anes2016$V161010d,
                         levels=state_codes)
                         #labels=c("Alaska","Alabama",...))

anes2012$gender<- ifelse(anes2012$gender_respondent_x==1, "Male", 
                         ifelse(anes2012$gender_respondent_x==2, "Female", NA))

anes2016$age<-ifelse(anes2016$V161267x==1, "Age group 18-20", 
                     ifelse(anes2016$V161267x==2, "Age group 21-24", 
                            ifelse(anes2016$V161267x==3, "Age group 25-29",
                                   ifelse(anes2016$V161267x==4, "Age group 30-34", 
                                          ifelse(anes2016$V161267x==5, "Age group 35-39", 
                                                 ifelse(anes2016$V161267x==6, "Age group 40-44", 
                                                        ifelse(anes2016$V161267x==7, "Age Group 45-49", 
                                                               ifelse(anes2016$V161267x==8, "Age group 50-54", 
                                                                      ifelse(anes2016$V161267x==9, "Age group 55-59", 
                                                                             ifelse(anes2016$V161267x==10, "Age group 60-64",
                                                                                    ifelse(anes2016$V161267x==11, "Age group 65-69", 
                                                                                           ifelse(anes2016$V161267x==12, "Age group 70-74", 
                                                                                                  ifelse(anes2016$V161267x==13, "Age group 75 and older", NA)))))))))))))
table(anes2016$age)


anes2016$socialmedia<-ifelse(anes2016$V161495==0, "None", 
                             ifelse(anes2016$V161495==1, "One day", 
                                    ifelse(anes2016$V161495==2, "Two days", 
                                           ifelse(anes2016$V161495==3, "Three days", 
                                                  ifelse(anes2016$V161495==4, "Four days", 
                                                         ifelse(anes2016$V161495==5,"Five days", 
                                                                ifelse(anes2016$V161495==6, "Six days", 
                                                                       ifelse(anes2016$V161495==7, "Seven days", NA))))))))
table(anes2016$socialmedia)

anes2016$Prescamp_thoughtv<-ifelse(anes2016$V161363a==0, "Not selected", 
                                    ifelse(anes2016$V161363a==1, "Selected", NA))
table(anes2016$Prescamp_thoughtv)
anes2012$age<-ifelse(anes2012$dem_agegrp_iwdate_x==1, "Age group 17-20",
                     ifelse(anes2012$dem_agegrp_iwdate_x==2, "Age group 21-24", 
                            ifelse(anes2012$dem_agegrp_iwdate_x==3, "Age group 25-29", 
                                   ifelse(anes2012$dem_agegrp_iwdate_x==4, "Age group 30-34", 
                                          ifelse(anes2012$dem_agegrp_iwdate_x==5, "Age group 35-39", 
                                                 ifelse(anes2012$dem_agegrp_iwdate_x==6, "Age group 40-44", 
                                                        ifelse(anes2012$dem_agegrp_iwdate_x==7, "Age group 45-49", 
                                                               ifelse(anes2012$dem_agegrp_iwdate_x==8, "Age group 50-54", 
                                                                      ifelse(anes2012$dem_agegrp_iwdate_x==9, "Age group 55-59", 
                                                                             ifelse(anes2012$dem_agegrp_iwdate_x==10, "Age group 60-64", 
                                                                                    ifelse(anes2012$dem_agegrp_iwdate_x==11, "Age group 65-70", 
                                                                                           ifelse(anes2012$dem_agegrp_iwdate_x==12, "Age group 71-74", 
                                                                                                  ifelse(anes2012$dem_agegrp_iwdate_x==13, "Age group 75 and older", NA)))))))))))))
anes2012$media_attTV<- ifelse(anes2012$prmedia_attvnews==1, "A great deal", 
                            ifelse(anes2012$prmedia_attvnews==2, "A lot", 
                                   ifelse(anes2012$prmedia_attvnews==3, "A moderate amount", 
                                          ifelse(anes2012$prmedia_attvnews==4, "A little", 
                                                 ifelse(anes2012$prmedia_attvnews==5, "None at all", NA)))))       


anes2012$party<-ifelse(anes2012$prevote_regpty==1, "Democratic", 
                       ifelse(anes2012$prevote_regpty==2, "Republican", 
                              ifelse(anes2012$prevote_regpty==4, "None or Independent", 
                                     ifelse(anes2012$prevote_regpty==5, "Other", 
                                            ifelse(anes2012$postvote_regpty==1, "Democratic", 
                                                   ifelse(anes2012$postvote_regpty==2, "Republican", 
                                                          ifelse(anes2012$postvote_regpty==3, "None or Independent", 
                                                                 ifelse(anes2012$postvote_regpty==5, "Other", NA))))))))
table(anes2012$party)

anes2012$interest_pol<-ifelse(anes2012$interest_attention==1, "Always", 
                              ifelse(anes2012$interest_attention==2, "Most of the time", 
                                     ifelse(anes2012$interest_attention==3, "About half of the time", 
                                            ifelse(anes2012$interest_attention==4, "Some of the time", 
                                                   ifelse(anes2012$interest_attention==5, "Never", NA)))))

anes2012$media_intINT<-ifelse(anes2012$prmedia_atinews==1, "A great deal", 
                              ifelse(anes2012$prmedia_atinews==2, "A lot", 
                                     ifelse(anes2012$prmedia_atinews==3, "A moderate amount", 
                                            ifelse(anes2012$prmedia_atinews==4, "A little", 
                                                   ifelse(anes2012$prmedia_atinews==5, "None at all", NA)))))

cleaned_data<-subset(anes2016,
                     select=c("vote", "media_att", "gender", 
                              "partyreg", "media_pol", "state", 
                              "age", "socialmedia", "Prescamp_thoughtv"))
