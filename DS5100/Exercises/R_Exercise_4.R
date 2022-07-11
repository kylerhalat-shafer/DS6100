#ggplot2 --> the grammar of graphics by Wilkinson

#Using visualisation as a compliment to mathematics

#in math graph is nodes or measures, so visualization is more specific to what we are speaking about

# Everything begins with data 
# Geometrics: are points, lines, and bars 
# Aesthetics: visual things like poisition, size, color, and shape 

# This is very similar to the process in building a proper presentation for a client 
# Data -> Aesthetics -> Geometrics -> Facets -> Statistics -> Coordinates -> Theme 

library("tidyverse")

# calling in the iris data 
iris %>%
  ggplot(
    #Using the Cartesian plane defined by x and y for specific varibales
    mapping = aes(
      x = Sepal.Length, 
      y = Sepal.Width)) + #this is building something, the sum of all these things will be your graph
  # the geometry is choosing the point --> geometric; then making a different color for each Species
  geom_point(size=3, aes(color=Species))

iris %>%
  ggplot(aes(
    x = Sepal.Length, 
    y = Sepal.Width)) + 
  geom_point(size=3, aes(color=Species)) + 
  stat_smooth(method = lm)

#Simpson's paradox, the global trend is downward, whereas all of the individual facets are upward
#this is counterintuitive

iris %>%
  ggplot(aes(
    x = Sepal.Length, 
    y = Sepal.Width)) + 
  geom_point(size=3, aes(color=Species)) + 
  stat_smooth(method = lm) +
  facet_wrap(facets = vars(Species))

iris %>%
  ggplot(aes(
    x = Sepal.Length, 
    y = Sepal.Width)) + 
  geom_point(size=3, aes(color=Species)) + 
  stat_smooth(method = lm) +
  stat_smooth(method = lm, se=FALSE, aes(color=Species))

#DIAMONDS

diamonds

diamonds %>%
  ggplot(aes(x=carat, y=price)) + 
  geom_point()

gg <- ggplot(diamonds, aes(x=carat, y=price)) 
gg + geom_point()

gg + geom_point(
  size=1, 
  shape=1, 
  color="steelblue", 
  stroke=2)

gg + geom_point(aes(
  size=carat, 
  shape=cut, 
  color=color, 
  stroke=carat))

gg1 <- gg + geom_point(aes(color=color))
gg2 <- gg1 + labs(title="Diamonds", x="Carat", y="Price") 
gg2

gg2 + theme(text=element_text(color="blue"))  # all text turns blue.

gg3 <- gg2 + 
  theme(plot.title=element_text(size=25), 
        axis.title.x=element_text(size=20),
        axis.title.y=element_text(size=20),
        axis.text.x=element_text(size=15),
        axis.text.y=element_text(size=15)
  )
gg3

gg3 + scale_colour_manual(
  name='Legend', 
  values=c('D'='grey', 
           'E'='red', 
           'F'='blue', 
           'G'='yellow', 
           'H'='black', 
           'I'='green', 
           'J'='firebrick'))

# This is the last part of the data pipeline -> have the results that can then be communicated to
# people that are not in the data science field 

# There's different versions of markdown, they are econmical ways of writing markdown

# Markdown in R is designed to be published --> we want to document the process, therefore it can 
# be reproduced 

# Exercises 

# 1
mpg%>%
  ggplot()

# 2
mpg%>%
  ggplot(aes(
    x = hwy,
    y = cyl
  ))+
  geom_point(size=3)

# 3
mpg%>%
  ggplot(aes(
    x = class,
    y = drv
  ))+
  geom_point(size=3)

#4 

x <- (seq(-6*pi, 6*pi, length.out =100))
data <- data.frame( x =x, y = sin(x)/x)
data

ggplot(data = data, mapping = aes(x =x,y=y)) + geom_line()

# 5

cars%>%
  ggplot(aes(
    x = speed,
    y = dist
  ))+
  geom_point(mapping = aes(color = dist > 80))+
  scale_color_manual(values =c("black", "red"))

#6

cars%>%
  ggplot(aes(
    x = speed,
    y = dist
  ))+
  geom_point(mapping = aes(color = dist > 80))+
  scale_color_manual(values =c("black", "red"))+
  geom_smooth(method = lm)

#7

cars%>%
  ggplot(aes(
    x = speed
  ))+
  geom_histogram(bins = 10)

cars%>%
  ggplot(aes(
    x = dist
  ))+
  geom_histogram(bins = 10) 

#8

mpg %>%
  ggplot(aes(
    x = hwy, 
    y = cty)) + 
  geom_point(size=3) + 
  facet_wrap(facets = vars(drv, cyl))

mpg %>%
  ggplot() +
  geom_point(mapping = aes(x=hwy, y=cty))+
  facet_grid(drv ~ cyl)

iris %>%
  ggplot(aes(Sepal.Length,Sepal.Width, color = Species, shape = Species))+
  geom_point()+
  geom_density2d()+
  ggtitle('IRIS')+
  theme_light()

iris%>%
  mutate(Species = 'ALL') %>%
  bind_rows(iris) %>%
  ggplot(aes(Sepal.Length,Sepal.Width, color = Species))+
  geom_point()+
  geom_smooth()+
  xlab('Petal Length')+
  ylab('Petal Width')+
  facet_wrap(~Species, scales ='free')+
  theme_bw()
