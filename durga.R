library(ggforce)
#
cent = c(0,0)
xc = cent[1]; yc = cent[2]
df <- data.frame()
#
dbase <- ggplot(df)+ xlim(xc-10, xc+10) + ylim(yc-10, yc+10)
dbase
#
dnose <- dbase +  geom_arc(aes(x0 = xc, y0 = yc-6, r=1.75, start = pi/2+0.7, end = 3*pi/2-0.7), 
           size=2 , lineend = 'round')
dnose
#
dnosering <- dnose + geom_circle(aes(x0 = xc+2.5, y0 = yc-6.5, r=1.7),size = 1.5, color = "red")
dnosering
#
# yup = yc+7.5; ydn = yc+2.5; 
# xup = xc+0; xdn = xc+0 ; r3e = 6 
# R = norm(c(xup,yup) - c(xdn,ydn),"2")
# t = sqrt((r3e/R)^2 - 1/4)
# x0 = 0.5*(xdn+xup) - t*(yup-ydn); y0 = 0.5*(ydn+yup) - t*(xup-xdn)
# d3rdeye <- 
#   dnosering + geom_arc(aes(
#   x0 = x0+10.3,
#   y0 = y0+0.5,
#   r = r3e, start = pi+pi/4+pi/19, end = 2*pi - pi/4 - pi/19
# ), size = 2, lineend = "round")+ 
#   geom_arc(aes(
#   x0 = -(x0+10.3),
#   y0 = y0+0.5,
#   r = r3e, start = 0+pi/4+pi/19, end = pi - pi/4 - pi/19
# ), size=2, lineend = "round")+
#   geom_circle(aes(x0=0, y0 = 5.25, r=1),fill = "black" )

#d3rdeye
#
deyebrows <- dnosering + 
  # geom_circle(aes(x0=7 , y0 = -4,r=8))
geom_arc(aes(x0=xc+7 , y0 = yc-6,r=8, start=2*pi+pi/12,end = 3*pi/2+pi/5,
           size = stat(index)), lineend = "round")+
geom_arc(aes(x0=xc-7 , y0 = yc-6,r=8, start=-(2*pi+pi/12),end = -(3*pi/2+pi/5),
               size = stat(index)), lineend = "round") +
  theme(legend.position = "none")
deyebrows
#
deyes <- deyebrows + # xlim(cent[1]-25, cent[1]+25) + ylim(cent[2]-25, cent[2]+25) +
  geom_arc(aes(x0=xc+6.8 , y0 = yc-6,r=7, start=2*pi+pi/9.2, end = 3*pi/2+pi/5.6), lineend = "round", size=2) + 
  geom_arc(aes(x0=xc+2.8 , y0 = yc+5.5, r=8, start=pi/2+pi/4.8, end = pi+pi/13), lineend = "round", size=2)+
  geom_circle(aes(x0 = 4.9, y0 = yc - 0.75, r = 1), size = 2, fill = "black")+
  
  geom_arc(aes(x0=xc-6.8 , y0 = yc-6,r=7, start=-(2*pi+pi/9.2), end = -(3*pi/2+pi/5.6)), lineend = "round", size=2) + 
  geom_arc(aes(x0=xc-2.8 , y0 = yc+5.5, r=8, start=-(pi/2+pi/4.8), end = -(pi+pi/13)), lineend = "round", size=2)+
  geom_circle(aes(x0 = -4.9, y0 = yc - 0.75, r = 1), size = 2, fill = "black")
deyes
#
t = seq(0,2*pi,length.out = 100)
a = 1.2; b= 5/2; perix = a*(1 - sin(t))*cos(t); periy = b*(sin(t)-1)
d3rdeye <- deyes + geom_path(aes(x=perix,y=periy+yc+8), size=2, color="red")#+
  #geom_circle(aes(x0 = 0, y0 = 4.5, r = .85),fill="red")
d3rdeye
#
dtip <- 
  d3rdeye+ geom_circle(aes(x0 = xc, y0 = yc+0.8, r = .8), fill = "red",color = "red") +
  geom_arc(aes(x0=xc, y0 = yc+4.9, r=3, start = 3*pi/4, end = 5*pi/4), color="red", size = 1.2)+
    geom_arc(aes(x0 = xc, y0 = yc+9.5 , r=7, start = 7*pi/8+pi/42, end = 9*pi/8 - pi/42),color = "red", size=1.2)
  
#
dfin_1 <- dtip + 
  coord_fixed()+ 
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank())
dfin_1+
  annotate("text", x = 10, y = -10, label = "Anirban Mitra",
           hjust=1.1, vjust=-1.1, col="white", cex=6,
           fontface = "italic", alpha = 0.4)# + theme_bw() + theme(legend.position = "none")

