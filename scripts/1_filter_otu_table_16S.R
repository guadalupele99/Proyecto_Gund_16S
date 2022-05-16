#
### This script cleans the OTU table by removing negative controls,changing to relative abundance and removing OTUs with zero presence.
#

#
### Load libraries
#

library(phyloseq)
library(ggplot2)

#
### Load data
#

#
### Set working directory to source file
#

#
### Import biom data (includes OTU table, taxonomy table and sample data)
#
phyloseq_tables <- import_biom("taxonomy.biom")

#
### Examine data
#

### Summary
phyloseq_tables

### OTU table
head(otu_table(phyloseq_tables))
colnames(otu_table(phyloseq_tables))

### Taxonomy
head(tax_table(phyloseq_tables))

### Summary
sample_data(phyloseq_tables)

### View and change taxonomic ranks
rank_names(phyloseq_tables)

### Change the names of the ranges
colnames(tax_table(phyloseq_tables))<-c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species")
head(tax_table(phyloseq_tables), n=6)

### Sample data
head(sample_data(phyloseq_tables), n=6)

###
### Filter reads from Negative Control 
### 

### Source custom function to remove the reads from NC of all samples from a given PCR batch returning a matrix of the OTU table w/o the NC. 

remove_NC<-function(phyloseq_tables, batch_id, NC_name){
  
  ### This functions removes the reads from NC of all samples from a given PCR batch
  # returning a matrix of the OTU table w/o the NC
  
  ### Arguments:
  ## phyloseq_tables: a phyloseq object result of importing a taxonomy.biom file.
  ## batch_id: character vector with the name of the batch ID. Asumes it exists in a variable
  # "pcr_batch" within the phyloseq tables.
  ## NC_name: character vector with the name of the NC sample.
  
  ### Function:
  ## Subset pcr batch
  batch_id <<- batch_id # Assign batch_id to the global env because otherwise subset_samples do not work within a function
  batch<- subset_samples(phyloseq_tables, pcr_batch == batch_id)
  print("input data looks like:")
  print(batch)
  
  ## Get OTU matrix
  batch_OTU<-as.matrix(otu_table(batch))
  
  ## Get NC vector
  NC<-as.vector(batch_OTU[,NC_name])
  
  ## Remove reads present in NC for each OTU
  batch_clean<-batch_OTU-NC
  
  ## Replace negative numbers with 0 since we can't have negative reads
  batch_clean<-replace(batch_clean, batch_clean < 0, 0)
  
  ## Tell the user what happened
  print(paste("NC sample", NC_name, "was used to filter",  sum(NC), "reads in total"))
  
  ## Return results
  batch_clean
  
}

###################################################################################################################################################################
###################################################################################################################################################################

#
### Filter NC reads in each PCR batch
#

### For PCR batch 1
batch1_filtered<-remove_NC(phyloseq_tables=phyloseq_tables, batch_id = "batch_1", NC_name = "NC16sI")
head(batch1_filtered, n=3)

### For PCR batch 2
batch2_filtered<-remove_NC(phyloseq_tables, batch_id = "batch_2", NC_name = "NC16sS")
head(batch2_filtered, n=3)

### For PCR batch 3
batch3_filtered<-remove_NC(phyloseq_tables, batch_id = "batch_3", NC_name = "NC16s-N")
head(batch3_filtered, n=3)

#################################################################################################################################################################
#################################################################################################################################################################

#
### Transform back to phyloseq object
#

### Bind together batches
batches_filtered<-cbind(batch1_filtered, batch2_filtered, batch3_filtered)

### Check OTU table
head(batches_filtered, n=3)

### Check dimensions match what went in
dim(otu_table(phyloseq_tables))
dim(batches_filtered)

### Reimport data in new phyloseq object
phyloseq_filtered<-phyloseq(otu_table(batches_filtered, taxa_are_rows = TRUE),
                            sample_data(phyloseq_tables),
                            tax_table(phyloseq_tables))
### Check resulted data
phyloseq_filtered
head(otu_table(phyloseq_filtered), n=3)

################################################################################################################################################################
################################################################################################################################################################

###
### Remove OTUs that are no longer present and NC samples
###

# Remove OTUs no longer present 
phyloseq_cleaned <- prune_taxa(taxa_sums(phyloseq_filtered) > 0, phyloseq_filtered)

# Remove samples that are now have no reads (NC and any failed sample)
phyloseq_cleaned <- prune_samples(sample_sums(phyloseq_cleaned) > 0, phyloseq_cleaned)

# Check that no OTUs have 0 reads in any sample
any(taxa_sums(phyloseq_cleaned) == 0)

### Compare what came in and was filtered at each step:

# Original data
phyloseq_tables
sum(otu_table(phyloseq_tables)) # total number of reads

# Filtering reads from NC
phyloseq_filtered
sum(otu_table(phyloseq_filtered))

# Removing 0 reads OTUs and samples
phyloseq_cleaned
sum(otu_table(phyloseq_cleaned))

##############################################################################################################################################################
##############################################################################################################################################################

#
### Generate table of relative abundances
# 

### Transform read counts into relative abundances

### Estimate proportion of reads per OTU per sample relative to the total sum of reads per each OTU
phyloseq_rel.abundance<- transform_sample_counts(phyloseq_cleaned, function(x) 10000 * x/sum(x))

### Transform to next integer so it looks like "read count"
otu_table(phyloseq_rel.abundance) <- ceiling(otu_table(phyloseq_rel.abundance, "matrix"))

#
### Compare vs original
#

### Number of reads
otu_table(phyloseq_cleaned)[1:3,1:3]
otu_table(phyloseq_rel.abundance)[1:3,1:3]

### Phyloseq objects
phyloseq_cleaned
phyloseq_rel.abundance
