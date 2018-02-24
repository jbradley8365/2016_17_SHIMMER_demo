

par(mfrow=c(3,3))


plot(out$years,out$A1,type='l', xlab='years', main='Subglacial Autotrophs', ylab='µg/g')
plot(out$years,out$A2,type='l', xlab='years', main='Autotrophs', ylab='µg/g')
plot(out$years,out$A3,type='l', xlab='years', main='N-fixing Autotrophs', ylab='µg/g')
plot(out$years,out$H1,type='l', xlab='years', main='Subglacial Heterotrophs', ylab='µg/g')
plot(out$years,out$H2,type='l', xlab='years', main='Heterotrophs', ylab='µg/g')
plot(out$years,out$H3,type='l', xlab='years', main='N-fixing Heterotrophs', ylab='µg/g')
plot(out$years, out$S_total,type='l', xlab='years',main='Total Carbon Substrate',ylab='µg/g')
plot(out$years,out$S1,type='l', xlab='years', main='Labile Substrate', ylab='µg/g')
plot(out$years,out$S2,type='l', xlab='years', main='Refractory Substrate', ylab='µg/g')


x11()
par(mfrow=c(3,3))
plot(out$years, out$Cmic_total,type='l', xlab='years',main='Total microbial biomass',ylab='µg/g')
plot(out$years, out$PON_total,type='l', xlab='years',main='Total PON',ylab='µg/g')
plot(out$years, out$POP_total,type='l', xlab='years',main='Total POP',ylab='µg/g')
plot(out$years, out$DIN,type='l', xlab='years',main='DIN',ylab='µg/g')
plot(out$years, out$PON1,type='l', xlab='years',main='PON1',ylab='µg/g')
plot(out$years, out$PON2,type='l', xlab='years',main='PON2',ylab='µg/g')
plot(out$years, out$DIP,type='l', xlab='years',main='DIP',ylab='µg/g')
plot(out$years, out$POP1,type='l', xlab='years',main='POP1',ylab='µg/g')
plot(out$years, out$POP2,type='l', xlab='years',main='POP2',ylab='µg/g')

x11()
par(mfrow=c(2,3))
#barplot(out2$annual_A1, main="A1 Production",names.arg=out2$year, xlab='Year', ylab='µg/g')
#barplot(out2$annual_A2, main="A2 Production",names.arg=out2$year, xlab='Year', ylab='µg/g')
#barplot(out2$annual_A3, main="A3 Production",names.arg=out2$year, xlab='Year', ylab='µg/g')
barplot(out2$annual_A, main="A Production",names.arg=out2$year, xlab='Year', ylab='µg/g')
barplot(out2$annual_H, main="H Production",names.arg=out2$year, xlab='Year', ylab='µg/g')
barplot(out2$annual_DIC_A, main="DIC Auto",names.arg=out2$year, xlab='Year', ylab='µg/g')
barplot(out2$annual_DIC_H, main="DIC Hetero",names.arg=out2$year, xlab='Year', ylab='µg/g')
barplot(out2$annual_DIN, main="DIN released by hetero",names.arg=out2$year, xlab='Year', ylab='µg/g')
barplot(out2$annual_nf, main="N Fixation",names.arg=out2$year, xlab='Year', ylab='µg/g')




x11()
par(mfrow=c(3,1))
plot(out$years, out$A_total,type='l', xlab='years',main='Total autotrophic biomass',ylab='µg/g')
points(years_C_aut,mean_C_aut, col="red2")
plot(out$years, out$H_total,type='l', xlab='years',main='Total heterotrophic biomass',ylab='µg/g')
points(years_C_het,mean_C_het, col="red2")
plot(out$years, out$S_total,type='l', xlab='years',main='Total Substrate',ylab='µg/g')
points(years_CS,mean_CS, col="red2")



x11()
par(mfrow=c(3,1))

plot(out$years,out$A_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,120), ylim=c(0,8),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='Total auto biomass',font.main = 1, ylab=expression(paste("µg C g"^"-1")))
points(years_C_aut,mean_C_aut, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,30,60,90,120))
axis(side = 2, las = 1,at=c(0,2,4,6,8))
legend(1,120, c("Model", "Observations"), col=c("black","red2"), cex=0.8,pt.cex=c(1,0.5),bty='n',lwd=c(1,1),lty=c(1,0),pch=c(NA,19))


plot(out$years,out$H_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,120), ylim=c(0,4),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='Total hetero biomass',font.main = 1, ylab=expression(paste("µg C g"^"-1")))
points(years_C_het,mean_C_het, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,30,60,90,120))
axis(side = 2, las = 1,at=c(0,2,4))
legend(1,120, c("Model", "Observations"), col=c("black","red2"), cex=0.8,pt.cex=c(1,0.5),bty='n',lwd=c(1,1),lty=c(1,0),pch=c(NA,19))

plot(out$years,out$S_total,axes = FALSE, xlab = NA, ylab = NA, type='l',xlim=c(0,120), ylim=c(0,4000),xaxs = 'i' ,yaxs = 'i')
title(xlab='Years', main='C Substrate',font.main = 1, ylab=expression(paste("µg C g"^"-1")))
points(years_CS,mean_CS, col="red2",pch=19,cex=0.5)
axis(side = 1,at=c(0,30,60,90,120))
axis(side = 2, las = 1,at=c(0,1000,2000,3000,4000))


