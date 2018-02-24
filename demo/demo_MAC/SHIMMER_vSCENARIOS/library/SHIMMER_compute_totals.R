
# Totals from state-variables

out$A_total<-out$A1+out$A2+out$A3
out$H_total<-out$H1+out$H2+out$H3
out$S_total<-out$S1+out$S2
out$Cmic_total<- out$A_total + out$H_total
out$PON_total<-out$PON1+out$PON2
out$POP_total<-out$POP1+out$POP2

# Totals from derived-variables

out$cum_A = out$cum_A1 + out$cum_A2 + out$cum_A3
out$cum_H = out$cum_H1 + out$cum_H2 + out$cum_H3
out$cum_BP = out$cum_A + out$cum_H
out$cum_DIC = out$cum_DIC_A + out$cum_DIC_H

# Derive the rates from the cumulative variables

out$rate_A1[2:(nrow(out))]<-out$cum_A1[2:(nrow(out))] - out$cum_A1[1:(nrow(out)-1)]
out$rate_A1[1]=0
out$rate_A2[2:(nrow(out))]<-out$cum_A2[2:(nrow(out))] - out$cum_A2[1:(nrow(out)-1)]
out$rate_A2[1]=0
out$rate_A3[2:(nrow(out))]<-out$cum_A3[2:(nrow(out))] - out$cum_A3[1:(nrow(out)-1)]
out$rate_A3[1]=0

out$rate_H1[2:(nrow(out))]<-out$cum_H1[2:(nrow(out))] - out$cum_H1[1:(nrow(out)-1)]
out$rate_H1[1]=0
out$rate_H2[2:(nrow(out))]<-out$cum_H2[2:(nrow(out))] - out$cum_H2[1:(nrow(out)-1)]
out$rate_H2[1]=0
out$rate_H3[2:(nrow(out))]<-out$cum_H3[2:(nrow(out))] - out$cum_H3[1:(nrow(out)-1)]
out$rate_H3[1]=0

out$rate_DIC_A[2:(nrow(out))]<-out$cum_DIC_A[2:(nrow(out))] - out$cum_DIC_A[1:(nrow(out)-1)]
out$rate_DIC_A[1]=0
out$rate_DIC_H[2:(nrow(out))]<-out$cum_DIC_H[2:(nrow(out))] - out$cum_DIC_H[1:(nrow(out)-1)]
out$rate_DIC_H[1]=0

out$rate_DIN[2:(nrow(out))]<-out$cum_DIN[2:(nrow(out))] - out$cum_DIN[1:(nrow(out)-1)]
out$rate_DIN[1]=0
out$rate_nf[2:(nrow(out))]<-out$cum_nf[2:(nrow(out))] - out$cum_nf[1:(nrow(out)-1)]
out$rate_nf[1]=0

out$rate_A[2:(nrow(out))]<-out$cum_A[2:(nrow(out))] - out$cum_A[1:(nrow(out)-1)]
out$rate_A[1]=0
out$rate_H[2:(nrow(out))]<-out$cum_H[2:(nrow(out))] - out$cum_H[1:(nrow(out)-1)]
out$rate_H[1]=0
out$rate_BP[2:(nrow(out))]<-out$cum_BP[2:(nrow(out))] - out$cum_BP[1:(nrow(out)-1)]
out$rate_BP[1]=0
out$rate_DIC[2:(nrow(out))]<-out$cum_DIC[2:(nrow(out))] - out$cum_DIC[1:(nrow(out)-1)]
out$rate_DIC[1]=0


out$rate_I_Sub[2:(nrow(out))]<-out$cum_I_Sub[2:(nrow(out))] - out$cum_I_Sub[1:(nrow(out)-1)]
out$rate_I_Sub[1]=0


out$rate_G_X[2:(nrow(out))]<-out$cum_G_X[2:(nrow(out))] - out$cum_G_X[1:(nrow(out)-1)]
out$rate_G_X[1]=0



out$rate_G[2:(nrow(out))]<-out$cum_G[2:(nrow(out))] - out$cum_G[1:(nrow(out)-1)]
out$rate_G[1]=0


out$rate_X[2:(nrow(out))]<-out$cum_X[2:(nrow(out))] - out$cum_X[1:(nrow(out)-1)]
out$rate_X[1]=0



