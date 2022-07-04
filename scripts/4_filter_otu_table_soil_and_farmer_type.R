#
### Divide the data by soil and type of farmer
#

#
### Soil and type of farmer
#

### Filter soil and type of farmer Tzotzil
phyloseq_rel.abundance_soil_tzotzil<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & farmer_type== "Tzotzil")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_tzotzil <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_tzotzil) > 0, phyloseq_rel.abundance_soil_tzotzil)

#
### Final tables for further analyses are:
#

### Soil and type of farmer Tzotzil

### Summary
phyloseq_rel.abundance_soil_tzotzil

##############################################

##
###  Relative abundance table with OTU of bacterial communities associated with soil and Tzotzil farmer
##

OTU7 = as(otu_table(phyloseq_rel.abundance_soil_tzotzil), "matrix")
OTUdf = as.data.frame(OTU7)

write.csv(OTU7, file = "relative_abundance_soil_tzotzil.csv")

##
### Relative abundance table with taxa of bacterial communities associated with soil and Tzotzil farmer
##

OTU8 = as(tax_table(phyloseq_rel.abundance_soil_tzotzil), "matrix")
OTUdf = as.data.frame(OTU8)

write.csv(OTU8, file = "tax_soil_tzotzil.csv")

######################################################################################################################################################################
######################################################################################################################################################################

#
### Soil and type of farmer
#

### Filter soil and type of farmer Mestizo
phyloseq_rel.abundance_soil_mestizo<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & farmer_type== "Mestizo")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_mestizo <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_mestizo) > 0, phyloseq_rel.abundance_soil_mestizo)

#
### Final tables for further analyses are:
#

### Soil and type of farmer Mestizo

### Summary
phyloseq_rel.abundance_soil_mestizo

###########################################

#
###  Relative abundance table with OTU of bacterial communities associated with soil and Mestizo farmer
#

OTU9 = as(otu_table(phyloseq_rel.abundance_soil_mestizo), "matrix")
OTUdf = as.data.frame(OTU9)

write.csv(OTU9, file = "relative_abundance_soil_mestizo.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil and Mestizo farmer
#

OTU10 = as(tax_table(phyloseq_rel.abundance_soil_mestizo), "matrix")
OTUdf = as.data.frame(OTU10)

write.csv(OTU10, file = "tax_soil_mestizo.csv")

