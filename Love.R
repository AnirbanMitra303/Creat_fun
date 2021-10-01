#x^2+(y-x^(3/2))^2 = 1

x=seq(0,2*pi,length.out = 50)
y=1+cos(x)
plot(x,y)


t= seq(-1,1,length.out = 2000)
x=sin(t)*cos(t)*log(abs(t))
y=(abs(t))^(0.3)*sqrt(cos(t))
x=c(x[1:(0.5*length(t))],0,x[(length(t)/2 + 1):length(t)])
y=c(y[1:(0.5*length(t))],0,y[(length(t)/2 + 1):length(t)])
#plot(x,y)
d=data.frame(x=x,y=y)
#d=d[order(x),]
#d = rbind(c(0,0),d,c(0,0))
library(ggplot2)
ggplot(data=d,aes(x=x,y=y))+
  geom_polygon(fill=NA,color="black")+
  xlab("me") + ylab("not you")


t1=seq(0,2*pi,length.out = 2000)
x1=16*sin(t1)*sin(t1)*sin(t1)
y1=13*cos(t1) - 5*cos(2*t1) - 2*cos(3*t1) - cos(4*t1)
# x1=c(x1[1:(0.5*length(t))],x1[(length(t)/2 + 1):length(t)])
# y1=c(y1[1:(0.5*length(t))],y1[(length(t)/2 + 1):length(t)])
d1=data.frame(x=x1,y=y1)
#d=d[order(x),]
#d = rbind(c(0,0),d,c(0,0))
library(ggplot2)
ggplot(data=d1,aes(x=x,y=y))+
  geom_polygon(fill=NA,color="black")+
  xlab("every girl who has no whatsoever interest in me") + ylab("me")+
  labs(title = "spread love yo!")

ggplot(data=NULL,aes(x=x,y=y))+
  geom_point(data = d1)+
  geom_point(data = d1/1.25)+
  geom_point(data = d1/1.5)+
  geom_point(data = d1/1.75)+
  geom_point(data = d1/2)+geom_point(data = d1/2.25)