# Note that I previously did this by differentiating, which also works
# rate_pp<-c(0,diff(out$cum_pp))
# out$rate_pp <- rate_pp
# DIFF_T_S_Input<-c(0,diff(out$T_S_Input))
# out$DIFF_T_S_Input <- DIFF_T_S_Input
# DIFF_T_DIN_Fixed<-c(0,diff(out$T_DIN_Fixed))
# out$DIFF_T_DIN_Fixed <- DIFF_T_DIN_Fixed


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


# out2 = dataset of all years production values 

year<-c(1:nyears)

annual_A1<-c(1:nyears)
annual_A2<-c(1:nyears)
annual_A3<-c(1:nyears)

annual_H1<-c(1:nyears)
annual_H2<-c(1:nyears)
annual_H3<-c(1:nyears)

annual_DIC_A<-c(1:nyears)
annual_DIC_H<-c(1:nyears)

annual_DIN<-c(1:nyears)
annual_nf<-c(1:nyears)

annual_A<-c(1:nyears)
annual_H<-c(1:nyears)
annual_BP<-c(1:nyears)
annual_DIC<-c(1:nyears)

annual_I_Sub<-c(1:nyears)

annual_G_X<-c(1:nyears)

annual_G<-c(1:nyears)

annual_X<-c(1:nyears)

annual_dS1<-c(1:nyears)

annual_dS2<-c(1:nyears)



for(i in 1:nyears) {

annual_A1[i]<-out$cum_A1[i*365+1]-out$cum_A1[(i-1)*365+1]
annual_A2[i]<-out$cum_A2[i*365+1]-out$cum_A2[(i-1)*365+1]
annual_A3[i]<-out$cum_A3[i*365+1]-out$cum_A3[(i-1)*365+1]

annual_H1[i]<-out$cum_H1[i*365+1]-out$cum_H1[(i-1)*365+1]
annual_H2[i]<-out$cum_H2[i*365+1]-out$cum_H2[(i-1)*365+1]
annual_H3[i]<-out$cum_H3[i*365+1]-out$cum_H3[(i-1)*365+1]

annual_DIC_A[i]<-out$cum_DIC_A[i*365+1]-out$cum_DIC_A[(i-1)*365+1]
annual_DIC_H[i]<-out$cum_DIC_H[i*365+1]-out$cum_DIC_H[(i-1)*365+1]

annual_DIN[i]<-out$cum_DIN[i*365+1]-out$cum_DIN[(i-1)*365+1]
annual_nf[i]<-out$cum_nf[i*365+1]-out$cum_nf[(i-1)*365+1]

annual_A[i]<-out$cum_A[i*365+1]-out$cum_A[(i-1)*365+1]
annual_H[i]<-out$cum_H[i*365+1]-out$cum_H[(i-1)*365+1]
annual_BP[i]<-out$cum_BP[i*365+1]-out$cum_BP[(i-1)*365+1]
annual_DIC[i]<-out$cum_DIC[i*365+1]-out$cum_DIC[(i-1)*365+1]

annual_I_Sub[i]<-out$cum_I_Sub[i*365+1]-out$cum_I_Sub[(i-1)*365+1]

annual_G_X[i]<-out$cum_G_X[i*365+1]-out$cum_G_X[(i-1)*365+1]

annual_G[i]<-out$cum_G[i*365+1]-out$cum_G[(i-1)*365+1]
annual_X[i]<-out$cum_X[i*365+1]-out$cum_X[(i-1)*365+1]

annual_dS1[i]<-out$S1[i*365+1]-out$S1[(i-1)*365+1]

annual_dS2[i]<-out$S2[i*365+1]-out$S2[(i-1)*365+1]

}

out2<-data.frame(year,annual_A1,annual_A2,annual_A3,annual_H1,annual_H2,annual_H3,annual_DIC_A,annual_DIC_H,annual_DIN,annual_nf,annual_A,annual_H,annual_BP,annual_DIC,annual_I_Sub,annual_G_X,annual_G,annual_X,annual_dS1, annual_dS2)

out2$annual_net_DIC_efflux=out2$annual_DIC_H-out2$annual_A

out2$annual_dS=out2$annual_dS1+out2$annual_dS2


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

# out3 = dataset of end year sample values, or the sample date values

sampledate<-(nyears-1)*365+243

