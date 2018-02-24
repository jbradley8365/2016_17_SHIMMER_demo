# Load observational testing data

CS_obs<-read.table(paste(pathte,"CS.dat",sep=""),header=FALSE)
C_aut_obs<-read.table(paste(pathte,"C_aut.dat",sep=""),header=FALSE)
C_het_obs<-read.table(paste(pathte,"C_het.dat",sep=""),header=FALSE)



days_CS<-CS_obs[,1]
mean_CS<-CS_obs[,2]
years_CS<-days_CS/365


days_C_aut<-C_aut_obs[,1]
mean_C_aut<-C_aut_obs[,2]
years_C_aut<-days_C_aut/365

days_C_het<-C_het_obs[,1]
mean_C_het<-C_het_obs[,2]
years_C_het<-days_C_het/365




#####################################
#####################################

