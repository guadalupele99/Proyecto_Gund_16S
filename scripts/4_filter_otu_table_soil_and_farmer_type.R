##
### farmer_type
##

### Filter Soil & Tzotzil

binary_soil_tzotzil<- subset_samples(binary_table, source== "Soil" & farmer_type== "Tzotzil")
binary_soil_tzotzil

phyloseq.rel_soil_tzotzil<- subset_samples(phyloseq.rel, source== "Soil" & farmer_type== "Tzotzil")
phyloseq.rel_soil_tzotzil

### Remove OTUs no longer present 

binary_soil_tzotzil <- prune_taxa(taxa_sums(binary_soil_tzotzil) > 0, binary_soil_tzotzil)
binary_soil_tzotzil

phyloseq.rel_soil_tzotzil <- prune_taxa(taxa_sums(phyloseq.rel_soil_tzotzil) > 0, phyloseq.rel_soil_tzotzil)
phyloseq.rel_soil_tzotzil

################################################################################################################################################
################################################################################################################################################

### Filter Soil & Mestizo

binary_soil_mestizo<- subset_samples(binary_table, source== "Soil" & farmer_type== "Mestizo")
binary_soil_mestizo

phyloseq.rel_soil_mestizo<- subset_samples(phyloseq.rel, source== "Soil" & farmer_type== "Mestizo")
phyloseq.rel_soil_mestizo

# Remove OTUs no longer present 

binary_soil_mestizo <- prune_taxa(taxa_sums(binary_soil_mestizo) > 0, binary_soil_mestizo)
binary_soil_mestizo

phyloseq.rel_soil_mestizo <- prune_taxa(taxa_sums(phyloseq.rel_soil_mestizo) > 0, phyloseq.rel_soil_mestizo)
phyloseq.rel_soil_mestizo

################################################################################################################################################
################################################################################################################################################

### Filter Soil & Tzotzil & Landrace

binary_soil_tzotzil_landrace<- subset_samples(binary_table, source== "Soil" & farmer_type== "Tzotzil" & maize_type== "Landrace")
binary_soil_tzotzil_landrace

phyloseq.rel_soil_tzotzil_landrace<- subset_samples(phyloseq.rel, source== "Soil" & farmer_type== "Tzotzil" & maize_type== "Landrace")
phyloseq.rel_soil_tzotzil_landrace

### Remove OTUs no longer present

binary_soil_tzotzil_landrace <- prune_taxa(taxa_sums(binary_soil_tzotzil_landrace) > 0, binary_soil_tzotzil_landrace)
binary_soil_tzotzil_landrace

phyloseq.rel_soil_tzotzil_landrace <- prune_taxa(taxa_sums(phyloseq.rel_soil_tzotzil_landrace) > 0, phyloseq.rel_soil_tzotzil_landrace)
phyloseq.rel_soil_tzotzil_landrace

##############################################################################################################################################
##############################################################################################################################################

### Filter Soil & Tzotzil & Hybrid

binary_soil_tzotzil_hybrid<- subset_samples(binary_table, source== "Soil" & farmer_type== "Tzotzil" & maize_type== "Hybrid")
binary_soil_tzotzil_hybrid

phyloseq.rel_soil_tzotzil_hybrid<- subset_samples(phyloseq.rel, source== "Soil" & farmer_type== "Tzotzil" & maize_type== "Hybrid")
phyloseq.rel_soil_tzotzil_hybrid

### Remove OTUs no longer present

binary_soil_tzotzil_hybrid <- prune_taxa(taxa_sums(binary_soil_tzotzil_hybrid) > 0, binary_soil_tzotzil_hybrid)
binary_soil_tzotzil_hybrid

phyloseq.rel_soil_tzotzil_hybrid <- prune_taxa(taxa_sums(phyloseq.rel_soil_tzotzil_hybrid) > 0, phyloseq.rel_soil_tzotzil_hybrid)
phyloseq.rel_soil_tzotzil_hybrid

##############################################################################################################################################
##############################################################################################################################################

### Filter Soil & Mestizo & Landrace

binary_soil_mestizo_landrace<- subset_samples(binary_table, source== "Soil" & farmer_type== "Mestizo" & maize_type== "Landrace")
binary_soil_mestizo_landrace

phyloseq.rel_soil_mestizo_landrace<- subset_samples(phyloseq.rel, source== "Soil" & farmer_type== "Mestizo" & maize_type== "Landrace")
phyloseq.rel_soil_mestizo_landrace

### Remove OTUs no longer present

binary_soil_mestizo_landrace <- prune_taxa(taxa_sums(binary_soil_mestizo_landrace) > 0, binary_soil_mestizo_landrace)
binary_soil_mestizo_landrace

phyloseq.rel_soil_mestizo_landrace <- prune_taxa(taxa_sums(phyloseq.rel_soil_mestizo_landrace) > 0, phyloseq.rel_soil_mestizo_landrace)
phyloseq.rel_soil_mestizo_landrace

############################################################################################################################################
############################################################################################################################################

### Filter Soil & Mestizo & Hybrid

binary_soil_mestizo_hybrid<- subset_samples(binary_table, source== "Soil" & farmer_type== "Mestizo" & maize_type== "Hybrid")
binary_soil_mestizo_hybrid

phyloseq.rel_soil_mestizo_hybrid<- subset_samples(phyloseq.rel, source== "Soil" & farmer_type== "Mestizo" & maize_type== "Hybrid")
phyloseq.rel_soil_mestizo_hybrid

### Remove OTUs no longer present

binary_soil_mestizo_hybrid <- prune_taxa(taxa_sums(binary_soil_mestizo_hybrid) > 0, binary_soil_mestizo_hybrid)
binary_soil_mestizo_hybrid

phyloseq.rel_soil_mestizo_hybrid <- prune_taxa(taxa_sums(phyloseq.rel_soil_mestizo_hybrid) > 0, phyloseq.rel_soil_mestizo_hybrid)
phyloseq.rel_soil_mestizo_hybrid
