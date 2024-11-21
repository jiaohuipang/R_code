############ R packages ############
library(openxlsx)
library("survival")
library("survminer")

setwd(file_path)
mydat<- read.xlsx("*.xlsx",colNames = T, sheet = 1)

fit<- survfit(Surv(mydat$OS,mydat$OS_status) ~ mydat$P1_index, data=mydat)
ggsurvplot(fit, data = mydat)
survp1 <- ggsurvplot(fit,data = mydat,
                     xlab = "Time(Months)", ylab = "Overall Survival",
                     font.tickslab = c(10, "bold", "black"), font.title= c(10, "bold", "black"),
                     font.x= c(10, "bold", "black"), font.y= c(10, "bold", "black"),
                     risk.table = TRUE, risk.table.y.text.col=TRUE,
                     tables.height = 0.3, censor.size = 3, fontsize = 3.5,
                     table.axes.offset=FALSE,
                     ggtheme = theme_bw(), 
                     legend.title = "",
                     legend.labs = c("Neg","Pos"),
                     break.y.by = 0.2,
                     palette = c("#E7B800", "#2E9FDF")
                     
)
survp1
summary(fit)$table

cox_model <- coxph(Surv(mydat$OS,mydat$OS_status) ~ mydat$P1_index, data = mydat)
hr_point_estimate <- exp(coef(cox_model))
hr_confint <- exp(confint(cox_model))
print(hr_point_estimate)
print(hr_confint)
