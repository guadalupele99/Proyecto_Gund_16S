#
### Filter the sampled data of bacterial communities in external seed associated to two regions with different humidity (where farmer_type represents the regions, Tzotzil=low humidity and Mestizo=medium humidity).
#

#
### Bacterial communities in external seed associated to low humidity
#

### Filter soil, hybrid (external seed) and Tzotzil (low humidity)
phyloseq_rel.abundance_soil_external seed_low humidity<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & farmer_type== "Tzotzil" & maize_type== "Hybrid")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_external seed_low humidity <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_external seed_low humidity) > 0, phyloseq_rel.abundance_soil_external seed_low humidity)

#
### Final tables for further analyses are:
#

### Soil, external seed and low humidity

### Summary
phyloseq_rel.abundance_soil_external seed_low humidity

###################################################################

#
###  Relative abundance table with OTU of bacterial communities associated with the external seed in low humidity
#

OTU7 = as(otu_table(phyloseq_rel.abundance_soil_external seed_low humidity), "matrix")
OTUdf = as.data.frame(OTU7)

write.csv(OTU7, file = "relative_abundance_soil_external seed_low humidity.csv")

#
### Relative abundance table with taxa of bacterial communities associated with the external seed in low humidity
#

OTU8 = as(tax_table(phyloseq_rel.abundance_soil_external seed_low humidity), "matrix")
OTUdf = as.data.frame(OTU8)

write.csv(OTU8, file = "tax_soil_external seed_low humidity.csv")

######################################################################################################################################################################
######################################################################################################################################################################

#
###  Bacterial communities in external seed associated to medium humidity
#

### Filter soil, hybrid (external seed) and Mestizo (medium humidity)
phyloseq_rel.abundance_soil_external seed_medium humidity<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & farmer_type== "Mestizo" & maize_type== "Hybrid")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_external seed_medium humidity <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_external seed_medium humidity) > 0, phyloseq_rel.abundance_soil_external seed_medium humidity)

#
### Final tables for further analyses are:
#

### Soil, external seed and medium humidity

### Summary
phyloseq_rel.abundance_soil_external seed_medium humidity

######################################################################

#
###  Relative abundance table with OTU of bacterial communities associated with the external seed in medium humidity
#

OTU9 = as(otu_table(phyloseq_rel.abundance_soil_external seed_medium humidity), "matrix")
OTUdf = as.data.frame(OTU9)

write.csv(OTU9, file = "relative_abundance_soil_external seed_medium humidity.csv")

#
### Relative abundance table with taxa of bacterial communities associated with the external seed in medium humidity
#

OTU10 = as(tax_table(phyloseq_rel.abundance_soil_external seed_medium humidity), "matrix")
OTUdf = as.data.frame(OTU10)

write.csv(OTU10, file = "tax_soil_external seed_medium humidity.csv")
