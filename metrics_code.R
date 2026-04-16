
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
                         Raw = c(1,
                                                   7,
                                                   4,
                                                   6,
                                                   0,
                                                   4,
                                                   7,
                                                   12,
                                                   14,
                                                   16),
                         Cumulative = cumsum(c(1,
                                             7,
                                             4,
                                             6,
                                             0,
                                             4,
                                             7,
                                             12,
                                             14,
                                             16)))
metrics_df_l <- tidyr::pivot_longer(metrics_df, cols = c(-year, -date))

n_proj_p <- 
ggplot(data= metrics_df_l, aes(x = date, y = value, 
                             color = name))+
  geom_point(size = 4)+
  scale_color_manual("Curve", values = c("#C00000", "#00A"))+
  geom_line(aes(group = name))+
  theme_bw(base_size = 18)+
  labs(x = "Month", 
       y = "Number of Projects", 
       title = "Number of Full Consulting Projects - FY26", 
        subtitle = "For FY 2026")+
  theme(legend.position = c(0.2, 0.8), 
        legend.background =  element_rect(color = "black"))+
  coord_fixed(ratio = 1/10)


p <- ggplotly(n_proj_p)

saveWidget(
  p,
  file = "docs/scs_metrics_projects.html",
  selfcontained = FALSE
)
