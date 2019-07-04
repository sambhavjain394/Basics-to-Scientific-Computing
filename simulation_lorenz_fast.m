clear all; close all; clc  

% Lorenz parameters (chaos)
sigma = 10;
beta=8/3;
rho=28;

 %initial condition is the large cube of points

xvec=-20:2:20;
yvec=-20:2:20;
zvec=-20:2:20;

[x0,y0,z0] = meshgrid(xvec,yvec,zvec);

% initial condition
y1C(1,:,:,:)=x0;
y1C(2,:,:,:)=y0;
y1C(3,:,:,:)=z0;

plot3(y1C(1,:),y1C(2,:),y1C(3,:),'r.','linewidth',2,'markersize',5);
axis([-40 40 -40 40 -40 40]); % azimuth and elevation angle 
view(20,40);
drawnow % updates the figure immediatly on the screen to see the changes

% computing all trajectories
dt=0.01;
duration=4;
tspan=[0,duration];
L=duration/dt;
yin = y1C;
% Now, instead of the nested for loop, we are using the vectorization
% technique- in which we directly input the whole bunch of vectors instead
% of each and every single step.
for step=1:L
    time=step*dt;
    yout = rk4singlestep(@(t,y)lorenz_vector(t,y,sigma,beta,rho),dt,time,yin);
    yin=yout;
plot3(yout(1,:),yout(2,:),yout(3,:),'r.','markersize',4)
view(20+360*step/L,40);
axis([-40 40 -40 40 -40 40]);
drawnow
end