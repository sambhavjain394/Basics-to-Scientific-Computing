clear all;
close all;

t=0:0.1:50;
y=[pi/4 0];

g=-10;  % gravity
L=10;
d=0.1;

[t,y]=ode45(@(t,y) pend(t,y,g,L,d),t,y);

figure
plot(t,y(:,1));

figure
plot(y(:,1),y(:,2));

figure
plot3(t,y(:,1),y(:,2));