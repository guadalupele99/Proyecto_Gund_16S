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

#
### Accumulation curve for maize type data 
#

### Get the accumulation curve counting for maize hybrid data
select = phyloseq_rel.abundance_soil_hybrid ### Select data
data = t(otu_table(select)) ### OTU table in vegan
data  

### Plot
plot(specaccum(data))

### Get the accumulation curve counting for maize landrace data
select = phyloseq_rel.abundance_soil_landrace ### Select data
data = t(otu_table(select)) ### OTU table in vegan
data  

### Plot
plot(specaccum(data))

######################################################################################################################################################################

#
### Accumulation curve for farmer type data
#

### Get the accumulation curve counting for farmer Mestizo data
select = phyloseq_rel.abundance_soil_mestizo ### Select data
data = t(otu_table(select)) ### OTU table in vegan
data  

### Plot
plot(specaccum(data))

### Get the accumulation curve counting for farmer Tzotzil data
select = phyloseq_rel.abundance_soil_tzotzil ### Select data
data = t(otu_table(select)) ### OTU table in vegan
data  

### Plot
plot(specaccum(data))

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
### Kruskal-Wallis test: no parametric
#

######################################################################################################################################################################

#
### Maize type data
#

#
### Kruskal-Wallis test: no parametric
#

head(data)
levels(data$maize_type)

### Obtain diagnostic measurements 
group_by(data, maize_type) %>%
  summarise(
    count = n(),
    mean = mean(Chao1, na.rm = TRUE),
    sd = sd(Chao1, na.rm = TRUE), 
    median = median(Chao1, na.rm = TRUE),
    IQR = IQR(Chao1, na.rm = TRUE)
  )

### Kruskal-Wallis test 
KW1<- kruskal.test(Chao1 ~ maize_type, data)
KW1

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
### Kruskal-Wallis test: no parametric
#

#####################################################################################################################################################################

#
### Farmer type data
#

#
### Kruskal-Wallis test: no parametric
#

head(data)
levels(data$farmer_type)

### Obtain diagnostic measurements 
group_by(data, farmer_type) %>%
  summarise(
    count = n(),
    mean = mean(Chao1, na.rm = TRUE),
    sd = sd(Chao1, na.rm = TRUE), 
    median = median(Chao1, na.rm = TRUE),
    IQR = IQR(Chao1, na.rm = TRUE)
  )

### Kruskal-Wallis test 
KW2<- kruskal.test(Chao1 ~ farmer_type, data)
KW2

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
