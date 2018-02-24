

mat <- matrix(data=NA, nrow = nrow(out_sample_list[[1]]), ncol = 101)


### 

for (i in 1:101) {
mat[,i]<-out_sample_list[[i]]$DIN_sample
}



write.table(mat, file = "out_sample_DIN.csv", sep = ",")


