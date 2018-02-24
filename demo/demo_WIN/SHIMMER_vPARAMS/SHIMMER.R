
# Driver code

# COPY THIS INTO R-CONSOLE WINDOW TO EXECUTE

library("deSolve", lib="C:/RFolder/New_Packages")


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

#Enter the paths to the source file library, driving data file, observed data, and an output folder ....

##### NOTE: Change the following two paths if you change the model name e.g. .../SHIMMER_vSCENARIOS_1.1/...

# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

path    <-"C:/RFolder/model/demo/demo_WIN/SHIMMER_vPARAMS/library/"
path_root <-"C:/RFolder/model/demo/demo_WIN/SHIMMER_vPARAMS/"

# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

pathdr  <-"C:/RFolder/model/demo/demo_WIN/input_data_Svalbard/"

pathte  <-"C:/RFolder/model/demo/demo_WIN/observations/"


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



# Load observational data

source(paste(path,"SHIMMER_load_observational_data.R",sep=""))


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


#Number of years to run

nyears<-20


ndays<-nyears*365+1                # Number of days in the run sequence
times<-seq(0,nyears*365,by=1)      # Times at which we want the model to output data

#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''




source(paste(path,"SHIMMER_NEW_load_and_make_drivers.R",sep=""))

#source(paste(path,"SHIMMER_NEW_plot_drivers.R",sep=""))


source(paste(path,"SHIMMER_set_start_values.R",sep=""))



out_list = list()
out2_list = list()
out3_list = list()
out4_list = list()
out_sample_list = list()
out_array_list = list()


## Parameter manipulation

# Set counter_values to 1:(number of different params) and ncol= (number of parameters varied)

n_parm_values=4
n_parms_varied=3

counter_values<-matrix(c(1:n_parm_values), nrow=n_parm_values, ncol=n_parms_varied)
counter_values[,2]<-c(0.55,0.3,1.4, 0.1)
counter_values[,3]<-c(0.55,0.24,4.8, 0.1)
# include and define as many as appropriate


for(counter in 1:n_parm_values) {

source(paste(path,"SHIMMER_set_parameter_values.R",sep=""))

source(paste(path,"SHIMMER_NEW_model_definition.R",sep=""))


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

#Solve the equations over the interval given by (times)


out<-as.data.frame(lsoda(start,times,model,parms))


#Post processing to get rates of change

out$years<-out$time/365

source(paste(path,"SHIMMER_compute_totals.R",sep=""))

source(paste(path,"SHIMMER_construct_array.R",sep=""))





out_list[[counter_values[counter,1]]]<-out
out2_list[[counter_values[counter,1]]]<-out2
out3_list[[counter_values[counter,1]]]<-out3
out4_list[[counter_values[counter,1]]]<-out4
out_sample_list[[counter_values[counter,1]]]<-out_sample
out_array_list[[counter_values[counter,1]]]<-out_array

}

source(paste(path,"SHIMMER_basic_plots.R",sep=""))


