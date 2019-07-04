close all; clear all; clc

time=0:0.01:20;
yIC = [3;1]; %initial conditions
mu=2;
[t,y]= ode45(@(t,y)vdp(t,y,mu),time,yIC);  % function handles here makes the value of mu as fixed and other as variable

plot(t,y);
figure
plot(y(:,1),y(:,2))