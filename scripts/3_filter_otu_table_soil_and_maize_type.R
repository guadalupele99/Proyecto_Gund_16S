#
### Divide the data by soil and type of maize
#

#
### Soil and type of maize
#

### Filter soil and type of maize landrace
phyloseq_rel.abundance_soil_landrace<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & maize_type== "Landrace")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_landrace <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_landrace) > 0, phyloseq_rel.abundance_soil_landrace)

#
### Final tables for further analyses are:
#

### Soil and type of maize landrace

### Summary
phyloseq_rel.abundance_soil_landrace

######################################

#
###  Relative abundance table with OTU of bacterial communities associated with soil and landrace maize
#

OTU30 = as(otu_table(phyloseq_rel.abundance_soil_landrace), "matrix")
OTUdf = as.data.frame(OTU30)

write.csv(OTU30, file = "relative_ab_soil_landrace_NIVEL OTU.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil
#

OTU31 = as(tax_table(phyloseq_rel.abundance_soil_landrace), "matrix")
OTUdf = as.data.frame(OTU31)

write.csv(OTU31, file = "tax_soil_landrace_NIVEL OTU.csv")

###################################################################################################################################################################
###################################################################################################################################################################

#
### Soil and type of maize
#

### Filter soil and type of maize hybrid
phyloseq_rel.abundance_soil_hybrid<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & maize_type== "Hybrid")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_hybrid <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_hybrid) > 0, phyloseq_rel.abundance_soil_hybrid)

#
### Final tables for further analyses are:
#

### Soil and type of maize hybrid

### Summary
phyloseq_rel.abundance_soil_hybrid

###########################################

#
###  Relative abundance table with OTU of bacterial communities associated with soil and hybrid maize
#

OTU32 = as(otu_table(phyloseq_rel.abundance_soil_hybrid), "matrix")
OTUdf = as.data.frame(OTU32)

write.csv(OTU32, file = "relative_abundance_soil_hybrid_NIVEL OTU.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil and hybrid maize
#

OTU33 = as(tax_table(phyloseq_rel.abundance_soil_hybrid), "matrix")
OTUdf = as.data.frame(OTU33)

write.csv(OTU33, file = "tax_soil_hybrid_NIVEL OTU.csv")
