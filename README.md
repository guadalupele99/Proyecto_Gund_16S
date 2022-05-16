## Proyecto-Gund: Ocozocoautla de Espinosa, Chiapas_16S_deep roots and rhizopheric soil

Metabarcoding. Bacterial communities associated with two genotypes and agricultural management.

Influence of genotype and agricultural management on the interactions of bacterial communities present in native and hybrid corn roots in Ocozocoautla de Espinosa, Chiapas


Author: María Guadalupe León Jiménez

This repository contains the necessary steps for cleaning the OTU table obtained from samples of bacterial communities associated with deep roots and rhizosphere soil in native and hybrid corn fields of the project "Seed systems and structuring of biodiversity in corn agroecosystems" of Dr. Alicia Mastretta.

It contains the scripts to analyze the OTU of bacterial communities associated with roots and soil in plots of landrace and hybrid maize under two types of agricultural management.

## Repository organization

Gund metabarcoding

+-- scripts

        +-- *R
  
+-- Data


+-- Figures


## Scripts

Scripts should be run in the order indicated by the number they start with.

* 1_filter_otu_table_16s.R R script used to clean the OTU table by removing negative controls, changing to relative abundance, and removing 0 OTU reads and samples that are no longer present.

* 2_filter_otu_table_soil.R R script to filter OTUs from bacterial communities that belong exclusively to soil sampling, remove OTUs that are no longer present, and obtain the final table for further analysis.

* 3_filter_otu_table_soil_and_maize_type.R R script to filter the OTU table that contains the OTU of bacterial communities present in the soil of landrace and hybrid maize. Change the data to relative abundance and remove the OTUs not present. In addition to concatenating the OTUs at the Family taxonomic level, eliminating the OTUs that appear in a sample and keeping those present in more than one sample. Finally, it allows saving the tables obtained at the family level, as well as their associated relative abundances.

* 4_filter_otu_table_soil_and_farmer_type.R R script to filter the OTU table that contains the OTU of bacterial communities present in the soil of Mestizo and Tzotzil farmer. Change the data to relative abundance and remove the OTUs not present. In addition to concatenating the OTUs at the Family taxonomic level, eliminating the OTUs that appear in a sample and keeping those present in more than one sample. Finally, it allows saving the tables obtained at the family level, as well as their associated relative abundances.

* 5_alpha_and_beta_diversity_and_statistical_analysis.R R script to make richness graphs for landrace and hybrid maize, as well as Mestizo and Tzotzil farmers. NMDS analysis and statistical tests for each variable analyzed.
