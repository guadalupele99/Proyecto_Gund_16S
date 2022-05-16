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

#################################################################################################################################################################

#
### Concatenate at the taxonomic level of Family
#
phyloseq_rel.abundance_soil_landrace_family <-tax_glom(phyloseq_rel.abundance_soil_landrace,taxrank = "Family")

### Check
head(otu_table(phyloseq_rel.abundance_soil_landrace_family), n=3)

### Remove OTUs that appear only in one sample

### Check if there are OTUs appearing only in one sample
sum(taxa_sums(phyloseq_rel.abundance_soil_landrace_family) == 1)

### Keep only those OTUs present in more than one sample
phyloseq_rel.abundance_soil_landrace_family<-prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_landrace_family) > 1, phyloseq_rel.abundance_soil_landrace_family)
phyloseq_rel.abundance_soil_landrace_family

###################################################################################################################################################################

#
###  Relative abundance table with OTU of bacterial communities associated with soil and landrace maize
#

OTU1 = as(otu_table(phyloseq_rel.abundance_soil_landrace_family), "matrix")
OTUdf = as.data.frame(OTU1)

write.csv(OTU1, file = "relative_abundance_soil_landrace_FAM.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil and landrace maize
#

OTU2 = as(tax_table(phyloseq_rel.abundance_soil_landrace_family), "matrix")
OTUdf = as.data.frame(OTU2)

write.csv(OTU2, file = "tax_soil_landrace_FAM.csv")

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

#######################################################################################################################################################################

#
### Concatenate at the taxonomic level of Family
#
phyloseq_rel.abundance_soil_hybrid_family <-tax_glom(phyloseq_rel.abundance_soil_hybrid,taxrank = "Family")

### Check
head(otu_table(phyloseq_rel.abundance_soil_hybrid_family), n=3)

### Remove OTUs that appear only in one sample

### Check if there are OTUs appearing only in one sample
sum(taxa_sums(phyloseq_rel.abundance_soil_hybrid_family) == 1)

# Keep only those OTUs present in more than one sample
phyloseq_rel.abundance_soil_hybrid_family<-prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_hybrid_family) > 1, phyloseq_rel.abundance_soil_hybrid_family)
phyloseq_rel.abundance_soil_hybrid_family

####################################################################################################################################################################

#
###  Relative abundance table with OTU of bacterial communities associated with soil and hybrid maize
#

OTU3 = as(otu_table(phyloseq_rel.abundance_soil_hybrid_family), "matrix")
OTUdf = as.data.frame(OTU3)

write.csv(OTU3, file = "relative_abundance_soil_hybrid_FAM.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil and hybrid maize
#

OTU4 = as(tax_table(phyloseq_rel.abundance_soil_hybrid_family), "matrix")
OTUdf = as.data.frame(OTU4)

write.csv(OTU4, file = "tax_soil_hybrid_FAM.csv")
