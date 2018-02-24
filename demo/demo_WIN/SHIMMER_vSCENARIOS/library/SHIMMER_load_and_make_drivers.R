


######### Old input method #################
############################################

# temp_driver <-paste(pathdr,"temp.csv",sep="")
# driverfile3<-read.csv(temp_driver,header=TRUE)
# driver_temp=data.frame(1,1)
# driver_temp[1:(365*nyears),1] = 1:(365*nyears)
# driver_temp[1:(365*nyears),2] = rep(driverfile3[,2], nyears)


###########
###########


# New drivers - NON REPEAT



par_driver <-paste(pathdr,"par.csv",sep="")
driverfile1<-read.csv(par_driver,header=TRUE)
driver_light<-driverfile1


snow_driver <-paste(pathdr,"snow.csv",sep="")
driverfile2<-read.csv(snow_driver,header=TRUE)
driver_snow<-driverfile2

temp_driver <-paste(pathdr,"temp.csv",sep="")
driverfile3<-read.csv(temp_driver,header=TRUE)
driver_temp<-driverfile3




# New drivers - REPEAT


IDIN_driver <-paste(pathdr,"idin.csv",sep="")
driverfile4<-read.csv(IDIN_driver,header=TRUE)
driver_IDIN<-driverfile4
driver_IDIN[1:(365*nyears),1] = 1:(365*nyears)
driver_IDIN[1:(365*nyears),2:(ncol(driver_IDIN))] = rep(driverfile4[,2:(ncol(driver_IDIN))], nyears)

gc()


ICS1_driver <-paste(pathdr,"ics1.csv",sep="")
driverfile5<-read.csv(ICS1_driver,header=TRUE)
driver_ICS1<-driverfile5
driver_ICS1[1:(365*nyears),1] = 1:(365*nyears)
driver_ICS1[1:(365*nyears),2:(ncol(driver_ICS1))] = rep(driverfile5[,2:(ncol(driver_ICS1))], nyears)


gc()


ICS2_driver <-paste(pathdr,"ics2.csv",sep="")
driverfile6<-read.csv(ICS2_driver,header=TRUE)
driver_ICS2<-driverfile6
driver_ICS2[1:(365*nyears),1] = 1:(365*nyears)
driver_ICS2[1:(365*nyears),2:(ncol(driver_ICS2))] = rep(driverfile6[,2:(ncol(driver_ICS2))], nyears)

gc()


IDIP_driver <-paste(pathdr,"idip.csv",sep="")
driverfile7<-read.csv(IDIP_driver,header=TRUE)
driver_IDIP<-driverfile7
driver_IDIP[1:(365*nyears),1] = 1:(365*nyears)
driver_IDIP[1:(365*nyears),2:(ncol(driver_IDIP))] = rep(driverfile7[,2:(ncol(driver_IDIP))], nyears)


gc()

IPON1_driver <-paste(pathdr,"ipon1.csv",sep="")
driverfile8<-read.csv(IPON1_driver,header=TRUE)
driver_IPON1<-driverfile8
driver_IPON1[1:(365*nyears),1] = 1:(365*nyears)
driver_IPON1[1:(365*nyears),2:(ncol(driver_IPON1))] = rep(driverfile8[,2:(ncol(driver_IPON1))], nyears)


gc()

IPON2_driver <-paste(pathdr,"ipon2.csv",sep="")
driverfile9<-read.csv(IPON2_driver,header=TRUE)
driver_IPON2<-driverfile9
driver_IPON2[1:(365*nyears),1] = 1:(365*nyears)
driver_IPON2[1:(365*nyears),2:(ncol(driver_IPON2))] = rep(driverfile9[,2:(ncol(driver_IPON2))], nyears)

gc()


IPOP1_driver <-paste(pathdr,"ipop1.csv",sep="")
driverfile10<-read.csv(IPOP1_driver,header=TRUE)
driver_IPOP1<-driverfile10
driver_IPOP1[1:(365*nyears),1] = 1:(365*nyears)
driver_IPOP1[1:(365*nyears),2:(ncol(driver_IPOP1))] = rep(driverfile10[,2:(ncol(driver_IPOP1))], nyears)


gc()

IPOP2_driver <-paste(pathdr,"ipop2.csv",sep="")
driverfile11<-read.csv(IPOP2_driver,header=TRUE)
driver_IPOP2<-driverfile11
driver_IPOP2[1:(365*nyears),1] = 1:(365*nyears)
driver_IPOP2[1:(365*nyears),2:(ncol(driver_IPOP2))] = rep(driverfile11[,2:(ncol(driver_IPOP2))], nyears)


gc()



################################################################
########### Another way to repeat any of the forcings ##########


# driver_temp[1:(365*nyears),1] = 1:(365*nyears)
# driver_temp[1:(365*nyears),2:(ncol(driver_temp))] = rep(driverfile3[,2:(ncol(driver_temp))], nyears)




