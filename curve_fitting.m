clear all; close all; clc

x=[0 0.5 1.1 1.7 2.1 2.5 2.9 3.3 3.7 4.2 4.9 5.3 6.0 6.7 7];
y=[1.1 1.6 2.4 3.8 4.3 4.7 4.8 5.5 6.1 6.3 7.1 7.1 8.2 6.9 5.3];

plot(x,y,'mo-'), hold on...

n= length(x);
% To do the polynomial fit 

pcoeff=polyfit(x,y,1) ;% HERE 1 is the degree of the polynomial of the fit
pcoeff2=polyfit(x,y,2);
pcoeffn=polyfit(x,y,n-1); % Gives the polynomial wiggle
% polyval is uesd to evaluate the polynaial coefficients at given x values

xp=0:0.1:7;
yp1=polyval(pcoeff, xp);
yp2=polyval(pcoeff2, xp);
ypn= polyval(pcoeffn,xp);

% Interp1 function is used to find the interpolating the data  
yint=interp1(x,y,xp,'spline');
 % Spline function
ysp= spline(x,y,xp); 
plot(xp,yp1, xp,yp2, 'k',xp,ysp)

% Line fit error E1
%E1 = sqrt( sum(abs(yp1-y).^2 )/n)  
%E2 = sqrt( sum(abs(yp2-y).^2 )/n)  
% Each increase in the degree of the polynomial of the fit, the error
% decreases






