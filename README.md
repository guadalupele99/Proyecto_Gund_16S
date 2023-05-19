## Proyecto-Gund: Bacterial communities of the rhizosphere in two maize seed systems (local seed and external seed) with different humidity in the municipality of Ocozocoautla de Espinosa, Chiapas

Metabarcoding. Bacterial communities associated with two types of corn seeds in two regions with different humidity.

Influence of the maize seed system on bacterial communities of the rhizosphere in the municipality of Ocozocoautla de Espinosa, Chiapas.


Author: María Guadalupe León Jiménez

This repository contains the necessary steps for cleaning the OTU table obtained from samples of bacterial communities associated with the local and external maize rhizosphere of the project "Seed systems and structuring of biodiversity in corn agroecosystems" of Dr. Alicia Mastretta.

Important: For the purposes of our research work, landrace was changed to local seed, hybrid to external seed, Tzotzil to low humidity, and Mestizo to medium humidity.

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
 
* 2_filter_otu_table_soil.R R script to filter the data corresponding to soil bacterial communities, remove OTUs that are no longer present and obtain relative abundance tables with OTUs of bacterial communities associated with the filtered data.

* 3_filter_otu_table_soil_and_maize_type.R R script to filter the OTU table that contains the OTU of bacterial communities present in the soil of landrace and hybrid maize. Change the data to relative abundance and remove the OTUs not present. Finally, it allows saving the tables obtained, as well as their associated relative abundances.

* 4_filter_otu_table_soil_and_farmer_type.R R script to filter the OTU table that contains the OTU of bacterial communities present in the soil of Mestizo and Tzotzil farmer. Change the data to relative abundance and remove the OTUs not present. Finally, it allows saving the tables obtained, as well as their associated relative abundances.

* 5_alpha_and_beta_diversity_and_statistical_analysis.R R script to make richness graphs for landrace and hybrid maize, as well as Mestizo and Tzotzil farmers. NMDS analysis and statistical tests for each variable analyzed.
