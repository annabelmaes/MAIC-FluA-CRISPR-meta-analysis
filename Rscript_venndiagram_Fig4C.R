# Load library
library(VennDiagram)



#Load file with 3 columns (crispr, rnai and essential genes), with each containing their respective genes

# generate a list, whilst removing NA values
x <- list(na.omit(Venn_crisprRNAiess$CRISPR),na.omit(Venn_crisprRNAiess$RNAi), na.omit(Venn_crisprRNAiess$Essential))

#generate venn diagram and export/draw
temp <- venn.diagram(x,category.names = c("CRISPR" , "RNAi" , "Essential"), filename =NULL,
                    file=NULL, fill = c("#D4AA3A", "#CF223B", "lightseagreen"), alpha = c(0.4, 0.4, 0.4))
ggsave(temp, file="Fig4c_venndiagram_crispr-rnai-essential.svg", device = "svg") #to save

grid.draw(temp) #to plot