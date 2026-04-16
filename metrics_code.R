
library(ggplot2)
library(plotly)
library(htmlwidgets)

metrics_df <- data.frame(year = c("FY26"),
                         date = factor(c("Jul", 
                                  "Aug",
                                  "Sep",
                                  "Oct",
                                  "Nov",
                                  "Dec",
                                  "Jan",
                                  "Feb",
                                  "Mar",
                                  "Apr"),
                                  levels = c("Jul", 
                                    "Aug",
                                    "Sep",
                                    "Oct",
                                    "Nov",
                                    "Dec",
                                    "Jan",
                                    "Feb",
                                    "Mar",
                                    "Apr"),
                                   ordered = TRUE),
                                  
                         n_projects = cumsum(c(1,
                                             7,
                                             4,
                                             6,
                                             0,
                                             4,
                                             7,
                                             12,
                                             14,
                                             16)))
n_proj_p <- 
ggplot(data= metrics_df, aes(x = date, y = n_projects, 
                             color = year))+
  geom_point(size = 4)+
  scale_color_manual(values ="#C00000")+
  geom_line(aes(group = 1))+
  theme_bw(base_size = 18)+
  labs(x = "Month", 
       y = "Number of Projects (Cumulative)", 
       title = "Number of Full Consulting Projects - FY26", 
        subtitle = "For FY 2026")+
  theme(legend.position = "none")+
  coord_fixed(ratio = 1/10)

p <- ggplotly(n_proj_p)

saveWidget(
  p,
  file = "docs/scs_metrics_projects.html",
  selfcontained = FALSE
)
