library(dplyr)
library("randomcoloR")
devtools::install_github("djnavarro/jasmines")
library(jasmines)

make_art <- function(seed){
  x <- c(1:100)
  p0 <- use_seed(seed) %>%
    scene_discs(
      rings = sample(x, 1, replace=TRUE), 
      points = sample(1:100000, 1, replace=TRUE), 
      size = sample(x, 1, replace=TRUE)
    ) %>%
    mutate(ind = 1:n()) %>%
    unfold_warp(
      iterations = 10,
      scale = sample(0.1:0.8, 1, replace=TRUE), 
      output = "layer" 
    ) %>%
    unfold_tempest(
      iterations = 5,
      scale = .01
    ) %>%
    style_ribbon(
      color = randomColor(1),
      colour = randomColor(1),
      alpha = c(1,1),
      background = randomColor(1)
    )
  ggsave("make_art_pic.png", p0, width = 20, height = 20, units = "in")
}
