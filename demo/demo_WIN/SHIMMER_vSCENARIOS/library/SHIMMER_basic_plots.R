

par(mfrow=c(3,3))


plot(out_list[[1]]$years,out_list[[1]]$A1,type='l', xlab='years', main='Subglacial Autotrophs', ylab='µg/g')
plot(out_list[[1]]$years,out_list[[1]]$A2,type='l', xlab='years', main='Autotrophs', ylab='µg/g')
plot(out_list[[1]]$years,out_list[[1]]$A3,type='l', xlab='years', main='N-fixing Autotrophs', ylab='µg/g')
plot(out_list[[1]]$years,out_list[[1]]$H1,type='l', xlab='years', main='Subglacial Heterotrophs', ylab='µg/g')
plot(out_list[[1]]$years,out_list[[1]]$H2,type='l', xlab='years', main='Heterotrophs', ylab='µg/g')
plot(out_list[[1]]$years,out_list[[1]]$H3,type='l', xlab='years', main='N-fixing Heterotrophs', ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$S_total,type='l', xlab='years',main='Total Carbon Substrate',ylab='µg/g')
plot(out_list[[1]]$years,out_list[[1]]$S1,type='l', xlab='years', main='Labile Substrate', ylab='µg/g')
plot(out_list[[1]]$years,out_list[[1]]$S2,type='l', xlab='years', main='Refractory Substrate', ylab='µg/g')


x11()
par(mfrow=c(3,3))
plot(out_list[[1]]$years, out_list[[1]]$Cmic_total,type='l', xlab='years',main='Total microbial biomass',ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$PON_total,type='l', xlab='years',main='Total PON',ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$POP_total,type='l', xlab='years',main='Total POP',ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$DIN,type='l', xlab='years',main='DIN',ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$PON1,type='l', xlab='years',main='PON1',ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$PON2,type='l', xlab='years',main='PON2',ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$DIP,type='l', xlab='years',main='DIP',ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$POP1,type='l', xlab='years',main='POP1',ylab='µg/g')
plot(out_list[[1]]$years, out_list[[1]]$POP2,type='l', xlab='years',main='POP2',ylab='µg/g')



x11()
par(mfrow=c(3,1))
plot(out_list[[1]]$years, out_list[[1]]$A_total,type='l', xlab='years',main='Total autotrophic biomass',ylab='µg/g')
points(years_C_aut,mean_C_aut, col="red2")
plot(out_list[[1]]$years, out_list[[1]]$H_total,type='l', xlab='years',main='Total heterotrophic biomass',ylab='µg/g')
points(years_C_het,mean_C_het, col="red2")
plot(out_list[[1]]$years, out_list[[1]]$S_total,type='l', xlab='years',main='Total Substrate',ylab='µg/g')
points(years_CS,mean_CS, col="red2")



x11()
par(mfrow=c(3,1))

plot(out_list[[1]]$years,out_list[[1]]$A_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,202), ylim=c(0,8),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='Total auto biomass',font.main = 1, ylab=expression(paste("µg C g"^"-1")))
points(years_C_aut,mean_C_aut, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,50,100,150,200))
axis(side = 2, las = 1,at=c(0,2,4,6,8))
legend(1,120, c("Model", "Observations"), col=c("black","red2"), cex=0.8,pt.cex=c(1,0.5),bty='n',lwd=c(1,1),lty=c(1,0),pch=c(NA,19))


plot(out_list[[1]]$years,out_list[[1]]$H_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,200), ylim=c(0,4),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='Total hetero biomass',font.main = 1, ylab=expression(paste("µg C g"^"-1")))
points(years_C_het,mean_C_het, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,50,100,150,200))
axis(side = 2, las = 1,at=c(0,2,4))
legend(1,120, c("Model", "Observations"), col=c("black","red2"), cex=0.8,pt.cex=c(1,0.5),bty='n',lwd=c(1,1),lty=c(1,0),pch=c(NA,19))

plot(out_list[[1]]$years,out_list[[1]]$S_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,200), ylim=c(0,4000),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='C Substrate',font.main = 1, ylab=expression(paste("µg C g"^"-1")))
points(years_CS,mean_CS, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,50,100,150,200))
axis(side = 2, las = 1,at=c(0,1000,2000,3000,4000))


