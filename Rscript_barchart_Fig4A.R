library(dplyr)
library(tidyverse)

#make a file with RNAi rank and MAIC rank for all RNAi genes and import as dataframe
#info of the dataframe
dim(maic.rnai)
#[1] 153   2
head(maic.rnai)
# RNAi_gene MAIC_rank
#1         1         2
#2         2         6
#3         3         7
#4         4         9
#5         5        19
#6         6        24

#rename maic.rnai to df
df <- maic.rnai

#load ggplot2 library
library(ggplot2)

#count amount of RNAi genes in each bucket of 500 in the MAIC ranking
group_by(df, group = cut(MAIC_rank, breaks = c(1, seq(from = 500, to = 12500, by = 500)),                          
                                labels = c("1-500", "501-1000", "1001-1500", "1501-2000",
                                           "2001-2500", "2501-3000", "3001-3500", "3501-4000",
                                           "4001-4500", "4501-5000", "5001-5500", "5501-6000",
                                           "6001-6500", "6501-7000", "7001-7500", "7501-8000",
                                           "8001-8500","8501-9000", "9001-9500", "9501-10000", "10001-10500",
                                           "10501-11000", "11001-11500", "11501-12000", "12001-12500"))) %>%     
summarise(median = length(RNAi_gene)) -> df2

#replace NA by >12500
df2$group <- as.character(df2$group)
df2[is.na(df2)] <- "NA"
  
#plot barchart  
p <- ggplot(data = df2, aes(x = forcats::fct_inorder(group), y = median)) +                #fct_inorder to keep the same order as in df
  geom_bar(stat = "identity", width=0.8, fill ="turquoise3", color="black") +
  theme(axis.text.x = element_text(angle = 90, vjust=0.5)) +
  xlab(label="MAIC rank (buckets of 500)") +
  ylab(label="No. of RNAi genes (n=153)")+
  theme(panel.grid.major = element_line(colour = "lightgrey", size = 0.1)) + 
  theme(panel.grid = element_line(linetype = 3)) +
  theme(panel.background = element_rect(fill = "white", color = "black")) 


pdf(file = "Fig4A_Barchart_MAIC-RNAi_bin500.pdf",   
    width = 6, 
    height = 5) 
print(p)


dev.off()