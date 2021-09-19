##
### Binary table with OTUs of soil bacteria
##

OTU0 = as(otu_table(binary_soil), "matrix")
OTUdf = as.data.frame(OTU0)

###########################################################

write.csv(OTU0, file = "binary_table_soil.csv")

########################################################################################################################################
########################################################################################################################################

##
### Binary table with OTUs of soil bacteria and native corn
##

OTU1 = as(otu_table(binary_soil_landrace), "matrix")
OTUdf = as.data.frame(OTU1)

################################################################################

write.csv(OTU1, file = "binary_table_soil_landrace.csv")

########################################################################################################################################
########################################################################################################################################

##
### Binary table with OTUs of soil bacteria and hybrid corn
##

OTU2 = as(otu_table(binary_soil_hybrid), "matrix")
OTUdf = as.data.frame(OTU2)

################################################################################

write.csv(OTU2, file = "binary_table_soil_hybrid.csv")

##########################################################################################################################################
##########################################################################################################################################

##
### Binary table with OTU of bacteria associated with soil, Tzotzil and native corn
##

OTU3 = as(otu_table(binary_soil_tzotzil_landrace), "matrix")
OTUdf = as.data.frame(OTU3)

################################################################################

write.csv(OTU3, file = "binary_table_soil_tzotzil_landrace.csv")

##########################################################################################################################################
##########################################################################################################################################

##
### Binary table with OTU of bacteria associated with soil, Tzotzil and hybrid maize
##

OTU4 = as(otu_table(binary_soil_tzotzil_hybrid), "matrix")
OTUdf = as.data.frame(OTU4)

################################################################################

write.csv(OTU4, file = "binary_table_soil_tzotzil_hybrid.csv")

##########################################################################################################################################
##########################################################################################################################################

##
### Binary table with OTU of bacteria associated with soil, Mestizo and native corn
##

OTU5 = as(otu_table(binary_soil_mestizo_landrace), "matrix")
OTUdf = as.data.frame(OTU5)

################################################################################

write.csv(OTU5, file = "binary_table_soil_mestizo_landrace.csv")

###########################################################################################################################################
###########################################################################################################################################

##
### Binary table with OTU of bacteria associated with soil, Mestizo and hybrid maize
##

OTU6 = as(otu_table(binary_soil_mestizo_hybrid), "matrix")
OTUdf = as.data.frame(OTU6)

################################################################################

write.csv(OTU6, file = "binary_table_soil_mestizo_hybrid.csv")

###########################################################################################################################################
###########################################################################################################################################

##
### Binary table with OTUs of soil bacteria and tzotzil farmer 
##

OTU7 = as(otu_table(binary_soil_tzotzil), "matrix")
OTUdf = as.data.frame(OTU7)

######################################################

write.csv(OTU7, file = "binary_table_soil_tzotzil.csv")

############################################################################################################################################
############################################################################################################################################

##
### Binary table with OTUs of soil bacteria and mestizo farmer 
##

OTU8 = as(otu_table(binary_soil_mestizo), "matrix")
OTUdf = as.data.frame(OTU8)

#################################################################

write.csv(OTU8, file = "binary_table_soil_mestizo.csv")
