##
### Soil
##

### Filter soil

binary_soil<- subset_samples(binary_table, source== "Soil")
binary_soil

phyloseq.rel_soil<- subset_samples(phyloseq.rel, source== "Soil")
phyloseq.rel_soil

### Remove OTUs no longer present

binary_soil <- prune_taxa(taxa_sums(binary_soil) > 0, binary_soil)
binary_soil

phyloseq.rel_soil <- prune_taxa(taxa_sums(phyloseq.rel_soil) > 0, phyloseq.rel_soil)
phyloseq.rel_soil

#############################################################################################################################################################
#############################################################################################################################################################

### Final tables for further analyses are:

### Soil

### summary
phyloseq.rel
binary_soil

### samples
sample_data(binary_soil)
table(sample_data(binary_soil)$maize_type)