endtime<-c(1)
endA1<-c(1)
endA2<-c(1)
endA3<-c(1)
endH1<-c(1)
endH2<-c(1)
endH3<-c(1)
endS1<-c(1)
endS2<-c(1)
endDIN<-c(1)
endDIP<-c(1)
endPON1<-c(1)
endPON2<-c(1)
endPOP1<-c(1)
endPOP2<-c(1)
endA_total<-c(1)
endH_total<-c(1)
endS_total<-c(1)
endCmic_total<-c(1)
endPON_total<-c(1)
endPOP_total<-c(1)
endyears<-c(1)


endtime[1]<-out$time[sampledate]
endA1[1]<-out$A1[sampledate]
endA2[1]<-out$A2[sampledate]
endA3[1]<-out$A3[sampledate]
endH1[1]<-out$H1[sampledate]
endH2[1]<-out$H2[sampledate]
endH3[1]<-out$H3[sampledate]
endS1[1]<-out$S1[sampledate]
endS2[1]<-out$S2[sampledate]
endDIN[1]<-out$DIN[sampledate]
endDIP[1]<-out$DIP[sampledate]
endPON1[1]<-out$PON1[sampledate]
endPON2[1]<-out$PON2[sampledate]
endPOP1[1]<-out$POP1[sampledate]
endPOP2[1]<-out$POP2[sampledate]
endA_total[1]<-out$A_total[sampledate]
endH_total[1]<-out$H_total[sampledate]
endS_total[1]<-out$S_total[sampledate]
endCmic_total[1]<-out$Cmic_total[sampledate]
endPON_total[1]<-out$PON_total[sampledate]
endPOP_total[1]<-out$POP_total[sampledate]
endyears[1]<-out$years[sampledate]


out3<-data.frame(endtime, endA1, endA2, endA3, endH1, endH2, endH3, endS1, endS2, endDIN, endDIP, endPON1, endPON2, endPOP1, endPOP2, endA_total, endH_total, endS_total, endCmic_total, endPON_total, endPOP_total, endyears)




#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


# out4 = dataset of final years' production values, and min and max values

# Final year values

sp<-(nyears-1)*365+1
ep<-nrow(out)

final_annual_A1<-out$cum_A1[ep]-out$cum_A1[sp]
final_annual_A2<-out$cum_A2[ep]-out$cum_A2[sp]
final_annual_A3<-out$cum_A3[ep]-out$cum_A3[sp]

final_annual_H1<-out$cum_H1[ep]-out$cum_H1[sp]
final_annual_H2<-out$cum_H2[ep]-out$cum_H2[sp]
final_annual_H3<-out$cum_H3[ep]-out$cum_H3[sp]


final_annual_DIC_A<-out$cum_DIC_A[ep]-out$cum_DIC_A[sp]
final_annual_DIC_H<-out$cum_DIC_H[ep]-out$cum_DIC_H[sp]

final_annual_DIN<-out$cum_DIN[ep]-out$cum_DIN[sp]
final_annual_nf<-out$cum_nf[ep]-out$cum_nf[sp]

final_annual_A<-out$cum_A[ep]-out$cum_A[sp]
final_annual_H<-out$cum_H[ep]-out$cum_H[sp]
final_annual_BP<-out$cum_BP[ep]-out$cum_BP[sp]
final_annual_DIC<-out$cum_DIC[ep]-out$cum_DIC[sp]



final_year <- out[sp:ep,]



