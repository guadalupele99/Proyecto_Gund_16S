###
### This script cleans the otu table by removing negative controls,
### changing to relative abundance, removing 0 presence OTUs and changing the data to presence/absence
###

###
### Load libraries
###

ibrary(phyloseq)

###
### Load data
###

### Set working directory to source file

### Import biom data (includes OTU table, taxonomy table and sample data)
phyloseq_tables <- import_biom("taxonomy.biom")
phyloseq_tables

### Examine data

### OTU table
head(otu_table(phyloseq_tables))

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


### Negative control filter

### PCR1 Negative 1###

### Subset PCR batch 1

### If necessary, subset data by PCR batch. One negative control for each PCR, so those sequences need to be removed each PCR batch.

pcr_batch = subset_samples(phyloseq_tables, pcr_batch == "batch_1")
pcr_batch

### Move PCR_batch to a dataframe to subtract things.

pcr_batch_matrix = (as(otu_table(pcr_batch), "matrix"))
pcr_batch_matrix

pcr_batch_df = as.data.frame(pcr_batch_matrix)
row.names(pcr_batch_df)
colnames(pcr_batch_df)

### Create a vector from the Negative control
NC16sI=as.vector(pcr_batch_df$`NC16sI`)
NC16sI


### Insert the vector into a matrix
test1=cbind(NC16sI)
test1

### Replicate the column for the number of samples
test2 = test1[,rep(1,41)]
test2


### Subtract values from original matrix using the matrix based on repetition of negative control
pcr_batch1_clean<-pcr_batch_matrix-test2
pcr_batch1_clean

### Replace all negative numbers with 0, since we can't have negative seqs reads
pcr_batch1_cleaned  <-replace(pcr_batch1_clean, pcr_batch1_clean < 0, 0)
pcr_batch1_cleaned[,1]

##########################################################################################################################################
##########################################################################################################################################

### Do those steps again for each PCR batch to remove the contamination from the negative controls

### PCR2 Negative 2

pcr_batch2 = subset_samples(phyloseq_tables, pcr_batch == "batch_2")
pcr_batch2

### Move PCR_batch to a dataframe to subtract things.

pcr_batch_matrix = (as(otu_table(pcr_batch2), "matrix"))
pcr_batch_matrix

pcr_batch2_df = as.data.frame(pcr_batch_matrix)
row.names(pcr_batch2_df)
colnames(pcr_batch2_df)

### Create a vector from the Negative control

NC16sS=as.vector(pcr_batch2_df$`NC16sS`)
NC16sS

### Insert the vector into a matrix
test1=cbind(NC16sS)
test1

### Replicate the column for the number of samples
test2 = test1[,rep(1,39)]
test2

### Subtract values from original matrix using the matrix based on repetition of negative control
pcr_batch2_clean<-pcr_batch_matrix-test2
pcr_batch2_clean

### Replace all negative numbers with 0, since we can't have negative seqs reads
pcr_batch2_cleaned <- replace(pcr_batch2_clean, pcr_batch2_clean < 0, 0)
pcr_batch2_cleaned[,1]

############################################################################################################################################
############################################################################################################################################

### PCR2 Negative 3

pcr_batch3 = subset_samples(phyloseq_tables, pcr_batch == "batch_3")
pcr_batch3

### Move PCR_batch to a dataframe to subtract things

pcr_batch_matrix = (as(otu_table(pcr_batch3), "matrix"))
pcr_batch_matrix

pcr_batch3_df = as.data.frame(pcr_batch_matrix)
row.names(pcr_batch3_df)
colnames(pcr_batch3_df)

### Create a vector from the Negative control

`NC16s-N`=as.vector(pcr_batch3_df$`NC16s-N`)
`NC16s-N`

### Insert the vector into a matrix
test1=cbind(`NC16s-N`)
test1

### Replicate the column for the number of samples
test2 = test1[,rep(1,5)]
test2

### Subtract values from original matrix using the matrix based on repetition of negative control
pcr_batch3_clean<-pcr_batch_matrix-test2
pcr_batch3_clean

### Replace all negative numbers with 0, since we can't have negative seqs reads
pcr_batch3_cleaned <- replace(pcr_batch3_clean, pcr_batch3_clean < 0, 0)
pcr_batch3_cleaned[,1]

### Now, we can merge all our new OTU tables back together, and reload as a phyloseq object along with the previous taxa table and metedata, since we haven't removed any samples rows or taxa columns.  Once in phyloseq, we can remove columns/OTUs that are now 0.
### check that all objects are in the required format that phyloseq uses for each of them. Otu tables need to be all matrixes, metadata needs to be a data frame and taxonomy table needs to be a matrix
### now merge otu tables:
pcr_allbatches_cleaned <- cbind(pcr_batch1_cleaned, pcr_batch2_cleaned, pcr_batch3_cleaned)

dim(pcr_allbatches_cleaned)

### Create a new phyloseq object with all samples again.
### Export tax table (as matrix) and meta table (as data frame) to be able to re-import them with the new otu table

metadata_matrix = (as(sample_data(phyloseq_tables), "matrix"))
metadata_matrix

metadata_df = as.data.frame(metadata_matrix)
rownames(metadata_df)
colnames(metadata_df)

taxdata_matrix = (as(tax_table(phyloseq_tables), "matrix"))
taxdata_matrix

### Reimport the clean otu table (matrix), meta data (data frame) and tax table (matrix) into a new phylseq object

