

# Driver code

# COPY THIS INTO R-CONSOLE WINDOW TO EXECUTE


install.packages("deSolve", lib="/Users/jamesbradley/Documents/RFolder/New_Packages")
library("deSolve", lib="/Users/jamesbradley/Documents/RFolder/New_Packages")



#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

#Enter the paths to the source file library, driving data file, observed data, and an output folder ....


##### NOTE: Change the following two paths if you change the model name e.g. .../SHIMMER_vSCENARIOS_1.1/...

# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

path    <-"/Users/jamesbradley/Documents/RFolder/model/demo/demo_MAC/SHIMMER/library/"
path_root <-"/Users/jamesbradley/Documents/RFolder/model/demo/demo_MAC/SHIMMER/"

# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


pathdr  <-"/Users/jamesbradley/Documents/RFolder/model/demo/demo_MAC/input_data_Svalbard/"

pathte  <-"/Users/jamesbradley/Documents/RFolder/model/demo/demo_MAC/observations/"


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



# Load observational data

source(paste(path,"SHIMMER_load_observational_data.R",sep=""))


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


#Number of years to run

nyears<-20


ndays<-nyears*365+1                # Number of days in the run sequence
times<-seq(0,nyears*365,by=1)      # Times at which we want the model to output data

#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''




source(paste(path,"SHIMMER_NEW_load_and_make_drivers.R",sep=""))

#source(paste(path,"SHIMMER_NEW_plot_drivers.R",sep=""))


source(paste(path,"SHIMMER_set_start_values.R",sep=""))



out_list = list()
out2_list = list()
out3_list = list()
out4_list = list()
out_sample_list = list()
out_array_list = list()


source(paste(path,"SHIMMER_set_parameter_values.R",sep=""))

source(paste(path,"SHIMMER_NEW_model_definition.R",sep=""))


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

#Solve the equations over the interval given by (times)


out<-as.data.frame(lsoda(start,times,model,parms))


#Post processing to get rates of change

out$years<-out$time/365

source(paste(path,"SHIMMER_compute_totals.R",sep=""))

source(paste(path,"SHIMMER_construct_array.R",sep=""))


#Plotting



quartz()
par(mfrow=c(3,3))
plot(out$years,out$A1,type='l', xlab='years', main='Subglacial Autotrophs', ylab='�g/g')
plot(out$years,out$A2,type='l', xlab='years', main='Autotrophs', ylab='�g/g')
plot(out$years,out$A3,type='l', xlab='years', main='N-fixing Autotrophs', ylab='�g/g')
plot(out$years,out$H1,type='l', xlab='years', main='Subglacial Heterotrophs', ylab='�g/g')
plot(out$years,out$H2,type='l', xlab='years', main='Heterotrophs', ylab='�g/g')
plot(out$years,out$H3,type='l', xlab='years', main='N-fixing Heterotrophs', ylab='�g/g')
plot(out$years, out$S_total,type='l', xlab='years',main='Total Carbon Substrate',ylab='�g/g')
plot(out$years,out$S1,type='l', xlab='years', main='Labile Substrate', ylab='�g/g')
plot(out$years,out$S2,type='l', xlab='years', main='Refractory Substrate', ylab='�g/g')


quartz()
par(mfrow=c(3,3))
plot(out$years, out$Cmic_total,type='l', xlab='years',main='Total microbial biomass',ylab='�g/g')
plot(out$years, out$PON_total,type='l', xlab='years',main='Total PON',ylab='�g/g')
plot(out$years, out$POP_total,type='l', xlab='years',main='Total POP',ylab='�g/g')
plot(out$years, out$DIN,type='l', xlab='years',main='DIN',ylab='�g/g')
plot(out$years, out$PON1,type='l', xlab='years',main='PON1',ylab='�g/g')
plot(out$years, out$PON2,type='l', xlab='years',main='PON2',ylab='�g/g')
plot(out$years, out$DIP,type='l', xlab='years',main='DIP',ylab='�g/g')
plot(out$years, out$POP1,type='l', xlab='years',main='POP1',ylab='�g/g')
plot(out$years, out$POP2,type='l', xlab='years',main='POP2',ylab='�g/g')



quartz()
par(mfrow=c(3,1))
plot(out$years, out$A_total,type='l', xlab='years',main='Total autotrophic biomass',ylab='�g/g')
points(years_C_aut,mean_C_aut, col="red2")
plot(out$years, out$H_total,type='l', xlab='years',main='Total heterotrophic biomass',ylab='�g/g')
points(years_C_het,mean_C_het, col="red2")
plot(out$years, out$S_total,type='l', xlab='years',main='Total Substrate',ylab='�g/g')
points(years_CS,mean_CS, col="red2")



quartz()
par(mfrow=c(3,1))

plot(out$years,out$A_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,120), ylim=c(0,8),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='Total auto biomass',font.main = 1, ylab=expression(paste("�g C g"^"-1")))
points(years_C_aut,mean_C_aut, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,30,60,90,120))
axis(side = 2, las = 1,at=c(0,2,4,6,8))
legend(1,120, c("Model", "Observations"), col=c("black","red2"), cex=0.8,pt.cex=c(1,0.5),bty='n',lwd=c(1,1),lty=c(1,0),pch=c(NA,19))


plot(out$years,out$H_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,120), ylim=c(0,4),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='Total hetero biomass',font.main = 1, ylab=expression(paste("�g C g"^"-1")))
points(years_C_het,mean_C_het, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,30,60,90,120))
axis(side = 2, las = 1,at=c(0,2,4))
legend(1,120, c("Model", "Observations"), col=c("black","red2"), cex=0.8,pt.cex=c(1,0.5),bty='n',lwd=c(1,1),lty=c(1,0),pch=c(NA,19))

plot(out$years,out$S_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,120), ylim=c(0,4000),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='C Substrate',font.main = 1, ylab=expression(paste("�g C g"^"-1")))
points(years_CS,mean_CS, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,30,60,90,120))
axis(side = 2, las = 1,at=c(0,1000,2000,3000,4000))





# look at output

# out[1660,]
# out[18085,]
# out[41080,]


#write.table(out,file=paste("out","nominal.csv",sep="_"),sep=",",row.names=FALSE)

#write.table(out2,file=paste("out2","nominal.csv",sep="_"),sep=",",row.names=FALSE)

#write.table(out_sample,file=paste("outsample","nominal.csv",sep="_"),sep=",",row.names=FALSE)