A1_min<-min(final_year$A1, na.rm=TRUE)
A1_max<-max(final_year$A1, na.rm=TRUE)
A1_var<-A1_max-A1_min
A2_min<-min(final_year$A2, na.rm=TRUE)
A2_max<-max(final_year$A2, na.rm=TRUE)
A2_var<-A2_max-A2_min
A3_min<-min(final_year$A3, na.rm=TRUE)
A3_max<-max(final_year$A3, na.rm=TRUE)
A3_var<-A3_max-A3_min
H1_min<-min(final_year$H1, na.rm=TRUE)
H1_max<-max(final_year$H1, na.rm=TRUE)
H1_var<-H1_max-H1_min
H2_min<-min(final_year$H2, na.rm=TRUE)
H2_max<-max(final_year$H2, na.rm=TRUE)
H2_var<-H2_max-H2_min
H3_min<-min(final_year$H3, na.rm=TRUE)
H3_max<-max(final_year$H3, na.rm=TRUE)
H3_var<-H3_max-H3_min
S1_min<-min(final_year$S1, na.rm=TRUE)
S1_max<-max(final_year$S1, na.rm=TRUE)
S1_var<-S1_max-S1_min
S2_min<-min(final_year$S2, na.rm=TRUE)
S2_max<-max(final_year$S2, na.rm=TRUE)
S2_var<-S2_max-S2_min
DIN_min<-min(final_year$DIN, na.rm=TRUE)
DIN_max<-max(final_year$DIN, na.rm=TRUE)
DIN_var<-DIN_max-DIN_min
DIP_min<-min(final_year$DIP, na.rm=TRUE)
DIP_max<-max(final_year$DIP, na.rm=TRUE)
DIP_var<-DIP_max-DIP_min
PON1_min<-min(final_year$PON1, na.rm=TRUE)
PON1_max<-max(final_year$PON1, na.rm=TRUE)
PON1_var<-PON1_max-PON1_min
PON2_min<-min(final_year$PON2, na.rm=TRUE)
PON2_max<-max(final_year$PON2, na.rm=TRUE)
PON2_var<-PON2_max-PON2_min
POP1_min<-min(final_year$POP1, na.rm=TRUE)
POP1_max<-max(final_year$POP1, na.rm=TRUE)
POP1_var<-POP1_max-POP1_min
POP2_min<-min(final_year$POP2, na.rm=TRUE)
POP2_max<-max(final_year$POP2, na.rm=TRUE)
POP2_var<-POP2_max-POP2_min
A_total_min<-min(final_year$A_total, na.rm=TRUE)
A_total_max<-max(final_year$A_total, na.rm=TRUE)
A_total_var<-A_total_max-A_total_min
H_total_min<-min(final_year$H_total, na.rm=TRUE)
H_total_max<-max(final_year$H_total, na.rm=TRUE)
H_total_var<-H_total_max-H_total_min
S_total_min<-min(final_year$S_total, na.rm=TRUE)
S_total_max<-max(final_year$S_total, na.rm=TRUE)
S_total_var<-S_total_max-S_total_min
Cmic_total_min<-min(final_year$Cmic_total, na.rm=TRUE)
Cmic_total_max<-max(final_year$Cmic_total, na.rm=TRUE)
Cmic_total_var<-Cmic_total_max-Cmic_total_min
PON_total_min<-min(final_year$PON_total, na.rm=TRUE)
PON_total_max<-max(final_year$PON_total, na.rm=TRUE)
PON_total_var<-PON_total_max-PON_total_min
POP_total_min<-min(final_year$POP_total, na.rm=TRUE)
POP_total_max<-max(final_year$POP_total, na.rm=TRUE)
POP_total_var<-POP_total_max-POP_total_min



out4<-data.frame(nyears,final_annual_A1,final_annual_A2,final_annual_A3,final_annual_H1,final_annual_H2,
final_annual_H3,final_annual_DIC_A,final_annual_DIC_H,final_annual_DIN,final_annual_nf,final_annual_A,final_annual_H,
final_annual_BP,final_annual_DIC,A1_min,A1_max,A2_min,A2_max,A3_min,A3_max,H1_min,H1_max,H2_min,H2_max,H3_min,H3_max,
S1_min,S1_max,S2_min,S2_max,DIN_min,DIN_max,DIP_min,DIP_max,PON1_min,PON1_max,PON2_min,PON2_max,POP1_min,POP1_max,
POP2_min,POP2_max,A_total_min,A_total_max,H_total_min,H_total_max,S_total_min,S_total_max,Cmic_total_min,Cmic_total_max,
PON_total_min,PON_total_max,POP_total_min,POP_total_max,
A1_var,A2_var,A3_var,H1_var,H2_var,H3_var,S1_var,S2_var,DIN_var,DIP_var,PON1_var,PON2_var,POP1_var,POP2_var,
A_total_var,H_total_var,S_total_var,Cmic_total_var,PON_total_var,POP_total_var)




#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


# out_sample = sampling from day 244 of the model

year_sample<-c(1:nyears)

time_sample<-c(1:nyears)
A1_sample<-c(1:nyears)
A2_sample<-c(1:nyears)
A3_sample<-c(1:nyears)
H1_sample<-c(1:nyears)
H2_sample<-c(1:nyears)
H3_sample<-c(1:nyears)
S1_sample<-c(1:nyears)
S2_sample<-c(1:nyears)
DIN_sample<-c(1:nyears)
DIP_sample<-c(1:nyears)
PON1_sample<-c(1:nyears)
PON2_sample<-c(1:nyears)
POP1_sample<-c(1:nyears)
POP2_sample<-c(1:nyears)
years_sample<-c(1:nyears)
A_total_sample<-c(1:nyears)
H_total_sample<-c(1:nyears)
S_total_sample<-c(1:nyears)
Cmic_total_sample<-c(1:nyears)
PON_total_sample<-c(1:nyears)
POP_total_sample<-c(1:nyears)

