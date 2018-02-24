
par_driver <-paste(pathdr,"par.csv",sep="")
driverfile1<-read.csv(par_driver,header=TRUE)
driver_light=data.frame(1,1)
driver_light[1:(365*nyears),1] = 1:(365*nyears)
driver_light[1:(365*nyears),2] = rep(driverfile1[,2], nyears)

gc()

snow_driver <-paste(pathdr,"snow.csv",sep="")
driverfile2<-read.csv(snow_driver,header=TRUE)
driver_snow=data.frame(1,1)
driver_snow[1:(365*nyears),1] = 1:(365*nyears)
driver_snow[1:(365*nyears),2] = rep(driverfile2[,2], nyears)

gc()

temp_driver <-paste(pathdr,"temp.csv",sep="")
driverfile3<-read.csv(temp_driver,header=TRUE)
driver_temp=data.frame(1,1)
driver_temp[1:(365*nyears),1] = 1:(365*nyears)
driver_temp[1:(365*nyears),2] = rep(driverfile3[,2], nyears)

gc()

IDIN_driver <-paste(pathdr,"idin.csv",sep="")
driverfile4<-read.csv(IDIN_driver,header=TRUE)
driver_IDIN=data.frame(1,1)
driver_IDIN[1:(365*nyears),1] = 1:(365*nyears)
driver_IDIN[1:(365*nyears),2] = rep(driverfile4[,2], nyears)

gc()

ICS1_driver <-paste(pathdr,"ics1.csv",sep="")
driverfile5<-read.csv(ICS1_driver,header=TRUE)
driver_ICS1=data.frame(1,1)
driver_ICS1[1:(365*nyears),1] = 1:(365*nyears)
driver_ICS1[1:(365*nyears),2] = rep(driverfile5[,2], nyears)

gc()

ICS2_driver <-paste(pathdr,"ics2.csv",sep="")
driverfile6<-read.csv(ICS2_driver,header=TRUE)
driver_ICS2=data.frame(1,1)
driver_ICS2[1:(365*nyears),1] = 1:(365*nyears)
driver_ICS2[1:(365*nyears),2] = rep(driverfile6[,2], nyears)

gc()

IDIP_driver <-paste(pathdr,"idip.csv",sep="")
driverfile7<-read.csv(IDIP_driver,header=TRUE)
driver_IDIP=data.frame(1,1)
driver_IDIP[1:(365*nyears),1] = 1:(365*nyears)
driver_IDIP[1:(365*nyears),2] = rep(driverfile7[,2], nyears)

gc()

IPON1_driver <-paste(pathdr,"ipon1.csv",sep="")
driverfile8<-read.csv(IPON1_driver,header=TRUE)
driver_IPON1=data.frame(1,1)
driver_IPON1[1:(365*nyears),1] = 1:(365*nyears)
driver_IPON1[1:(365*nyears),2] = rep(driverfile8[,2], nyears)

gc()

IPON2_driver <-paste(pathdr,"ipon2.csv",sep="")
driverfile9<-read.csv(IPON2_driver,header=TRUE)
driver_IPON2=data.frame(1,1)
driver_IPON2[1:(365*nyears),1] = 1:(365*nyears)
driver_IPON2[1:(365*nyears),2] = rep(driverfile9[,2], nyears)

gc()

IPOP1_driver <-paste(pathdr,"ipop1.csv",sep="")
driverfile10<-read.csv(IPOP1_driver,header=TRUE)
driver_IPOP1=data.frame(1,1)
driver_IPOP1[1:(365*nyears),1] = 1:(365*nyears)
driver_IPOP1[1:(365*nyears),2] = rep(driverfile10[,2], nyears)

gc()

IPOP2_driver <-paste(pathdr,"ipop2.csv",sep="")
driverfile11<-read.csv(IPOP2_driver,header=TRUE)
driver_IPOP2=data.frame(1,1)
driver_IPOP2[1:(365*nyears),1] = 1:(365*nyears)
driver_IPOP2[1:(365*nyears),2] = rep(driverfile11[,2], nyears)

gc()


