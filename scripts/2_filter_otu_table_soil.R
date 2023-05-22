#
### Divide data for soil
#

#
### Soil
#

### Filter soil
phyloseq_rel.abundance_soil<- subset_samples(phyloseq_rel.abundance, source== "Soil")

### Remove OTUs no longer present 
phyloseq_rel.abundance_soil <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil) > 0, phyloseq_rel.abundance_soil)

###
### Final tables for further analyses are:
###

### Soil

### Summary
phyloseq_rel.abundance_soil

#############################################################################################################################################################

#
###  Relative abundance table with OTU of bacterial communities associated with soil
#

OTU1 = as(otu_table(phyloseq_rel.abundance_soil), "matrix")
OTUdf = as.data.frame(OTU1)

write.csv(OTU1, file = "relative_abundance_soil.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil
#

OTU2 = as(tax_table(phyloseq_rel.abundance_soil), "matrix")
OTUdf = as.data.frame(OTU2)

write.csv(OTU2, file = "tax_soil_landrace_FAM.csv")

### Samples
sample_data(phyloseq_rel.abundance_soil)
table(sample_data(phyloseq_rel.abundance_soil)$maize_type)
table(sample_data(phyloseq_rel.abundance_soil)$farmer_type)

################################################################################################################################################
################################################################################################################################################

#
### Filter data by soil and maize seed
#

#
### Soil and local maize seed
#

### Filter soil and local maize seed
phyloseq_rel.abundance_soil_local seed<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & maize_type== "Landrace")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_local seed <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_local seed) > 0, phyloseq_rel.abundance_soil_local seed)

#
### Final tables for further analyses are:
#

### Soil and local maize seed

### Summary
phyloseq_rel.abundance_soil_local seed

########################################

#
### Relative abundance table with OTU of bacterial communities associated with soil and local maize seed
#

OTU3 = as(otu_table(phyloseq_rel.abundance_soil_local seed), "matrix")
OTUdf = as.data.frame(OTU3)

write.csv(OTU3, file = "relative_ab_soil_local seed.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil and local maize seed
#

OTU4 = as(tax_table(phyloseq_rel.abundance_soil_local seed), "matrix")
OTUdf = as.data.frame(OTU4)

write.csv(OTU4, file = "tax_soil_local seed.csv")

#################################################################################################################################################
#################################################################################################################################################

#
### Soil and external maize seed
#

### Filter soil and external maize seed
phyloseq_rel.abundance_soil_external seed<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & maize_type== "Hybrid")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_external seed <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_external seed) > 0, phyloseq_rel.abundance_soil_external seed)

#
### Final tables for further analyses are:
#

### Soil and external maize seed

### Summary
phyloseq_rel.abundance_soil_external seed

#############################################

#
###  Relative abundance table with OTU of bacterial communities associated with soil and external maize seed
#

OTU5 = as(otu_table(phyloseq_rel.abundance_soil_external seed), "matrix")
OTUdf = as.data.frame(OTU5)

write.csv(OTU5, file = "relative_abundance_soil_external seed.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil and external maize seed
#

OTU6 = as(tax_table(phyloseq_rel.abundance_soil_external seed), "matrix")
OTUdf = as.data.frame(OTU6)

write.csv(OTU6, file = "tax_soil_external seed.csv")
