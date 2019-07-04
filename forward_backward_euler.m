clear all;
close all;

w=2*pi;  % natural frequency
d=0.25;  %damping ratio

% spring mass damper system 

A= [0 1;
    -w^2 -2*d*w];

%ddt(x)=A*x

dt=0.01;   %time step
% if we increase the dt to some quanity like 0.1 ,simulation goes wrong and
% gives wrong results in forward euler method
T=10;   % total time to integrate

x0=[2;0];   % initial condition of the mass as 2 units displacement and 0 velocity
% ITERATE FORWARD EULER SCHEME

xF(:,1)=x0;  % state matrix : first column stores the initial conditions
tF(1)=0;     % time vector 

for k=1:T/dt
    tF(k+1)=k*dt;
    xF(:,k+1)=(eye(2) + dt*A)*xF(:,k);   % eye(N) generates the identity matrix of order N by N
end

%plot(tF,xF(1,:));

%figure   % figure command creates a new window for the figure
%plot(xF(1,:),xF(2,:)); % phase diagram

%figure 
%plot3(tF,xF(1,:),xF(2,:));

%% Backward euler scheme

xB(:,1)=x0;  % state matrix : first column stores the initial conditions
tB(1)=0;     % time vector 

for k=1:T/dt
    tB(k+1)=k*dt;
    xB(:,k+1)=inv(eye(2) - dt*A)*xF(:,k);   % eye(N) generates the identity matrix of order N by N

end

plot(tB,xB(1,:));

figure   % figure command creates a new window for the figure
plot(xB(1,:),xB(2,:)); % phase diagram

figure 
plot3(tB,xB(1,:),xB(2,:));

% Now, solving the same using Range-kutta method
[t,xGood]=ode45(@(t,x) A*x, 0:dt:T, x0);
hold on
figure
plot(t,xGood(:,1),'r');