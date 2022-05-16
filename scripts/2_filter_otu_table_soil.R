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

OTU0 = as(otu_table(phyloseq_rel.abundance_soil), "matrix")
OTUdf = as.data.frame(OTU0)

write.csv(OTU0, file = "relative_abundance_soil.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil
#

OTU01 = as(tax_table(phyloseq_rel.abundance_soil), "matrix")
OTUdf = as.data.frame(OTU01)

write.csv(OTU01, file = "tax_soil_landrace_FAM.csv")

### Samples
sample_data(phyloseq_rel.abundance_soil)
table(sample_data(phyloseq_rel.abundance_soil)$maize_type)
table(sample_data(phyloseq_rel.abundance_soil)$farmer_type)
