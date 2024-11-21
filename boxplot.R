###############################################################################################
###############################################################################################
# The Figures might have been adjusted afterwards for publishing using external software      #
# however without altering the representation of the data.                                    #
###############################################################################################
###############################################################################################

library(ggplot2)
library(ggpubr)
library(openxlsx)
library (grid)
theme_set(theme_pubclean())

setwd(file_path)
mydata <- read.xlsx("*.xlsx",colNames = T, sheet = 1)

# Default plot
e <- ggplot(mydata, aes(x =Response, y = TMB))
e + geom_boxplot()
compare<-list(c('SDPD','CRPR'))
e + geom_boxplot(notch = TRUE, fill = "#2E9FDF")+
  stat_compare_means(comparisons =compare )+
  stat_summary(fun= mean, geom = "point",
               shape = 18, size = 2.5, color = "#E7B800")
e2 <- e + geom_boxplot(
  aes(fill = Type),width = 0.5,
  position = position_dodge(0.6)
) + 
  xlab("") + ylab("TMB(mutations/Mb)")+
  theme(axis.line = element_line(linewidth=1, colour = "black"))+
  theme(axis.text.x = element_text(size = 12,  color = "black", face = "bold"))+
  theme(axis.text.y = element_text(size = 12,  color = "black", face = "bold"))+
  theme(axis.title.y=element_text(face="bold",size=12,color="black"))+
  scale_fill_manual(values = c("#2E9FDF", "#E7B800"))+guides(fill=FALSE)

e2

p1 <- e2 + coord_cartesian(ylim = c(0, 20)) + 
  theme_classic()+
  theme(legend.position="none")+theme(axis.line = element_line(linewidth=1, colour = "black"))+
  theme(axis.text.x = element_text(size = 12,  color = "black", face = "bold"))+
  theme(axis.text.y = element_text(size = 12,  color = "black", face = "bold"))+
  theme(axis.title.y=element_text(face="bold",size=12,color="black"))+guides(fill=FALSE)

p2 <-e2 + coord_cartesian(ylim = c(20, 50)) + 
  theme_classic() +
  theme(axis.line.x = element_line(colour="white"),
        axis.text.x = element_blank(), axis.ticks.x = element_blank(),
        legend.position = c(0.9, 0.9))+theme(axis.line = element_line(linewidth=1, colour = "black"))+ ylab("")+
  theme(axis.text.x = element_text(size = 12,  color = "black", face = "bold"))+
  theme(axis.text.y = element_text(size = 12,  color = "black", face = "bold"))+
  theme(axis.title.y=element_text(face="bold",size=12,color="black"))+guides(fill=FALSE)

grid.newpage() 
plot_site1 <- viewport(x = 0.008, y = 0, width = 0.9, height = 0.6, just = c('left', 'bottom')) 
plot_site2 <- viewport(x = 0.008, y = 0.6, width = 0.9, height = 0.3, just = c('left', 'bottom')) 
print(p1, vp = plot_site1)
print(p2, vp = plot_site2)

