## Proyecto-Gund: Ocozocoautla de Espinosa, Chiapas_16S_deep roots and rhizopheric soil

Metabarcoding_bacteria_corn plots

Influence of genotype and agricultural management on the interactions of bacterial communities present in native and hybrid corn roots in Ocozocoautla de Espinosa, Chiapas


Author: María Guadalupe León Jiménez

This repository contains the necessary steps for the cleaning of data from marker 16S from the sampling of deep roots and rhizospheric soil from maize fields of local varieties of hybrid or local maize from the project "Seed systems and the structuring of biodiversity in maize agroecosystems" by Dra. Alicia Mastretta. In general, it includes the scripts used to exclusively obtain OTU from bacteria associated with roots and rhizospheric soil.

Contains the scripts to analyze OTU of bacteria sampled in deep roots and rhizospheric soil from native and hybrid corn plots.


## Repository organization

Gund metabarcoding

+-- Scripts

        +-- *R
  
+-- Data


+-- Figures


## Scripts

Scripts should be run in the order indicated by the number they start with.

* 1_filter_otu_table_16s.R R script used to clean the OTU table, remove negative controls, switch to relative abundance, remove OTU from presence 0 and change the data to presence / absence for each of the markers.

* 2_filter_otu_table_soil.R R script to clean the otu table, filter the OTUs of bacteria that belong exclusively to the sampling in rhizospheric soil and deep roots, switch to relative abundance, eliminate OTUs not present and obtain the binary table of the OTUs present in rhizospheric soil and deep roots.

* 3_filter_otu_table_soil_and_maize_type.R R script to filter the OTU table containing the OTUs of bacteria present in rhizospheric soil and deep roots, obtain the OTUs of local corn and hybrid corn. Change the data to relative abundance and remove OTUs that are not present. This filtering is carried out to obtain OTUs according to the genotype of the corn (local or hybrid).

* 4_filter_otu_table_soil_and_farmer_type.R R script to filter OTU table containing OTUs of bacteria present in rhizospheric soil and deep roots, obtain OTUs from natives farmers (Tzotziles) and mestizo farmers. Change the data to relative abundance and remove OTUs that are not present. This filtering is carried out to obtain OTUs according to the type of farmers (natives or mestizo).

* 5_get_binary_tables.R R script to obtain the binary OTU tables of each filtering previously performed, it also allows to convert the tables to a CSV format. Contains the binary OTU tables of the following filters: (0) Binary table with OTU of rhizospheric soil bacteria and deep roots; (1) Binary table with OTU of rhizospheric soil bacteria and deep roots of local maize; (2) Binary table with OTU of bacteria from rhizospheric soil and deep roots of hybrid corn; (3) Binary table with OTU of bacteria from rhizospheric soil and deep roots, Tzotzil farmer and local corn; (4) Binary table with OTU of bacteria from rhizospheric soil and deep roots, Tzotzil farmer and hybrid corn; (5) Binary table with OTU of bacteria from rhizospheric soil and deep roots, mestizo farmer and local corn; (6) Binary table with OTU of bacteria from rhizospheric soil and deep roots, mestizo farmer and hybrid corn.
