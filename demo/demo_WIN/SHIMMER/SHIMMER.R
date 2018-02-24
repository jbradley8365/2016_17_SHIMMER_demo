
# Driver code

# COPY THIS INTO R-CONSOLE WINDOW TO EXECUTE

library("deSolve", lib="C:/RFolder/New_Packages")


#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


#Enter the paths to the source file library, driving data file, observed data, and an output folder ....


##### NOTE: Change the following two paths if you change the model name e.g. .../SHIMMER_vSCENARIOS_1.1/...

# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

path    <-"C:/RFolder/model/demo/demo_WIN/SHIMMER/library/"
path_root <-"C:/RFolder/model/demo/demo_WIN/SHIMMER/"

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


#Plotting

source(paste(path,"SHIMMER_basic_plots.R",sep=""))


# look at output

# out[1660,]
# out[18085,]
# out[41080,]


#write.table(out,file=paste("out","nominal.csv",sep="_"),sep=",",row.names=FALSE)

#write.table(out2,file=paste("out2","nominal.csv",sep="_"),sep=",",row.names=FALSE)

#write.table(out_sample,file=paste("outsample","nominal.csv",sep="_"),sep=",",row.names=FALSE)


