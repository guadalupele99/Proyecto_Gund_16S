## Proyecto-Gund: Ocozocoautla de Espinosa, Chiapas_16S_deep roots and rhizopheric soil

Metabarcoding_bacteria_corn plots

Influence of genotype and agricultural management on the interactions of bacterial communities present in native and hybrid corn roots in Ocozocoautla de Espinosa, Chiapas


Author: María Guadalupe León Jiménez

This repository contains the necessary steps for the cleaning of data from marker 16S from the sampling of deep roots and rhizospheric soil from maize fields of local varieties of hybrid or local maize from the project "Seed systems and the structuring of biodiversity in maize agroecosystems" by Dra. Alicia Mastretta. In general, it includes the scripts used to exclusively obtain OTU from bacteria associated with roots and rhizospheric soil.

Contains the scripts to analyze OTU of bacteria sampled in deep roots and rhizospheric soil from native and hybrid corn plots


## Repository organization

Gund metabarcoding

+-- Scripts

        +-- *R
  
+-- Data


+-- Figures


## Scripts

Scripts should be run in the order indicated by the number they start with.

* 1_filter_otu_table_[16s] .R R script to clean the otu table by removing negative controls, changing to relative abundance, removing 0 presence OTUs and changing the data to presence/absence for each of the markers.
