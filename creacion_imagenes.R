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


list.files() %>% 
  str_subset("sense.*logo|mit.*logo") %>% 
  map(~image_read(.x) %>% 
        image_resize("300x300")) %>% 
  reduce(c) %>% 
  image_append %>% 
  image_write("mit_sesnse.png")

c(
"monitour_home.png",
"monitour_guide.png") %>% 
  map(~image_read(.x) %>% 
        image_resize("350x400!") %>% 
        image_write(.x))

image_read("data_usa.png") %>% 
  image_resize("400x400!") %>% 
  image_write("data_usa.png")
