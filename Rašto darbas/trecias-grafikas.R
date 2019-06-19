if(!require(rsdmx))install.packages("rsdmx");require(rsdmx)
if(!require(openxlsx))install.packages("openxlsx");require(openxlsx)
if(!require(tidyverse))install.packages("tidyverse");require(tidyverse)

################################################################################
#meta duomenu failo siuntimas ir manulaus lenteles ID identifikavimas rankiniu budu
#per exceli, kai ieskoma "18−64 metų amžiaus asmenys, kurių užimtumui įtakos turėjo
#vaiko priežiūros pareigos"
#daugiau info "https://osp.stat.gov.lt/rdb-rest"
################################################################################
#url yra standartinis LSD adresas meta duomenims
################################################################################

#url <- "https://osp-rs.stat.gov.lt/rest_xml/dataflow/"

#meta <- readSDMX(url)

#meta <- as.data.frame(meta)

###############################################################################
#Duomenu is LSD parsiuntimas naudojant paketa "rsdmx"
###############################################################################


S3R0156_M3031020 <- readSDMX(providerId = "LSD",
                             resource = "data",
                             flowRef = "S3R0156_M3031020",
                             dsd = TRUE)



S3R0156_M3031020 <- as.data.frame(S3R0156_M3031020, label = TRUE)

##############################################################################
#DUomenu is LSD apdorojimas ir paruosimas grafikui
##############################################################################

df2 <- S3R0156_M3031020 %>%
  filter(S3R0156_M3031020$poveikisM3031020_label.en=="Being on parental or another family leave")

df2<-df2[c(2,3),]




p4<-ggplot(df2,aes(y=df2$obsValue, x=df2$Lytis_label.lt))+
  geom_bar(stat = "identity",fill="mistyrose3",width=0.5,color="black")+
  theme(axis.text.x = element_text(angle = 45,hjust = 1,size = 25),
        axis.text.y = element_text(hjust = 1,size = 25),
        panel.background = element_rect(fill = 'mistyrose2'),
        panel.grid.minor = element_line(color = 'azure4'),
        panel.grid.major = element_line(color = '#586174'),
        axis.title = element_text(size = 25, color="black"),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size =23))+
  labs(title = "18−64 metų amžiaus asmenys, kurių užimtumui įtakos turėjo vaiko priežiūros pareigos",
       subtitle = "Source: LSD",
       x = "Lytis",
       y = "Procentai")
png(filename = "paveiksliukas4.png",
    width = 1200, height = 800, units = "px", pointsize = 12,    bg = "white")
print(p4)
dev.off()













