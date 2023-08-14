#Plot proviral GSEA dataset
library(ggplot2)
A <- ggplot(gsea_PV_posNES, aes (x=leadingEdgeNum, y = reorder(Pathway,logpadj))) + 
  geom_point(aes(color = normalizedEnrichmentScore, size = logpadj)) + 
  labs(x ="Number of Genes", y = "",
       color = "NES",
       size = "-log10 (padj)") +
  scale_size(range = c(3,12)) + 
  scale_colour_gradientn(colours = c("blue", "red")) +
  theme(text = element_text(size = 20),
        panel.background = element_rect(fill="white", colour="black", size=0.5, 
                                        linetype="solid", color="black"),
        panel.grid.major = element_line(size = 0.1, linetype = 'dotted',
                                        colour = "grey") )  

#Plot antiviral GSEA dataset
library(ggplot2)
B <- ggplot(gsea_AV, aes (x=leadingEdgeNum, y = reorder(Pathway,logpadj))) + 
  geom_point(aes(color = normalizedEnrichmentScore, size = logpadj)) + 
  labs(x ="Number of Genes", y = "",
       color = "NES",
       size = "-log10 (padj)") +
  scale_size(range = c(3,12)) + 
  scale_colour_gradientn(colours = c("blue", "red")) +
  scale_x_continuous(limits=c(11, 24)) + 
  theme(text = element_text(size = 20),
        panel.background = element_rect(fill="white", colour="black", size=0.5, 
                                        linetype="solid", color="black"),
        panel.grid.major = element_line(size = 0.1, linetype = 'dotted',
                                        colour = "grey") )  

#plot proviral and antiviral figures underneath each other
library(cowplot)
plot_grid(A, B, align = "v", nrow = 2, rel_heights = c(3/4, 1/4), labels = c ("C", "D"))