phyloseq_tables_cleaned <- phyloseq(otu_table(pcr_allbatches_cleaned, taxa_are_rows=TRUE),
                                    sample_data(metadata_df),
                                    tax_table(taxdata_matrix))

### Check the object to make sure all the samples and OTUs came back.The columns numbers will be the same, even if they are empty now.
phyloseq_tables_cleaned
phyloseq_tables

### Clean out OTUs rows that are no longer present.
phyloseq_tables_cleaned <- prune_taxa(taxa_sums(phyloseq_tables_cleaned) > 0, phyloseq_tables_cleaned)

### Clean out samples that are now empty (negative samples)
phyloseq_tables_cleaned <- prune_samples(sample_sums(phyloseq_tables_cleaned) > 0, phyloseq_tables_cleaned)

### Check the objects again
phyloseq_tables_cleaned

phyloseq_tables

### Check if any OTUs have zero reads in any sample
any(taxa_sums(phyloseq_tables_cleaned) == 0)

### Read counts before and after cleaning

taxa_sums(phyloseq_tables_cleaned)
sum(taxa_sums(phyloseq_tables_cleaned)) # total number of reads: 4381109
sum(taxa_sums(phyloseq_tables)) # total number of reads: 4383686
sum(rowSums(pcr_allbatches_cleaned))  # total number of reads: 4381109

########################################################################################################################################################
########################################################################################################################################################

### Step 2. DATA TRANSFORMATION
### Transform read counts into  % relative abundances: because of concerns about rarefying NGS data
### We will use the observed number of sequences normalized into relative abundance per sample.
### The relative abundance is then multiplied by 1000 and rounded to the nearest integer to be used as count data.

### Multiply by 1000 and transform to next integer so it looks like read count:
phyloseq.rel = transform_sample_counts(phyloseq_tables_cleaned, function(x) 1000 * x/sum(x))
otu_table(phyloseq.rel) = ceiling(otu_table(phyloseq.rel, "matrix")) # transform to next integer so it looks like read count
otu_table(phyloseq.rel) # check otu table
phyloseq.rel # check project

### Check if any OTUs are still counted as relative abundance and not integer

any(taxa_sums(phyloseq.rel) < 1)
ntaxa(phyloseq.rel)

### Check distribution of how many reads/OTU, reads/sample

sum(taxa_sums(phyloseq.rel)) # total number of reads

#######################################################################################################################################################
#######################################################################################################################################################

### Step 3. check distribution of how many reads/OTU, reads/sample: Plot number of reads per OTU / samples

readsumsdf = data.frame(no.reads = sort(taxa_sums(phyloseq_tables), TRUE), sorted = 1:ntaxa(phyloseq_tables), type = "OTUs")
readsumsdf = rbind(readsumsdf, data.frame(no.reads = sort(sample_sums(phyloseq_tables), TRUE), sorted = 1:nsamples(phyloseq_tables), type = "Samples"))
title = ""
p = ggplot(readsumsdf, aes(x = sorted, y = no.reads)) + geom_bar(stat = "identity")
p + ggtitle(title) + scale_y_log10() + facet_wrap(~type, 1, scales = "free")

readsumsdf = data.frame(no.reads = sort(taxa_sums(phyloseq.rel), TRUE), sorted = 1:ntaxa(phyloseq.rel), type = "OTUs")
readsumsdf = rbind(readsumsdf, data.frame(no.reads = sort(sample_sums(phyloseq.rel), TRUE), sorted = 1:nsamples(phyloseq.rel), type = "Samples"))
title = ""
p = ggplot(readsumsdf, aes(x = sorted, y = no.reads)) + geom_bar(stat = "identity")
p + ggtitle(title) + scale_y_log10() + facet_wrap(~type, 1, scales = "free")

###########################################################################################################################################################
###########################################################################################################################################################

### Check for distribution of OTUs

hist(log10(taxa_sums(phyloseq.rel)))

############################################################################################################################################################
############################################################################################################################################################

###
### Generate presence/absence table for beta-diversity analyses
###

### Transform sample counts to 0 and 1

binary_table = transform_sample_counts(phyloseq.rel, function(x, minthreshold=0){
  x[x > minthreshold] <- 1
  return(x)})

### Check

head(otu_table(binary_table))

###############################################################################################################################################################
###############################################################################################################################################################

### Remove OTUs that appear only in 1 sample (using presence/absence)

any(taxa_sums(binary_table) == 1)
otu_table(prune_taxa(taxa_sums(binary_table) <= 1, binary_table))
binary_table_OTU2 <- prune_taxa(taxa_sums(binary_table) > 1, binary_table)

binary_table
binary_table_OTU2

###############################################################################################################################################################
###############################################################################################################################################################

### TO FIX! Right now calculate read sum and not taxa sum
### Remove OTUs that appear only in 1 sample (using presence/absence)
### any(taxa_sums(phyloseq.rel) == 1)
### otu_table(prune_taxa(taxa_sums(phyloseq.rel) <= 1, phyloseq.rel))
### phyloseq.rel_OTU2 <- prune_taxa(taxa_sums(phyloseq.rel) > 1, phyloseq.rel)

phyloseq.rel

### phyloseq.rel_OTU2
sample_sums(phyloseq_tables)
sample_sums(phyloseq_tables_cleaned)
sample_sums(phyloseq.rel)

### FINAL OTU TABLES OBTAINED FOR FURTHER ANALYSIS
### phyloseq.rel (OTU table with relative abundances - corrected in count)
### binary_table
### phyloseq.rel_OTU2
### binary_table_OTU2
