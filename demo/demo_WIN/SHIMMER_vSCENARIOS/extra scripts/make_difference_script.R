for (i in 1:n_scenarios) {

out_list[[i+n_scenarios]]<-out_list[[i+1]]-out_list[[1]]
out2_list[[i+n_scenarios]]<-out2_list[[i+1]]-out2_list[[1]]
out_sample_list[[i+n_scenarios]]<-out_sample_list[[i+1]]-out_sample_list[[1]]


}
