library(magick)
library(tidyverse)

logos <- map2(
list.files() %>% 
  str_subset(".png$") %>% 
  map(~image_read(.x)), 
list("450x183!", "216x183"),
~ image_resize(.x,.y)) %>% 
  reduce(c)

img <- c(
  logos[1],
  image_blank("200","100","white") %>% 
  image_annotate("En colaboración con:",gravity = "Center",size = 20),
  logos[2]
  )


image_append(image_scale(img, "300"), stack = TRUE) %>% 
  image_write("front_imgae.png")


