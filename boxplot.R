###############################################################################################
###############################################################################################
# The Figures might have been adjusted afterwards for publishing using external software      #
# however without altering the representation of the data.                                    #
###############################################################################################
###############################################################################################
library(ggplot2)
library(openxlsx)

theme_set(theme_pubclean())
setwd(file_path)
data <- read.xlsx("*.xlsx",colNames = T, sheet = 1)

data$Response <- as.factor(data$Response)
compare<-list(c('SDPD','CRPR'))

e2 <- ggplot(data, aes(x = Response, y = TMB)) +
  geom_boxplot(width = 0.7, outlier.shape = NA, color = "black") +
  geom_jitter(aes(color = Response), width = 0.2, size = 3, alpha = 0.7) +
  stat_compare_means(comparisons =compare )+
  xlab("") + ylab("TMB (mutations/Mb)") +
  theme(axis.line = element_line(linewidth = 1, colour = "black")) +
  theme(axis.text.x = element_text(size = 12, color = "black", face = "bold")) +
  theme(axis.text.y = element_text(size = 12, color = "black", face = "bold")) +
  theme(axis.title.y = element_text(face = "bold", size = 12, color = "black")) +
  scale_color_manual(values = c("CRPR" = "#F0C849", "SDPD" = "#4F7CAC")) +  
  guides(fill = FALSE)

e2

