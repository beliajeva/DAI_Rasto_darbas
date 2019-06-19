if(!require(eurostat))install.packages("eurostat");require(eurostat)
if(!require(tidyverse))install.packages("tidyverse");require(tidyverse)


sdg_05_30 <- get_eurostat("sdg_05_30", stringsAsFactors = FALSE)


df <- sdg_05_30 %>% filter(geo%in% c("LT"),
                           time >= "2014-01-01")


p3<-ggplot(df, aes(x=time, y=values))+
  geom_line(size=1.4,color="skyblue3")+
  scale_x_date(date_labels = "%Y",
               date_breaks = "1 year")+
  theme(axis.text.x = element_text(angle = 45,hjust = 1,size = 25),
        axis.text.y = element_text(hjust = 1,size = 25),
        panel.background = element_rect(fill = 'skyblue4'),
        panel.grid.minor = element_line(color = 'azure4'),
        panel.grid.major = element_line(color = '#586174'),
        axis.title = element_text(size = 25, color="black"),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size =23))+
  labs(title = "Gender employment gap in Lithuania",
       subtitle = "Šaltinis: Eurostat (sdg_05_30)",
       x = "Data",
       y = "Indeksas")
png(filename = "paveiksliukas3.png",
    width = 1200, height = 800, units = "px", pointsize = 12,    bg = "white")
print(p3)
dev.off()

    
