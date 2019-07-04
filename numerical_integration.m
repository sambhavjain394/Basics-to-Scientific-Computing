clear all; close all; clc

a=0;
b=10;
dxf=0.01;   % step for fine elements
xf=a:dxf:b;
yf=sin(xf);
plot(xf,yf), hold on

dxc=0.5; % steps for coarse steps 
xc=a:dxc:b;
yc=sin(xc);
stairs(xc,yc);  % stairs function is used to plot stepwise graphs

n=length(xc);

% left rectazngle rule
area1=0;
for i=1:n-1
    area1=area1+ yc(i)*dxc;
end

% right rectangle rule
area2=0;
for i=1:n-1
    area2=area2+yc(i+1)*dxc;
end

%trapezoidal rule
area3=0;
for i=1:n-1
    area3=area3+ dxc*(yc(i)+yc(i+1))/2;
end
area_trapz=trapz(xc,yc)
area1
area2
area3

% computing the area without loops
area1f=sum(yf(1:end-1))*dxf
area2f=sum(yf(2:end))*dxf
area3f=trapz(xf,yf)

% simpson rule can be used using quad function

area4= quad(@(x) sin(x), a,b)  % quad function needs function handles rather than data points