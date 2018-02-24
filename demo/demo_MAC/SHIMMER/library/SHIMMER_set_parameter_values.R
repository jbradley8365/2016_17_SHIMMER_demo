# Set parameter values
# Units are in micrograms/g soil (ug/g)


parms<-c(


# Tref = 25, # Reference temperature at which rates are given
NC = 0.141 , # C:N microbial (MASS)
PC = 0.083,  # C:P microbial (MASS)

Q_10 = 2.91 , # Q10 temperature response for basically all growth and death processes


alphaA = 0.070, # 0.0340,    #density dependent death rate on autotrophs
alphaH = 0.070, # 0.0340,    #density dependent death rate on heterotrophs

g_Sub = 0.000000, # proportional leaching loss of substrate (carbon, nitrogen, phosphorus)
g_DIN = 0.000000, # proportional leaching loss of DIN
g_DIP = 0.000000, # proportional leaching loss of DIP


exA = 0.0140, # exudates from Autotrophs
exH = 0.0140, # exudates from Heterotrophs

p_sub = 0.20, # slow-down parameter for subglacial growth rate
K_sub = 0.80, # half-saturation parameter for subglacial growth



ImaxA = 0.55 , # Maximum growth rates of autotrophs
ImaxH = 0.55 , # Maximum growth rates of heterotrophs

K_L = 11.88 , # Light half saturation for autotrophs


K_S = 349, # 349  , # substratre half saturation for Heterotrophs

K_N = 49.209, # 49.209 , # (NC = 0.141)   DIN half saturation

DINt = 0 ,  # (NC = 0.141)   Nitrogen concentration threshold for N-fixation starting

K_N2 = 49.209, # 98.418, # 393.672 , # (8*K_N) shape of logistic function for n-fixation switch

K_P = 28.967, # 28.967 , # (PC = 0.083)    DIP half saturation

n_f = 0.25 , # 0.50, # downscaling of efficiency and growth whilst n-fixers are fixing 


JS1 = 0.68, # 0.68 ,  # heterotrophic use of S1 
JS2 = 0.15 , #0.15,   # heterotrophic use of S2 
q = 0.30 , # proportion of losses that becomes labile

Y_A = 0.06 , #BGE of autotrophs (Yield)
Y_H = 0.06 , #BGE oh heterotrophs (Yield)

v_Sub = (0.17/20)*30, # Proportion of substrate deposition available to microbes
v_DIN = 0.17/20, # Proportion of N-deposition available to microbes
v_DIP = 0.17/20, # Proportion of DIP-deposition available to microbes


dor = 0.285 # active fraction


)


#...............................



