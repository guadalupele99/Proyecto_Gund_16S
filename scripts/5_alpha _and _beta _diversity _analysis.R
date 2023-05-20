#
### This script performs plots to explore data of marker 16s
# 


#
### Load libraries
#

library(ggplot2)
library(permute)
library(lattice)
library(vegan)
library(plyr)
library(RColorBrewer)
library(plotly)
library(htmltools)
library(dplyr)
library(ggpubr)
library(car)

#
### Check data
#

### 16s soil
phyloseq_rel.abundance_soil
phyloseq_rel.abundance_soil_local seed_low humidity
phyloseq_rel.abundance_soil_local seed_medium humidity
phyloseq_rel.abundance_soil_external seed_low humidity
phyloseq_rel.abundance_soil_external seed_medium humidity

###################################################################################################################################################################
####################################################################################################################################################################

#
### Plot Alpha Diversity of the local seed in two humidity
#

#
### Alpha diversity of the local seed in the region with low humidity (where farmer_type Tzotzil represents the low humidity)
#

pr1 <- plot_richness(phyloseq_rel.abundance_soil_local seed_low humidity, x= "farmer_type", color="farmer_type", measures=("Shannon")) +
  geom_boxplot(aes(x=farmer_type, y=value, color=NULL), alpha=0.1) + geom_jitter() +
  labs(x = '', y = "Medida de diversidad alfa", color= "Tipo de agricultor", size = 12) +
  scale_x_discrete(labels=c("Tzotzil" = "R1.Humedad baja"))+
  theme(legend.position='none')+
  theme(axis.text.x = element_text(angle = 360))+
  theme(axis.text = element_text(size=10))
pr1

#
### Save plot
#
ggsave(filename = "semilla local y humedad baja.png", width = 8, height = 14, dpi = 300, units = "cm")

###########################################################################################################################################################
###########################################################################################################################################################

#
### Alpha diversity of the local seed in the region with medium humidity (where farmer_type Mestizo represents the medium humidity)
#

pr2 <- plot_richness(phyloseq_rel.abundance_soil_local seed_medium humidity, x= "farmer_type", color="farmer_type", measures=("Shannon")) +
  geom_boxplot(aes(x=farmer_type, y=value, color=NULL), alpha=0.1) + geom_jitter() +
  labs(x = '', y = "Medida de diversidad alfa", color= "Tipo de agricultor", size = 12) +
  scale_x_discrete(labels=c("Mestizo" = "R2.Humedad media"))+
  theme(legend.position='none')+
  theme(axis.text.x = element_text(angle = 360))+
  theme(axis.text = element_text(size=10))
pr2

#
### Save plot
#
ggsave(filename = "semilla local y humedad media.png", width = 8, height = 14, dpi = 300, units = "cm")

#############################################################################################################################################

#
### Plot Alpha Diversity of the external seed in two humidity
#

#
### Alpha diversity of the external seed in the region with low humidity (where farmer_type Tzotzil represents the low humidity)
#

pr3 <- plot_richness(phyloseq_rel.abundance_soil_external seed_low humidity, x= "farmer_type", color="farmer_type", measures=("Shannon")) +
  geom_boxplot(aes(x=farmer_type, y=value, color=NULL), alpha=0.1) + geom_jitter() +
  labs(x = '', y = "Medida de diversidad alfa", color= "Tipo de agricultor", size = 12) +
  scale_x_discrete(labels=c("Tzotzil" = "R1.Humedad baja"))+
  theme(legend.position='none')+
  theme(axis.text.x = element_text(angle = 360))+
  theme(axis.text = element_text(size=10))
pr3

#
### Save plot
#
ggsave(filename = "semilla externa y humedad baja.png", width = 8, height = 14, dpi = 300, units = "cm")

############################################################################################################################################################
############################################################################################################################################################

#
### Alpha diversity of the external seed in the region with medium humidity (where farmer_type Mestizo represents the medium humidity)
#

pr4 <- plot_richness(phyloseq_rel.abundance_soil_external seed_medium humidity, x= "farmer_type", color="farmer_type", measures=("Shannon")) +
  geom_boxplot(aes(x=farmer_type, y=value, color=NULL), alpha=0.1) + geom_jitter() +
  labs(x = '', y = "Medida de diversidad alfa", color= "Tipo de agricultor", size = 12) +
  scale_x_discrete(labels=c("Mestizo" = "R2.Humedad media"))+
  theme(legend.position='none')+
  theme(axis.text.x = element_text(angle = 360))+
  theme(axis.text = element_text(size=10))
pr4

#
### Save plot
#
ggsave(filename = "semilla externa y humedad media.png", width = 8, height = 14, dpi = 300, units = "cm")

############################################################################################################################################

#
### Table for alpha diversity measure (Shannon index) in local seed data
#

alpha.diversity <-estimate_richness(phyloseq_rel.abundance_soil_local seed, measures=("Shannon")) 
data <- cbind(sample_data(phyloseq_rel.abundance_soil_local seed), alpha.diversity) ### Combine metadata with alpha diversity
data

##################################################################################################################################################

