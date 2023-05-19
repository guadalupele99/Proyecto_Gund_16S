#
### Filter the sampled data of bacterial communities in local seed associated to two regions with different humidity (where farmer_type represents the regions, Tzotzil=low humidity and Mestizo=medium humidity).
#

#
### Bacterial communities in local seed associated to low humidity
#

### Filter soil, landrace (local seed) and Tzotzil (low humidity)
phyloseq_rel.abundance_soil_local seed_low humidity<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & farmer_type== "Tzotzil" & maize_type== "Landrace")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_local seed_low humidity <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_local seed_low humidity) > 0, phyloseq_rel.abundance_soil_local seed_low humidity)

#
### Final tables for further analyses are:
#

### Soil, local seed and low humidity

### Summary
phyloseq_rel.abundance_soil_local seed_low humidity

###########################################

#
###  Relative abundance table with OTU of bacterial communities associated with the local seed in low humidity
#

OTU3 = as(otu_table(phyloseq_rel.abundance_soil_local seed_low humidity), "matrix")
OTUdf = as.data.frame(OTU3)

write.csv(OTU3, file = "relative_abundance_soil_local seed_low humidity.csv")

#
### Relative abundance table with taxa of bacterial communities associated with the local seed in low humidity
#

OTU4 = as(tax_table(phyloseq_rel.abundance_soil_local seed_low humidity), "matrix")
OTUdf = as.data.frame(OTU4)

write.csv(OTU4, file = "tax_soil_local seed_low humidity.csv")

###################################################################################################################################################################
###################################################################################################################################################################

#
### Bacterial communities in local seed associated to medium humidity
#

### Filter soil, landrace (local seed) and Mestizo (medium humidity)
phyloseq_rel.abundance_soil_local seed_medium humidity<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & farmer_type== "Mestizo" & maize_type== "Landrace")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_local seed_medium humidity <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_local seed_medium humidity) > 0, phyloseq_rel.abundance_soil_local seed_medium humidity)

#
### Final tables for further analyses are:
#

### Soil, local seed and medium humidity

### Summary
phyloseq_rel.abundance_soil_local seed_medium humidity

#############################################################

#
###  Relative abundance table with OTU of bacterial communities associated with the local seed in medium humidity
#

OTU5 = as(otu_table(phyloseq_rel.abundance_soil_local seed_medium humidity), "matrix")
OTUdf = as.data.frame(OTU5)

write.csv(OTU5, file = "relative_abundance_soil_local seed_medium humidity.csv")

#
### Relative abundance table with taxa of bacterial communities associated with the local seed in medium humidity
#

OTU6 = as(tax_table(phyloseq_rel.abundance_soil_local seed_medium humidity), "matrix")
OTUdf = as.data.frame(OTU6)

write.csv(OTU6, file = "tax_soil_local seed_medium humidity.csv")
