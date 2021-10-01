# library(magrittr)
# n = 200;
# A = 1.995653;
# B = 1.27689;
# C = 8;
# r=round(seq(from = 0,to = 1, length.out = n),4)
# theta=round(seq(from = -2,to = 20*pi, length.out = n),4)
# R_THETA=expand.grid(R = r,THETA = theta);
# #define the number of petals we want per cycle. Roses have 3 and a bit.
# petalNum=3.6;
# x = 1 - (1/2)*((5/4)*(1 - mod(petalNum*R_THETA$THETA, 2*pi)/pi)^2 - 1/4)^2;
# phi = (pi/2)*exp(-R_THETA$THETA/(C*pi));
# y = A*(R_THETA$R^2)*(B*R_THETA$R - 1)^2*sin(phi);
# R2 = x*(R_THETA$R*sin(phi) + y*cos(phi));
# X=round(R2*sin(R_THETA$THETA),4)
# Y=round(R2*cos(R_THETA$THETA),4)
# Z=round(x*(R_THETA$R*cos(phi)-y*sin(phi)),4)
# 
# # library(rgl)
# # plot3d(X,Y,Z,xlim = c(-1,1), ylim = c(-1,1), zlim = c(-0.5,1))
# # scatterplot3d::scatterplot3d(Y,X,Z)
# 
# # library(plotly)
# # red
# # fig <- plot_ly(x = X, y = Y, z = Z,colors = red)
# 
# library(plot3D)
# surf3D(X, Y, Z, colvar = Z, colkey = TRUE, 
#        box = TRUE, bty = "b", phi = 20, theta = 120)
# 

############################################################################

library(magrittr)
n = 800;
A = 1.995653;
B = 1.27689;
C = 8;
r=round(seq(from = 0,to = 1, length.out = n),4)
theta=round(seq(from = -2,to = 20*pi, length.out = n),4)
library(plot3D)
R_THETA=mesh(r,theta);
#define the number of petals we want per cycle. Roses have 3 and a bit.
petalNum=3.6;
x = 1 - (1/2)*((5/4)*(1 - mod(petalNum*R_THETA$y, 2*pi)/pi)^2 - 1/4)^2;
phi = (pi/2)*exp(-R_THETA$y/(C*pi));
y = A*((R_THETA$x)^2)*(B*R_THETA$x - 1)^2*sin(phi);
R2 = x*(R_THETA$x * sin(phi) + y * cos(phi));
X=round(R2*sin(R_THETA$y),4)
Y=round(R2*cos(R_THETA$y),4)
Z=round(x*(R_THETA$x * cos(phi) - y * sin(phi)),4)

# library(rgl)
# plot3d(X,Y,Z,xlim = c(-1,1), ylim = c(-1,1), zlim = c(-0.5,1))
# scatterplot3d::scatterplot3d(Y,X,Z)

# library(plotly)
# red
# fig <- plot_ly(x = X, y = Y, z = Z,colors = red)


# plot3D::surf3D(X, Y, Z, colkey = F, colvar = Z,
#        box = T, bty = "b", phi = 40 , theta = -40, zlim = c(-1.3,max(Z)))
# 
# 
# plot3D::surf3D(X, Y, Z, colkey = F, colvar = x,
#                box = T, bty = "b", phi = 25 , theta = -40, zlim = c(-1,max(Z)+0.5),
#                col = "red", shade = 0.78)

library(plotly)
fig <- plot_ly(x = X, y = Y, z = Z) %>% add_surface()
axz <- list(
  nticks = 4,
  range = c(-0.7,1.2)
)
fig <- fig %>% hide_colorbar()

fig <- fig %>% add_trace(colorscale = list(c(0, 1), c("red", "#380000")))
scene = list(camera = list(eye = list(x = -1, y = -1, z = 1)),
             zaxis=axz)
fig <- fig %>% layout(scene = scene)
fig
hide_colorbar(fig)
