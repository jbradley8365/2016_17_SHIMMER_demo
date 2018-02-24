output1<-1
output1[1]<-1


output2<-1
output2[1]<-1

output3<-1
output3[1]<-1

output4<-1
output4[1]<-1

output5<-1
output5[1]<-1

output6<-1
output6[1]<-1

output7<-1
output7[1]<-1

output8<-1
output8[1]<-1

output9<-1
output9[1]<-1


### A_total_sample

for (i in 6:47) {
output1[i]<-out_sample_list[[i]]$A_total_sample[200]
}


### H_total_sample

for (i in 6:47) {
output2[i]<-out_sample_list[[i]]$H_total_sample[200]
}


### Cmic_total_sample

for (i in 6:47) {
output3[i]<-out_sample_list[[i]]$Cmic_total_sample[200]
}


### S_total_sample

for (i in 6:47) {
output4[i]<-out_sample_list[[i]]$S_total_sample[200]
}


### DIN_sample

for (i in 6:47) {
output5[i]<-out_sample_list[[i]]$DIN_sample[200]
}


### annual_A

for (i in 6:47) {
output6[i]<-out2_list[[i]]$annual_A[200]
}


### annual_H

for (i in 6:47) {
output7[i]<-out2_list[[i]]$annual_H[200]
}


### annual_BP

for (i in 6:47) {
output8[i]<-out2_list[[i]]$annual_BP[200]
}


### annual_net_DIC_efflux

for (i in 6:47) {
output9[i]<-out2_list[[i]]$annual_net_DIC_efflux[200]
}



new=data.frame(output1, output2, output3,output4,output5,output6,output7,output8,output9)

write.table(new,file=paste("new.csv"),sep=",",row.names=FALSE)


