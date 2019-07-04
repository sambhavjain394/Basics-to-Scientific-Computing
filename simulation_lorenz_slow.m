clear all; close all; clc  

% Lorenz parameters (chaos)
sigma = 10;
beta=8/3;
rho=28;
% initial condition is the large cube of points

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
yparticles = y1C;

% This code is SLOW as the MATLAB is not compiled and
% we used the nested for loops tom step through every element in the cube

for step=1:L
    time=dt*step;
    % now, integratng each particle in the 3 D space 
    for i=1:length(xvec)
        for j=1:length(yvec)
            for k=1:length(zvec)
                yin=yparticles(:,i,j,k); % all the coordinates for i,j,k
                yout=rk4singlestep(@(t,y)lorenz(t,y,sigma, beta,rho),dt,time,yin);
                yparticles(:,i,j,k)=yout;
            end
        end
    end
    plot3(yparticles(1,:),yparticles(2,:),yparticles(3,:),'r.','markersize',8)
    axis([-40 40 -40 40 -40 40]); % azimuth and elevation angle 
    view(20,40);
    drawnow
end