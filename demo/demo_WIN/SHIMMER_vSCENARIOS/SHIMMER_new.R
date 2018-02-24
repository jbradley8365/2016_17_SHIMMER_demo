
# Driver code

# COPY THIS INTO R-CONSOLE WINDOW TO EXECUTE

library("deSolve", lib="C:/RFolder/New_Packages")


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

#Enter the paths to the source file library, driving data file, observed data, and an output folder ....

##### NOTE: Change the following two paths if you change the model name e.g. .../SHIMMER_vSCENARIOS_1.1/...

# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

path    <-"C:/RFolder/model/demo/demo_WIN/SHIMMER_vSCENARIOS/library/"
path_root <-"C:/RFolder/model/demo/demo_WIN/SHIMMER_vSCENARIOS/"

# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


pathdr  <-"C:/RFolder/model/demo/demo_WIN/input_data_scenarios/"

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


# FORCING SCENARIOS

#Enter number of forcing scenarios you are simulating

n_scenarios<-3

#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



# Parameters

source(paste(path,"SHIMMER_set_parameter_values.R",sep=""))


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

# Load drivers


#####

source(paste(path,"SHIMMER_load_and_make_drivers.R",sep=""))




source(paste(path,"SHIMMER_set_start_values.R",sep=""))



out_list = list()
out2_list = list()
out3_list = list()
out4_list = list()
out_sample_list = list()
out_array_list = list()


for(counter in 1:n_scenarios) {

source(paste(path,"SHIMMER_model_definition.R",sep=""))


out<-as.data.frame(lsoda(start,times,model,parms))

out$years<-out$time/365

source(paste(path,"SHIMMER_compute_totals.R",sep=""))

source(paste(path,"SHIMMER_construct_array.R",sep=""))


out_list[[counter]]<-out
out2_list[[counter]]<-out2
out3_list[[counter]]<-out3
out4_list[[counter]]<-out4
out_sample_list[[counter]]<-out_sample
out_array_list[[counter]]<-out_array

}



source(paste(path,"SHIMMER_basic_plots.R",sep=""))


#save.image("C:\\RFolder\\model\\demo_WIN\\SHIMMER_vSCENARIOS\\simulations.RData")



