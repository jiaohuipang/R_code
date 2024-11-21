
library(forestplot)
library(openxlsx)

setwd(file_path)
tbl <- read.xlsx("*.xlsx",colNames = T, sheet = 1)

forestplot(tbl[,1:4],
           mean = tbl$HR, lower = tbl$lower95, upper = tbl$upper95,
           title = "",
           xlab="Hazard Ratio",
           cex=2,
           xticks.digits = 0,
           xticks = c(0.1, 1, 10),
           boxsize = 0.2,
           graph.pos = 3,
           lty.ci = 7,  
           lwd.ci = 2,
           txt_gp = fpTxtGp(ticks = gpar(cex=1),xlab = gpar(cex = 1.2),cex=1),
           xlog= TRUE,
           col=fpColors(box="black",line="black", summary="dodgerblue2"))
