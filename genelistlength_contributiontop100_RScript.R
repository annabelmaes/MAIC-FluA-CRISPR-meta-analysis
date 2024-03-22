library(readxl)
x <- read_excel("top100bygenelistlength.xlsx", 
                                     sheet = "top100bylistlength")


library(ggplot2)

names(x)[3] <- "top100"

p <- ggplot(data = x,aes(x=Max, y = top100)) + 
  geom_point(size = 3, color = "#00AFBB") +
  geom_text_repel(aes(label = Screen), color = "black", size = 5) + 
  xlim(0,2500) +
  theme_bw()+
    theme(panel.border = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black"))+
  theme(text=element_text(size=21)) +
  scale_color_discrete(name = "", labels = c("Brunello library", "Custom library")) + 
  theme(legend.position = "top") +
  xlab("Gene list length") + 
  ylab("Contribution to MAIC top 100 
  (number of genes)")





svg(file = "listlength_contribution.svg",   
    width = 10, 
    height = 5) 
print(p)


dev.off()
