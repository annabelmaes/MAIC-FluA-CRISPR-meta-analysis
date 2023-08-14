#load data 

#load
library(pheatmap)

df <- heatmap_AV
df <- heatmap_PV

head(df)
#gene      Gao   Heaton   Sharon Trimarco maic_score
#1   ALYREF 1.267060 1.260452 0.000000 1.166325   3.693837
#2    FOCAD 1.266287 1.207226 1.164933 0.000000   3.638446
#3 HIST1H1C 0.000000 1.304334 1.164929 1.166293   3.635556
#4    TAF1L 1.274018 0.000000 1.164935 1.173187   3.612140
#5 KRTAP6-2 0.000000 1.207883 1.164922 1.195428   3.568233
#6    KCNG1 0.000000 1.220652 1.164934 1.173416   3.559003

dim(df)
#[1] 50  6

#select columns for heatmap and convert to matrix
df_num <- as.matrix(df[,2:17]) #PV
df_num <- as.matrix(df[,2:6]) #AV

#set gene symbols as rownames from matrix
rownames(df_num) <- df$gene


#load libraries
library(RColorBrewer)
library(pheatmap)

#make heatmap
pheatmap(df_num, main = "pheatmap default",cluster_rows=F, cluster_cols=F,
         color=colorRampPalette(c("white","turquoise3","turquoise4"))(100),fontsize=9, border_color="black")