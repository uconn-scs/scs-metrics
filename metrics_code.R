
library(plotly)
library(htmlwidgets)

metrics_df <- data.frame(date = 1:10, 
                         n_projects = cumsum(1:10))

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
