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

#
### ANOVA test to check that the data meets the assumptions
#

#
### ### ANOVA test for data from regions with different humidity in the local seed
#

### One way ANOVA
### Dependent variable (data) : observed richness 
### Independent variable (factor): farmer type

anova1<-aov(Shannon ~ farmer_type, data = data)
summary(anova1)
TukeyHSD(anova1)
boxplot(Shannon ~ farmer_type, data = data)

### Check normality with visual methods  
ggdensity(alpha.diversity$Shannon, 
          main = "Density plot of OTU richness",
          xlab = "OTU richness")

### Check linearity of models with normal qq plots 
ggqqplot(alpha.diversity$Shannon)

### Significance tests for normality 
shapiro.test(alpha.diversity$Shannon)

### Levene test for homogeneity of variances 
leveneTest(Shannon ~ farmer_type, data=data)

### Data are normal

var.test (Shannon ~ farmer_type, data=data)

t.test(Shannon ~ farmer_type, data=data, var.equal= F)

#############################################################################################################################################
#############################################################################################################################################

#
### Table for alpha diversity measure (Shannon index) in external seed data
#

alpha.diversity1 <-estimate_richness(phyloseq_rel.abundance_soil_external seed, measures=("Shannon")) 
data1 <- cbind(sample_data(phyloseq_rel.abundance_soil_external seed), alpha.diversity1) ### Combine metadata with alpha diversity
data1

####################################################################################################################################################################

#
### ANOVA test for data from regions with different humidity in the external seed
#

#
### ANOVA test for maize type data
#

### One way ANOVA
### Dependent variable (data) : observed richness 
### Independent variable (factor): farmer type

anova2<-aov(Shannon ~ farmer_type, data = data1)
summary(anova2)
TukeyHSD(anova2)
boxplot(Shannon ~ farmer_type, data = data1)

### Check normality with visual methods  
ggdensity(alpha.diversity1$Shannon, 
          main = "Density plot of OTU richness",
          xlab = "OTU richness")

### Check linearity of models with normal qq plots 
ggqqplot(alpha.diversity1$Shannon)

### Significance tests for normality 
shapiro.test(alpha.diversity1$Shannon)

### Levene test for homogeneity of variances 
leveneTest(Shannon ~ farmer_type, data=data1)

#
### Data are not normal, perform nonparametric test:
### U-Mann Whitney test: no parametric
#

#
### U-Mann Whitney test: no parametric
#

###
### Load libraries
###

library(survival)
library(coin)

### U-Mann Whitney test

Tzotzil_low humidity = c(5.999637, 5.552072, 5.881002, 6.142192, 5.862330, 5.959907, 6.045393, 6.056546, 6.114459, 5.875073, 5.989669, 6.111268)
Mestizo_medium humidity = c(6.128975, 6.102551, 6.133422, 5.566763, 6.075705, 6.082654, 6.175176, 6.164910, 6.035532, 5.841083)

wilcox.test(Tzotzil_low humidity, Mestizo_medium humidity)

################################################################################################################################################
################################################################################################################################################

#
### Plot Beta Diversity
#

#
### Local maize seed - NMDS
#

### Table for diversity measures and sample data
beta.diversity <-estimate_richness(phyloseq_rel.abundance_soil_local seed, measures=("Shannon"))

### Verify what is there 
otu_table(phyloseq_rel.abundance_soil_local seed)
any(taxa_sums(phyloseq_rel.abundance_soil_local seed) == 0)
phyloseq_rel.abundance_soil_local seed_beta<- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_local seed) > 0, phyloseq_rel.abundance_soil_local seed)
phyloseq_rel.abundance_soil_local seed_beta
sample_data(phyloseq_rel.abundance_soil_local seed_beta)

### NMDS Analysis
nmds = distance(phyloseq_rel.abundance_soil_local seed_beta, method = "bray")
nmds
ordination = ordinate(phyloseq_rel.abundance_soil_local seed_beta, method = "NMDS", distance = nmds)
ordination
scores(ordination)

### Plot NMDS 
pnmds1 <- plot_ordination(phyloseq_rel.abundance_soil_local seed_beta, ordination, color="farmer_type", shape = "farmer_type") + theme(aspect.ratio=1)+geom_point(size=3)+
  stat_ellipse(geom ="polygon", fill= NA, type="norm", alpha=0.4,aes(fill=farmer_type)) +
  labs(color = "Regiones", shape = "Regiones") +
  scale_color_discrete(labels=c("Mestizo" = "R2.Humedad media", "Tzotzil" = "R1.Humedad baja")) +
  scale_shape_discrete(labels=c("Mestizo" = "R2.Humedad media", "Tzotzil" = "R1.Humedad baja")) +
  theme(legend.position = "right") +
  theme(axis.text = element_text(size=10))
pnmds1

#
### Save plot
#
ggsave(filename = "semilla local y regiones1y2NMDS.png", width = 13, height = 13, dpi = 300, units = "cm")

#
### Tests
#

### Statistical tests about the community 

### PERMANOVA: Adonis
sampledf <- data.frame(sample_data(phyloseq_rel.abundance_soil_local seed_beta)) ### Transform the sample information into a dataframe 

###  Test 
adonis2(nmds ~ farmer_type, data = sampledf) 

#################################################################################################################################################
#################################################################################################################################################

#
### External maize seed - NMDS
#

### Table for diversity measures and sample data
beta.diversity2 <-estimate_richness(phyloseq_rel.abundance_soil_external seed, measures=("Shannon"))

### Verify what is there 
otu_table(phyloseq_rel.abundance_soil_external seed)
any(taxa_sums(phyloseq_rel.abundance_soil_external seed) == 0)
phyloseq_rel.abundance_soil_external seed_beta2<- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil_external seed) > 0, phyloseq_rel.abundance_soil_external seed)
phyloseq_rel.abundance_soil_external seed_beta2
sample_data(phyloseq_rel.abundance_soil_external seed_beta2)

### NMDS Analysis
nmds = distance(phyloseq_rel.abundance_soil_external seed_beta2, method = "bray")
nmds
ordination = ordinate(phyloseq_rel.abundance_soil_external seed_beta2, method = "NMDS", distance = nmds)
ordination
scores(ordination)

### Plot NMDS 
pnmds2 <- plot_ordination(phyloseq_rel.abundance_soil_external seed_beta2, ordination, color="farmer_type", shape = "farmer_type") + theme(aspect.ratio=1)+geom_point(size=3)+
  stat_ellipse(geom ="polygon", fill= NA, type="norm", alpha=0.4,aes(fill=farmer_type)) +
  labs(color = "Regiones", shape = "Regiones") +
  scale_color_discrete(labels=c("Tzotzil" = "R1.Humedad baja","Mestizo" = "R2.Humedad media")) +
  scale_shape_discrete(labels=c("Tzotzil" = "R1.Humedad baja","Mestizo" = "R2.Humedad media")) +
  theme(legend.position = "right")
pnmds2

#
### Save plot
#
ggsave(filename = "semilla externa y regiones1y2NMDS.png", width = 13, height = 13, dpi = 300, units = "cm")

#
### Tests
#

### Statistical tests about the community 

### PERMANOVA: Adonis
sampledf1<- data.frame(sample_data(phyloseq_rel.abundance_soil_external seed_beta2)) ### Transform the sample information into a dataframe 

###  Test 
adonis2(nmds ~ farmer_type, data = sampledf1)