cum_A1_sample<-c(1:nyears)
cum_A2_sample<-c(1:nyears)
cum_A3_sample<-c(1:nyears)
cum_H1_sample<-c(1:nyears)
cum_H2_sample<-c(1:nyears)
cum_H3_sample<-c(1:nyears)
cum_DIC_A_sample<-c(1:nyears)
cum_DIC_H_sample<-c(1:nyears)
cum_DIN_sample<-c(1:nyears)
cum_nf_sample<-c(1:nyears)
cum_A_sample<-c(1:nyears)
cum_H_sample<-c(1:nyears)
cum_BP_sample<-c(1:nyears)
cum_DIC_sample<-c(1:nyears)





for(i in 1:nyears) {




time_sample[i]<-out$time[(i-1)*365+243]
A1_sample[i]<-out$A1[(i-1)*365+243]
A2_sample[i]<-out$A2[(i-1)*365+243]
A3_sample[i]<-out$A3[(i-1)*365+243]
H1_sample[i]<-out$H1[(i-1)*365+243]
H2_sample[i]<-out$H2[(i-1)*365+243]
H3_sample[i]<-out$H3[(i-1)*365+243]
S1_sample[i]<-out$S1[(i-1)*365+243]
S2_sample[i]<-out$S2[(i-1)*365+243]
DIN_sample[i]<-out$DIN[(i-1)*365+243]
DIP_sample[i]<-out$DIP[(i-1)*365+243]
PON1_sample[i]<-out$PON1[(i-1)*365+243]
PON2_sample[i]<-out$PON2[(i-1)*365+243]
POP1_sample[i]<-out$POP1[(i-1)*365+243]
POP2_sample[i]<-out$POP2[(i-1)*365+243]
years_sample[i]<-out$years[(i-1)*365+243]
A_total_sample[i]<-out$A_total[(i-1)*365+243]
H_total_sample[i]<-out$H_total[(i-1)*365+243]
S_total_sample[i]<-out$S_total[(i-1)*365+243]
Cmic_total_sample[i]<-out$Cmic_total[(i-1)*365+243]
PON_total_sample[i]<-out$PON_total[(i-1)*365+243]
POP_total_sample[i]<-out$POP_total[(i-1)*365+243]

cum_A1_sample[i]<-out$cum_A1[(i-1)*365+243]
cum_A2_sample[i]<-out$cum_A2[(i-1)*365+243]
cum_A3_sample[i]<-out$cum_A3[(i-1)*365+243]
cum_H1_sample[i]<-out$cum_H1[(i-1)*365+243]
cum_H2_sample[i]<-out$cum_H2[(i-1)*365+243]
cum_H3_sample[i]<-out$cum_H3[(i-1)*365+243]
cum_DIC_A_sample[i]<-out$cum_DIC[(i-1)*365+243]
cum_DIC_H_sample[i]<-out$cum_DIC[(i-1)*365+243]
cum_DIN_sample[i]<-out$cum_DIN[(i-1)*365+243]
cum_nf_sample[i]<-out$cum_nf[(i-1)*365+243]
cum_A_sample[i]<-out$cum_A[(i-1)*365+243]
cum_H_sample[i]<-out$cum_H[(i-1)*365+243]
cum_BP_sample[i]<-out$cum_BP[(i-1)*365+243]
cum_DIC_sample[i]<-out$cum_DIC[(i-1)*365+243]



}

out_sample<-data.frame(year_sample,time_sample,A1_sample,A2_sample,A3_sample,H1_sample,H2_sample,
H3_sample,S1_sample,S2_sample,DIN_sample,DIP_sample,PON1_sample,PON2_sample,POP1_sample,POP2_sample,
years_sample,A_total_sample,H_total_sample,S_total_sample,Cmic_total_sample,PON_total_sample,POP_total_sample,
cum_A1_sample,cum_A2_sample,cum_A3_sample,cum_H1_sample,cum_H2_sample,cum_H3_sample,cum_DIC_A_sample,cum_DIC_H_sample,
cum_DIN_sample,cum_nf_sample,cum_A_sample,cum_H_sample,cum_BP_sample,cum_DIC_sample
)



#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



