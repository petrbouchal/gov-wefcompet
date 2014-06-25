library(ggvis)
library(rCharts)

library(ggvis)
diamonds %>% ggvis(x = ~table, fill=~cut) %>%
  group_by(cut) %>%
  layer_histograms(binwidth=1)

mtcars %>%
  ggvis(~wt, ~mpg) %>%
  layer_smooths(span = input_slider(0.5, 1, value = 1)) %>%
  layer_points(size := input_slider(100, 1000, value = 100))

# Scatter plot with hovering
mtcars %>% ggvis(x = ~wt, y = ~mpg, size.hover := 200) %>%
  layer_points()

# Larger point and outline when hovering
mtcars %>%
  ggvis(x = ~wt, y = ~mpg, size.hover := 200,
        stroke := NA, stroke.hover := "red", strokeWidth := 3) %>%
  layer_points()

# Line changes color and points change size when hovered over, with 250 ms
# transition time
pressure %>% ggvis(x = ~temperature, y = ~pressure) %>%
  layer_paths(stroke.hover := "red", strokeWidth.hover := 4, strokeWidth := 2) %>%
  layer_points(size := 50, size.hover := 200) %>%
  set_options(hover_duration = 250)

# Hover with layer_smooths
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points() %>%
  layer_smooths(fill.hover := "red", se = TRUE)

# Opacity with layer_densities
PlantGrowth %>% group_by(group) %>%
  ggvis(x = ~weight, stroke = ~group, fill = ~group,
        fillOpacity := 0.2, fillOpacity.hover := .5) %>%
  layer_densities()

all_values <- function(x) {
  if(is.null(x)) return(NULL)
  paste0(names(x), ": ", format(x), collapse = "<br />")
}
base <- mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points()
base %>% add_tooltip(all_values, "hover")
base %>% add_tooltip(all_values, "click")
