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
phyloseq_rel.abundance_soil_landrace
phyloseq_rel.abundance_soil_hybrid
phyloseq_rel.abundance_soil_tzotzil
phyloseq_rel.abundance_soil_mestizo

###################################################################################################################################################################
####################################################################################################################################################################

#
### Plot Alpha Diversity 
#

### 16s soil

#
### Richness in terms of Chao1 by maize type
#
plot_richness(phyloseq_rel.abundance_soil, x= "maize_type", color="maize_type", measures=("Chao1")) +
  geom_boxplot(aes(x=maize_type, y=value, color=NULL), alpha=0.1) + geom_jitter() +
  ggtitle("(A)")

#
### Save plot
#
ggsave(filename = "Chao1 by maize type.png", width = 8, height = 12, dpi = 300, units = "cm")

##################################################################################################################################################################

#
### Richness in terms of Chao1 by farmer type
#
plot_richness(phyloseq_rel.abundance_soil, x= "farmer_type", color="farmer_type", measures=("Chao1")) +
  geom_boxplot(aes(x=farmer_type, y=value, color=NULL), alpha=0.1) + geom_jitter() +
  ggtitle("(B)")

#
### save plot
#
ggsave(filename = "Chao1 by farmer type.png", width = 8, height = 12, dpi = 300, units = "cm")

###################################################################################################################################################################

#
### Table for diversity measures and sample data
#

alpha.diversity <-estimate_richness(phyloseq_rel.abundance_soil, measures=("Chao1")) 
data <- cbind(sample_data(phyloseq_rel.abundance_soil), alpha.diversity) ### Combine metadata with alpha diversity
data

####################################################################################################################################################################

#
### ANOVA test to check that the data meets the assumptions
#

#
### ANOVA test for maize type data
#

### One way ANOVA
### Dependent variable (data) : observed richness 
### Independent variable (factor): maize type

anova1<-aov(Chao1 ~ maize_type, data = data)
summary(anova1)
TukeyHSD(anova1)
boxplot(Chao1 ~ maize_type, data = data)

### Check normality with visual methods  
ggdensity(alpha.diversity$Chao1, 
          main = "Density plot of OTU richness",
          xlab = "OTU richness")

### Check linearity of models with normal qq plots 
ggqqplot(alpha.diversity$Chao1)

### Significance tests for normality 
shapiro.test(alpha.diversity$Chao1)

### Levene test for homogeneity of variances 
leveneTest(Chao1 ~ maize_type, data=data)

#
### Data are not normal, perform nonparametric test:
### U-Mann Whitney test: no parametric
#

######################################################################################################################################################################

#
### Maize type data
#

#
### U-Mann Whitney test: no parametric
#

###
### Load libraries
###

library(coin)
library(survival)

### U-Mann Whitney test

Landrace = c(1066.5949, 630.3438, 979.0403, 1127.6933, 1155.7341, 1128.5189, 1045.6765, 1156.6319, 1152.6053, 1021.0892, 1063.7586, 1070.4365, 1182.0303, 1036.5195, 1138.3571, 1124.3678, 1183.6607, 1209.6647, 1238.8810, 1114.2500)
Hybrid = c(1058.4393, 1115.8780, 1003.1136, 1155.9211, 1051.1897, 1087.0347, 1158.6875, 1120.8571, 1126.6183, 939.1533, 1205.4483, 1117.0186, 1140.5617, 1088.0000, 1172.0940, 1071.0420, 1103.1500, 1097.0244, 1110.6221, 1165.5780, 1136.6446, 1272.1240)

wilcox.test(Landrace, Hybrid)

#################################################################################################################################################################

#
### ANOVA test to check that the data meets the assumptions
#

#
### ANOVA test for farmer type data
#

### One way ANOVA
### Dependent variable (data) : observed richness 
### Independent variable (factor): farmer type

anova2<-aov(Chao1 ~ farmer_type, data = data)
summary(anova2)
TukeyHSD(anova2)
boxplot(Chao1 ~ farmer_type, data = data)

### Check normality with visual methods  
ggdensity(alpha.diversity$Chao1, 
          main = "Density plot of OTU richness",
          xlab = "OTU richness")

### Check linearity of models with normal qq plots 
ggqqplot(alpha.diversity$Chao1)

### Significance tests for normality 
shapiro.test(alpha.diversity$Chao1)

### Levene test for homogeneity of variances 
leveneTest(Chao1 ~ farmer_type, data=data)

#
### Data are not normal, perform nonparametric test:
### U-Mann Whitney test: no parametric
#

#####################################################################################################################################################################

