##
### maize_type
##

### Filter Soil & Landrace

binary_soil_landrace<- subset_samples(binary_table, source== "Soil" & maize_type== "Landrace")
binary_soil_landrace

phyloseq.rel_soil_landrace<- subset_samples(phyloseq.rel, source== "Soil" & maize_type== "Landrace")
phyloseq.rel_soil_landrace

### Remove OTUs no longer present

binary_soil_landrace <- prune_taxa(taxa_sums(binary_soil_landrace) > 0, binary_soil_landrace)
binary_soil_landrace

phyloseq.rel_soil_landrace <- prune_taxa(taxa_sums(phyloseq.rel_soil_landrace) > 0, phyloseq.rel_soil_landrace)
phyloseq.rel_soil_landrace

#######################################################################################################################################
#######################################################################################################################################

### Filter Soil & Hybrid

binary_soil_hybrid<- subset_samples(binary_table, source== "Soil" & maize_type== "Hybrid")
binary_soil_hybrid

phyloseq.rel_soil_hybrid<- subset_samples(phyloseq.rel, source== "Soil" & maize_type== "Hybrid")
phyloseq.rel_soil_hybrid

### Remove OTUs no longer present

binary_soil_hybrid <- prune_taxa(taxa_sums(binary_soil_hybrid) > 0, binary_soil_hybrid)
binary_soil_hybrid

phyloseq.rel_soil_hybrid <- prune_taxa(taxa_sums(phyloseq.rel_soil_hybrid) > 0, phyloseq.rel_soil_hybrid)
phyloseq.rel_soil_hybrid
