#
### Filter the sampled data of bacterial communities in local seed associated to two regions with different humidity (where farmer_type represents the regions, Tzotzil=low humidity and Mestizo=medium humidity).
#

#
### 
#

### Filter soil, landrace (local seed) and Tzotzil (low humidity)
phyloseq_rel.abundance_soil_tzotzil_landrace<- subset_samples(phyloseq_rel.abundance_soil, source== "Soil" & farmer_type== "Tzotzil" & maize_type== "Landrace")

### Remove OTUs no longer present
phyloseq_rel.abundance_soil_tzotzil_landrace <- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_tzotzil_landrace) > 0, phyloseq_rel.abundance_soil_tzotzil_landrace)

#
### Final tables for further analyses are:
#

### Soil, landrace maize and Tzotzil

### Summary
phyloseq_rel.abundance_soil_tzotzil_landrace

###########################################

#
###  Relative abundance table with OTU of bacterial communities associated with the local seed in the low humidity
#

OTU38 = as(otu_table(phyloseq_rel.abundance_soil_tzotzil_landrace), "matrix")
OTUdf = as.data.frame(OTU38)

write.csv(OTU38, file = "relative_abundance_soil_TZOTZIL_LANDRACE.csv")

#
### Relative abundance table with taxa of bacterial communities associated with the local seed in the low humidity
#

OTU39 = as(tax_table(phyloseq_rel.abundance_soil_tzotzil_landrace), "matrix")
OTUdf = as.data.frame(OTU39)

write.csv(OTU39, file = "tax_soil_local seed_low humidity.csv")


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

OTU5 = as(otu_table(phyloseq_rel.abundance_soil_hybrid), "matrix")
OTUdf = as.data.frame(OTU5)

write.csv(OTU5, file = "relative_abundance_soil_hybrid.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil and hybrid maize
#

OTU6 = as(tax_table(phyloseq_rel.abundance_soil_hybrid), "matrix")
OTUdf = as.data.frame(OTU6)

write.csv(OTU6, file = "tax_soil_hybrid.csv")