#
### Farmer type data
#

#
### U-Mann Whitney test: no parametric
#

###
### Load libraries
###

library(coin)
library(survival)

### U-Mann Whitney test

Tzotzil = c(1066.5949, 630.3438, 979.0403, 1182.0303, 1036.5195, 1138.3571, 1124.3678, 1183.6607, 1209.6647, 1058.4393, 1115.8780, 1003.1136, 1155.9211, 1051.1897, 1087.0347, 1158.6875, 1120.8571, 1126.6183, 939.1533, 1165.5780, 1114.2500, 1272.1240)
Mestizo = c(1127.6933, 1155.7341, 1128.5189, 1045.6765, 1156.6319, 1152.6053, 1021.0892, 1063.7586, 1070.4365, 1205.4483, 1117.0186, 1140.5617, 1088.0000, 1172.0940, 1071.0420, 1103.1500, 1097.0244, 1110.6221, 1238.8810, 1136.6446)

wilcox.test(Tzotzil, Mestizo)

#################################################################################################################################################################
#################################################################################################################################################################
#################################################################################################################################################################

#
### Plot Beta Diversity
#

### 16s soils

#
### Maize type - NMDS
#

### Table for diversity measures and sample data
beta.diversity <-estimate_richness(phyloseq_rel.abundance_soil, measures=("Chao1"))

### Verify what is there 
otu_table(phyloseq_rel.abundance_soil)
any(taxa_sums(phyloseq_rel.abundance_soil) == 0)
phyloseq_rel.abundance_soil_beta<- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil) > 0, phyloseq_rel.abundance_soil)
phyloseq_rel.abundance_soil_beta
sample_data(phyloseq_rel.abundance_soil_beta)

### NMDS Analysis
nmds = distance(phyloseq_rel.abundance_soil_beta, method = "bray")
nmds
ordination = ordinate(phyloseq_rel.abundance_soil_beta, method = "NMDS", distance = nmds)
ordination
scores(ordination)

### Plot NMDS 
p1 <- plot_ordination(phyloseq_rel.abundance_soil_beta, ordination, color="maize_type", shape = "maize_type", title = "(A)") + theme(aspect.ratio=1)+geom_point(size=3)+
  stat_ellipse(geom ="polygon", fill= NA, type="norm", alpha=0.4,aes(fill=maize_type))
p1

### Save plot
ggsave(filename = "NMDS_maize type.png", width = 8, height = 10, dpi = 300, units = "cm")

##########################################################################################################################################################################

#
### Tests
#

### Statistical tests about the community 

### PERMANOVA: Adonis
sampledf <- data.frame(sample_data(phyloseq_rel.abundance_soil_beta)) ### Transform the sample information into a dataframe 

###  Test with the variable of maize type 
adonis2( nmds ~ maize_type, data = sampledf) 

####################################################################################################################################################################
####################################################################################################################################################################

#
### Farmer type - NMDS
#

### Table for diversity measures and sample data
beta.diversity <-estimate_richness(phyloseq_rel.abundance_soil, measures=("Chao1"))

### Verify what is there 
otu_table(phyloseq_rel.abundance_soil)
any(taxa_sums(phyloseq_rel.abundance_soil) == 0)
phyloseq_rel.abundance_soil_beta<- prune_taxa(taxa_sums(phyloseq_rel.abundance_soil) > 0, phyloseq_rel.abundance_soil)
phyloseq_rel.abundance_soil_beta
sample_data(phyloseq_rel.abundance_soil_beta)

### NMDS Analysis
nmds = distance(phyloseq_rel.abundance_soil_beta, method = "bray")
nmds
ordination = ordinate(phyloseq_rel.abundance_soil_beta, method = "NMDS", distance = nmds)
ordination
scores(ordination)

### Plot NMDS 
p2 <- plot_ordination(phyloseq_rel.abundance_soil_beta, ordination, color="farmer_type", shape = "farmer_type", title = "(B)") + theme(aspect.ratio=1)+geom_point(size=3)+
  stat_ellipse(geom ="polygon", fill= NA, type="norm", alpha=0.4,aes(fill=farmer_type))
p2

### Save plot
ggsave(filename = "NMDS__farmer type.png", width = 8, height = 10, dpi = 300, units = "cm")

##########################################################################################################################################################################

#
### Tests
#

### Statistical tests about the community 

### PERMANOVA: Adonis
sampledf <- data.frame(sample_data(phyloseq_rel.abundance_soil_beta)) ### Transform the sample information into a dataframe 

###  Test with the variable of farmer type 
adonis2( nmds ~ farmer_type, data = sampledf) 
