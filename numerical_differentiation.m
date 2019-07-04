clear all; close all; clc

dt=0.1;
t=-2:dt:4;
f=sin(t);

% Exact differentiation of the function
dfdt= cos(t);

% Plotting curves
plot(t,f,'b--','linewidth' ,2), hold on
grid on

plot(t,dfdt,'g--','linewidth',2) 

axis([-2 4 -2 2])

%% 
%Forward difference Approximation
dfdtf=(sin(t+dt)-sin(t))/dt;

% Backward difference Approximation
dfdtb=(sin(t)-sin(t-dt))/dt;

% Central difference approximation
dfdtc=(sin(t+dt)-sin(t-dt))/(2*dt);

plot(t,dfdtf,'r--','linewidth',2)
plot(t,dfdtb,'k--','linewidth',2)
plot(t,dfdtc,'m--','linewidth',2)

