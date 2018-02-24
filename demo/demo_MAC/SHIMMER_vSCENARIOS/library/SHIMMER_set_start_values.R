# Set the initial conditions
# Units are micrograms per gram (ug/g)

# State variables:

# A1 = Autotrophs (subglacial chemoautotrophs)
# A2 = Autotrophs (soil)
# A3 = Autotrophs (soil N-fixers)
# H1 = Heterotrophs (subglacial)
# H2 = Heterotrophs (soil)
# H3 = Heterotrophs (soil N-fixers)
# S1 = Particulate Carbon Substrate - Labile
# S2 = Particulate Carbon Substrate - Refractory
# DIN = Dissolved Inrganic Nitrogen
# DIP = Dissolved Inorganic Phosphorus
# PON1 = Particulate Organic Nitrogen - Labile
# PON2 = Particulate Organic Nitrogen - Refractory
# POP1 = Particulate Organic Phosphorus - Labile
# POP2 = Particulate Organic Phosphorus - Refractory



# Derived variables:

# cum_A1<-xx[15] # Cumulative A1 (increase in biomass)
# cum_A2<-xx[16] # Cumulative A2 (increase in biomass)
# cum_A3<-xx[17] # Cumulative A3 (increase in biomass)
# cum_H1<-xx[18] # Cumulative H1 growth
# cum_H2<-xx[19] # Cumulative H2 growth
# cum_H3<-xx[20] # Cumulative H3 growth
# cum_DIC_A<-xx[21] # Cumulative DIC produced by autotrophs
# cum_DIC_H<-xx[22] # Cumulative DIC produced by heterotrophs
# cum_DIN<-xx[23] # Cumulative DIN consumed by everything
# cum_nf<-xx[24] # cum_nf = Cumulative N2 fixed
# cum_I_Sub<-xx[25] # Cumulative input of substrate (multiplied by v_Sub)
# cum_G_X<-xx[26] # Cumulative contribution of deaths and exudates to substrate
# cum_G<-xx[27] # Cumulative contribution of deaths 
# cum_X<-xx[28] # Cumulative contribution of exudates to substrate



start<-c(A1=0.054669541,
         A2=0.026564016,
         A3=0.035547931,
         H1=0.057616059,
         H2=0.052974882,
         H3=0.00250852,
         S1=237.895261,
         S2=555.08894,
         DIN=3.53,
         DIP=2.0779,
         PON1=41.157,
         PON2=96.034,
         POP1=24.227,
         POP2=56.530,
	   cum_A1=0,
	   cum_A2=0,
         cum_A3=0,
	   cum_H1=0,
         cum_H2=0,
	   cum_H3=0,
         cum_DIC_A=0,
	   cum_DIC_H=0,
         cum_DIN=0,
         cum_nf=0,
         cum_I_Sub=0,
         cum_G_X=0,
         cum_G=0,
         cum_X=0
)


#.................................................................................


