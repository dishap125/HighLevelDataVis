library(dplyr)
library(ggplot2)
mtcars
#remove nulls
mtcars <- mutate(mtcars,cyl=factor(cyl,ordered=TRUE,levels=c(4,6,8)))
mtcars <- mutate(mtcars,am=factor(am,ordered=TRUE,levels=c(0,1)))

# 2 elements
## weight, mpg
ggplot(mtcars,aes(x=wt,y=mpg)) + geom_point() + theme_bw() + labs(x="Weight", y="Miles per Gallon")
## cyl, count
ggplot(mtcars,aes(x=cyl)) + geom_bar() + theme_bw() + labs(x="# of Cylinders", y="Count")

# 3 elements
## weight, mpg, cyl
ggplot(mtcars,aes(x=wt,y=mpg, col=cyl)) + geom_point() + labs(x="Weight", y="Miles per Gallon")
##cyl, count, am
ggplot(mtcars, aes(x=cyl, fill=am)) + geom_bar() + theme_bw() + labs(x="# of Cylinders", y="Count", fill = "Transmission")

library("plotly")

# 4 elements
## wt, mpg, disp, am (3D)
plot_ly(mtcars, x=~wt, y=~mpg, z=~disp, color=~am, type="scatter3d", mode="markers")

## wt, mpg, disp, am (2D)
ggplot(mtcars,aes(x=wt,y=mpg, size=disp, col=cyl)) + geom_point() +
  scale_color_manual(values = c("lightgreen","lightblue", "lightpink")) + labs(x="Weight", y="Miles per Gallon", size="Displacement", col="Cylinders")

# 5 elements
## wt, mpg, disp, am, cyl (3D)
plot_ly(mtcars, x=~wt, y=~mpg, z=~disp, color=~am, type="scatter3d", mode="markers", marker = list(size = ~cyl, opacity = 0.5))

## wt, mpg, disp, am, cyl (2D)
ggplot(mtcars,aes(x=wt,y=mpg, size=disp, col=cyl)) + geom_point() +
  scale_color_manual(values = c("lightgreen","lightblue", "lightpink")) + facet_grid(~am) + labs(x="Weight", y="Miles per Gallon", size="Displacement", col="Cylinders")


# 6 elements
## wt, mpg, disp, am, cyl (3D)
plot_ly(mtcars, x=~wt, y=~mpg, z=~disp, color=~am, type="scatter3d", mode="markers", marker = list(size = ~cyl, opacity = 0.5))

## wt, mpg, disp, am, cyl (2D)
ggplot(mtcars,aes(x=wt,y=mpg, size=disp, col=cyl)) + geom_point() +
  scale_color_manual(values = c("lightgreen","lightblue", "lightpink")) + facet_grid(~am) + labs(x="Weight", y="Miles per Gallon", size="Displacement", col="Cylinders")


