
library(plotly)
library(htmlwidgets)

metrics_df <- data.frame(year = c(FY26),
                         date = c("Jul", 
                                  "Aug",
                                  "Sep",
                                  "Oct",
                                  "Nov",
                                  "Dec",
                                  "Jan",
                                  "Feb",
                                  "Mar",
                                  "Apr"),
                                  
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

p <- plot_ly(
  data = metrics_df,
  x = ~date,
  y = ~n_projects,
  type = "scatter",
  mode = "lines+markers"
)

saveWidget(
  p,
  file = "docs/scs_metrics_projects.html",
  selfcontained = FALSE
)
