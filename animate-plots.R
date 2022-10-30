library(ggplot2)
library(gganimate)

mtcars
ggplot(mtcars, aes(factor(cyl), mpg, color = factor(gear))) + 
  geom_boxplot() + 
  labs(title = "Reimagining mtcars with gganimate",
       color = "Gears",
       x = "Cylinders",
       y = "Miles per Gallon") +
  theme_minimal(base_size = 16) +
  
  # Here comes the gganimate code
  transition_states(
    gear
    # ,
    # transition_length = 2,
    # state_length = 1
  ) +
  # enter_fade() + 
  # exit_shrink() +
  ease_aes('sine-in-out')

anim_save("output/animated-boxplot.gif")


library(gapminder)

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10(label = scales::label_number(scale = 1/1000, 
                                             suffix = "k", 
                                             prefix = "$")) +
  facet_wrap(~continent) +
  theme_minimal(base_size = 16) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', 
       x = 'GDP per capita', 
       y = 'Life Expectancy') +
  transition_time(year) +
  ease_aes('linear')

anim_save("output/animated-gapminder.gif")

