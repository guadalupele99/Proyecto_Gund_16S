## Proyecto-Gund: Bacterial communities of the rhizosphere in two maize seed systems (local and external seed) with different humidity in the municipality of Ocozocoautla de Espinosa, Chiapas

Metabarcoding. Bacterial communities associated with two types of corn seeds in two regions with different humidity.

Influence of the maize seed system on bacterial communities of the rhizosphere in the municipality of Ocozocoautla de Espinosa, Chiapas.


Author: María Guadalupe León Jiménez

This repository contains the necessary steps for cleaning the OTU table obtained from samples of bacterial communities associated with the local and external maize rhizosphere of the project "Seed systems and structuring of biodiversity in corn agroecosystems" of Dr. Alicia Mastretta.

Important: For the purposes of our research work, landrace was changed to local seed, hybrid to external seed, Tzotzil to low humidity, and Mestizo to medium humidity (according to the climate present in the study regions).

## Software versions used throughout this repository

R version 4.2.1

## Repository organization

Gund metabarcoding

+-- scripts

        +-- *R
  
+-- Data


+-- Figures


## Scripts

Scripts should be run in the order indicated by the number they start with.

* 1_filter_otu_table_16s.R R script to load the library used, import the .biom file, filter the negative control reads, remove OTUs that are no longer present as well as negative control samples, and generate a table of relative abundances.
 
* 2_filter_otu_table_soil.R R script to filter the data corresponding to soil bacterial communities, remove OTUs that are no longer present and obtain relative abundance tables with OTUs of bacterial communities associated with the filtered data. It also contains the steps to filter the data associated with the local and external maize seed.

* 3_filter_otu_table_soil_and_local_maize_seed.R R script to filter the OTU table that contains the bacterial communities present in the local seed associated with two humidities (low and medium) and allows saving the tables obtained with their relative abundances and taxonomy.

* 4_filter_otu_table_soil_and_external_maize_seed.R R script to filter the OTU table that contains the bacterial communities present in the external seed associated with two humidities (low and medium) and allows saving the tables obtained with their relative abundances and taxonomy.

* 5_alpha_and_beta_diversity_analysis.R R script to make boxplots of estimates of alpha diversity (Shannon index) of local and external seed maize. As well as NMDS with Bray-Curtis distance between the local and external seed samples and statistical tests to find out if there are significant differences.
