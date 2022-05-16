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

######################################################################################################################################################################

#
### Concatenate at the taxonomic level of Family
#
phyloseq_rel.abundance_soil_tzotzil_family <-tax_glom(phyloseq_rel.abundance_soil_tzotzil,taxrank = "Family")

### Check
head(otu_table(phyloseq_rel.abundance_soil_tzotzil_family), n=3)

### Remove OTUs that appear only in one sample

### Check if there are OTUs appearing only in one sample
sum(taxa_sums(phyloseq_rel.abundance_soil_tzotzil_family) == 1)

### Keep only those OTUs present in more than one sample
phyloseq_rel.abundance_soil_tzotzil_family<-prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_tzotzil_family) > 1, phyloseq_rel.abundance_soil_tzotzil_family)
phyloseq_rel.abundance_soil_tzotzil_family

#####################################################################################################################################################################

##
###  Relative abundance table with OTU of bacterial communities associated with soil and Tzotzil farmer
##

OTU5 = as(otu_table(phyloseq_rel.abundance_soil_tzotzil_family), "matrix")
OTUdf = as.data.frame(OTU5)

write.csv(OTU5, file = "relative_abundance_soil_tzotzil_FAM.csv")

##
### Relative abundance table with taxa of bacterial communities associated with soil and Tzotzil farmer
##

OTU6 = as(tax_table(phyloseq_rel.abundance_soil_tzotzil_family), "matrix")
OTUdf = as.data.frame(OTU6)

write.csv(OTU6, file = "tax_soil_tzotzil_FAM.csv")

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

#####################################################################################################################################################################

#
### Concatenate at the taxonomic level of Family
#
phyloseq_rel.abundance_soil_mestizo_family <-tax_glom(phyloseq_rel.abundance_soil_mestizo,taxrank = "Family")

### Check
head(otu_table(phyloseq_rel.abundance_soil_mestizo_family), n=3)

### Remove OTUs that appear only in one sample

### Check if there are OTUs appearing only in one sample
sum(taxa_sums(phyloseq_rel.abundance_soil_mestizo_family) == 1)

### Keep only those OTUs present in more than one sample
phyloseq_rel.abundance_soil_mestizo_family<-prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_mestizo_family) > 1, phyloseq_rel.abundance_soil_mestizo_family)
phyloseq_rel.abundance_soil_mestizo_family

###################################################################################################################################################################

#
###  Relative abundance table with OTU of bacterial communities associated with soil and Mestizo farmer
#

OTU7 = as(otu_table(phyloseq_rel.abundance_soil_mestizo_family), "matrix")
OTUdf = as.data.frame(OTU7)

write.csv(OTU7, file = "relative_abundance_soil_mestizo_FAM.csv")

#
### Relative abundance table with taxa of bacterial communities associated with soil and Mestizo farmer
#

OTU8 = as(tax_table(phyloseq_rel.abundance_soil_mestizo_family), "matrix")
OTUdf = as.data.frame(OTU8)

write.csv(OTU8, file = "tax_soil_mestizo_FAM.csv")
