# Construct an array of model output instead of containing it in a dataframe. 
# This makes averaging across e.g. months of years easier

# STEP 1 - convert data frame to matrix
# take off variable names, because an array doesn't have them

out_matrix_names <- as.matrix(out)

out_matrix <- matrix(out_matrix_names, ncol=ncol(out), dimnames=NULL)


# STEP 2 - need to define the dimensions of my arrat and give it a name

out_array = array(dim=c(365, ncol(out_matrix), nyears))


# STEP 3 - fill the array with my data from the 'out' dataframe

for (i in 1:nyears) {
out_array[,,i] = out_matrix[((i*365-364):(i*365)),]
}


# STEP 4 - create a lookup (out_array_lookup) to know which column relates to which variable

out_array_lookup <- out_matrix_names[1,]

