# Model definition

model<-function(t,xx,parms){

A1<-xx[1]  # A1 = Autotrophs (subglacial chemoautotrophs)
A2<-xx[2]  # A2 = Autotrophs (soil)
A3<-xx[3]  # A3 = Autotrophs (soil N-fixers)
H1<-xx[4]  # H1 = Heterotrophs (subglacial)
H2<-xx[5]  # H2 = Heterotrophs (soil)
H3<-xx[6]  # H3 = Heterotrophs (soil N-fixers)
S1<-xx[7]  # S1 = Particulate Carbon Substrate - Labile
S2<-xx[8]  # S2 = Particulate Carbon Substrate - Refractory
DIN<-xx[9] # DIN = Dissolved Inrganic Nitrogen
DIP<-xx[10] # DIP = Dissolved Inorganic Phosphorus
PON1<-xx[11] # Particulate Organic Nitrogen - Labile
PON2<-xx[12] # Particulate Organic Nitrogen - Refractory
POP1<-xx[13] # Particulate Organic Phosphorus - Labile
POP2<-xx[14] # Particulate Organic Phosphorus - Refractorycum_A1<-xx[15] # Cumulative A1 growth
cum_A1<-xx[15]
cum_A2<-xx[16]
cum_A3<-xx[17]
cum_H1<-xx[18] # Cumulative H1 growth
cum_H2<-xx[19]
cum_H3<-xx[20]
cum_DIC_A<-xx[21] # Cumulative DIC produced by autos
cum_DIC_H<-xx[22] # Cumulative DIC produced by heteros
cum_DIN<-xx[23] # Cumulative DIN uptake
cum_nf<-xx[24] #  Cumulative N2 fixed
cum_I_Sub<-xx[25] # Cumulative input of substrate (multiplied by v_Sub)
cum_G_X<-xx[26] # Cumulative contribution of deaths and exudates to substrate
cum_G<-xx[27] # Cumulative contribution of deaths
cum_X<-xx[28] # Cumulative contribution of exudates


#-------------------------------

with(as.list(parms),{

#---------------------


Tf=exp(((driver_temp[t+1,(counter+1)]-25)/10)*log(Q_10))

# Deaths

GA1 <-  dor*Tf*alphaA*(A1^2)
GA2 <-  dor*Tf*alphaA*(A2^2)
GA3 <-  dor*Tf*alphaA*(A3^2)
GH1 <-  dor*Tf*alphaH*(H1^2)
GH2 <-  dor*Tf*alphaH*(H2^2)
GH3 <-  dor*Tf*alphaH*(H3^2)


# Sum Deaths

labile_deaths = q*(GA1+GA2+GA3+GH1+GH2+GH3)

refractory_deaths = (1-q)*(GA1+GA2+GA3+GH1+GH2+GH3)

#Physical leaching

WS1 <- g_Sub*S1
WS2 <- g_Sub*S2
WDIN <-g_DIN*DIN
WDIP <-g_DIP*DIP
WPOP1 <-g_Sub*POP1
WPOP2 <-g_Sub*POP2
WPON1 <-g_Sub*PON1
WPON2 <-g_Sub*PON2



# Autotrophic uptake

UA1<-dor*Tf*A1*(ImaxA*p_sub)*(DIN/(DIN+(K_sub*K_N)))*(DIP/(DIP+(K_sub*K_P)))
UA2<-dor*Tf*A2*ImaxA*(driver_light[t+1,(counter+1)]/(driver_light[t+1,(counter+1)]+K_L))*(DIN/(DIN+K_N))*(DIP/(DIP+K_P))

# UA3_N2 is growth of A3 from nitrogen fixation
# UA3_DIN is growth of A3 from soil DIN


Monod_DIN<-(DIN)/(DIN+K_N2)


UA3_N2<-(dor*Tf*A3*n_f*ImaxA*(driver_light[t+1,(counter+1)]/(driver_light[t+1,(counter+1)]+K_L))*(DIP/(DIP+K_P)))*(1-(Monod_DIN))

UA3_DIN<-(dor*Tf*A3*ImaxA*(driver_light[t+1,(counter+1)]/(driver_light[t+1,(counter+1)]+K_L))*(DIN/(DIN+K_N))*(DIP/(DIP+K_P)))*(Monod_DIN)

# UA3 is total growth of UA3

UA3<-UA3_N2+UA3_DIN


# Heterotrophic growth from labile

UH1L<-dor*Tf*H1*(ImaxH*p_sub)*(JS1*(S1/(S1+(K_sub*K_S))))*(DIN/(DIN+(K_sub*K_N)))*(DIP/(DIP+(K_sub*K_P)))
UH2L<-dor*Tf*H2*ImaxH*(JS1*(S1/(S1+K_S)))*(DIN/(DIN+K_N))*(DIP/(DIP+K_P))

UH3L_N2<-(dor*Tf*H3*n_f*ImaxH*(JS1*(S1/(S1+K_S)))*(DIP/(DIP+K_P)))*(1-(Monod_DIN))

UH3L_DIN<-(dor*Tf*H3*ImaxH*(JS1*(S1/(S1+K_S)))*(DIN/(DIN+K_N))*(DIP/(DIP+K_P)))*(Monod_DIN)

UH3L<-UH3L_N2+UH3L_DIN


# Heterotrophic growth from refractory

UH1R<-dor*Tf*H1*(ImaxH*p_sub)*(JS2*(S2/(S2+(K_sub*K_S))))*(DIN/(DIN+(K_sub*K_N)))*(DIP/(DIP+(K_sub*K_P)))
UH2R<-dor*Tf*H2*ImaxH*(JS2*(S2/(S2+K_S)))*(DIN/(DIN+K_N))*(DIP/(DIP+K_P))

UH3R_N2<-(dor*Tf*H3*n_f*ImaxH*(JS2*(S2/(S2+K_S)))*(DIP/(DIP+K_P)))*(1-(Monod_DIN))

UH3R_DIN<-(dor*Tf*H3*ImaxH*(JS2*(S2/(S2+K_S)))*(DIN/(DIN+K_N))*(DIP/(DIP+K_P)))*(Monod_DIN)

UH3R<-UH3R_N2+UH3R_DIN

UH3_N2<-UH3L_N2+UH3R_N2

UH3_DIN<-UH3L_DIN+UH3R_DIN



# Heterotrophic growth total

UH1 <- UH1L + UH1R
UH2 <- UH2L + UH2R
UH3 <- UH3L + UH3R

# Exudates and EPS production

XA1 <- exA*UA1
XA2 <- exA*UA2
XA3 <- exA*UA3
XH1 <- exH*UH1
XH2 <- exH*UH2
XH3 <- exH*UH3

total_X = XA1+XA2+XA3+XH1+XH2+XH3


# Consumption of carbon from substrate pools

ConsumptionS1 <- (1/Y_H)*UH1L + (1/Y_H)*UH2L + (1/(Y_H*n_f))*UH3L_N2 + (1/(Y_H))*UH3L_DIN 

ConsumptionS2 <- (1/Y_H)*UH1R + (1/Y_H)*UH2R + (1/(Y_H*n_f))*UH3R_N2 + (1/(Y_H))*UH3R_DIN 




# PON cycle

PON1_degraded <- (PON1/S1) * ( (1/Y_H)*UH1L + (1/Y_H)*UH2L + (1/(Y_H*n_f))*UH3L_N2 + (1/(Y_H))*UH3L_DIN )
PON2_degraded <- (PON2/S2) * ( (1/Y_H)*UH1R + (1/Y_H)*UH2R + (1/(Y_H*n_f))*UH3R_N2 + (1/(Y_H))*UH3R_DIN )


PON1_accumulation <- NC*(labile_deaths + total_X)
PON2_accumulation <- NC*(refractory_deaths)


# DIN cycle

DIN_Consumed <- NC*(UA1 + UA2 + UA3_DIN + UH1 + UH2 + UH3L_DIN + UH3R_DIN)

DIN_Released <- PON1_degraded + PON2_degraded


# POP cycle

POP1_degraded <- (POP1/S1) *( (1/Y_H)*UH1L + (1/Y_H)*UH2L + (1/(Y_H*n_f))*UH3L_N2 + (1/(Y_H))*UH3L_DIN )

POP2_degraded <- (POP2/S2) *( (1/Y_H)*UH1R + (1/Y_H)*UH2R + (1/(Y_H*n_f))*UH3R_N2 + (1/(Y_H))*UH3R_DIN )



POP1_accumulation <- PC*(labile_deaths + total_X)
POP2_accumulation <- PC*(refractory_deaths)


# DIP cycle


DIP_Consumed <-  PC*(UA1 + UA2 + UA3 + UH1 + UH2 + UH3)

DIP_Released <- POP1_degraded + POP2_degraded							# DIP released from microbial POP degradation


#Balance equations

dA1 <- UA1 - GA1 - XA1
dA2 <- UA2 - GA2 - XA2
dA3 <- UA3 - GA3 - XA3

dH1 <- UH1 - GH1 - XH1
dH2 <- UH2 - GH2 - XH2
dH3 <- UH3 - GH3 - XH3

dS1 <- v_Sub*driver_ICS1[t+1,(counter+1)] + labile_deaths + total_X - ConsumptionS1 - WS1
dS2 <- v_Sub*driver_ICS2[t+1,(counter+1)]+ refractory_deaths - ConsumptionS2 - WS2

dDIN <- v_DIN*driver_IDIN[t+1,(counter+1)] - DIN_Consumed + DIN_Released - WDIN

dPOP1 <- v_Sub*driver_IPOP1[t+1,(counter+1)] + POP1_accumulation - POP1_degraded - WPOP1
dPOP2 <- v_Sub*driver_IPOP2[t+1,(counter+1)] + POP2_accumulation - POP2_degraded - WPOP2


dPON1 <- v_Sub*driver_IPON1[t+1,(counter+1)] + PON1_accumulation - PON1_degraded - WPON1
dPON2 <- v_Sub*driver_IPON2[t+1,(counter+1)] + PON2_accumulation - PON2_degraded - WPON2



dDIP <- v_DIP*driver_IDIP[t+1,(counter+1)] - DIP_Consumed + DIP_Released - WDIP



# Derived variables


dcum_A1 <- UA1
dcum_A2 <- UA2
dcum_A3 <- UA3

dcum_H1 <- UH1
dcum_H2 <- UH2
dcum_H3 <- UH3

dcum_DIC_A <- (1-Y_A)*(1/Y_A)*UA1 + (1-Y_A)*(1/Y_A)*UA2 + (1-(Y_A*n_f))*(1/(Y_A*n_f))*UA3_N2 + (1-(Y_A))*(1/(Y_A))*UA3_DIN

dcum_DIC_H <- (1-Y_H)*(1/Y_H)*UH1 + (1-Y_H)*(1/Y_H)*UH2 + (1-(Y_H*n_f))*(1/(Y_H*n_f))*UH3_N2 + (1-(Y_H))*(1/(Y_H))*UH3_DIN

dcum_DIN <- DIN_Consumed
dcum_nf <- NC*(UA3_N2 + UH3_N2)

dcum_I_Sub <- v_Sub*driver_ICS1[t+1,(counter+1)]+ v_Sub*driver_ICS2[t+1,(counter+1)]

dcum_G_X <- labile_deaths + refractory_deaths + total_X

dcum_G <- labile_deaths + refractory_deaths

dcum_X <-  total_X


list(c(dA1,dA2,dA3,dH1,dH2,dH3,dS1,dS2,dDIN,dDIP,dPON1,dPON2,dPOP1,dPOP2,dcum_A1,dcum_A2,dcum_A3,dcum_H1,dcum_H2,dcum_H3,dcum_DIC_A,dcum_DIC_H,dcum_DIN,dcum_nf,dcum_I_Sub,dcum_G_X,dcum_G, dcum_X))



})
}



#End of model specification


