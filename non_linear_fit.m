clear all; close all; clc
x=[-3 -2.2 -1.7 -1.5 -1. -1 -0.7 -0.4 -0.25 -0.05 0.07 0.15 0.3 0.65 1.1 1.25 1.8 2.5];
y=[-0.2 -0.1 0.05 0.2 0.4 1  1.2 1.4 1.8 2.2 2.1 1.6 1.5 1.1 0.8 0.3 -0.1 0.2];

plot(x,y), hold on
A=1;B=1; %initial guesses to the function
%fminsearch is the function looking for the minimum of the function 
 coeff= fminsearch('gauss_fit',[A B]);

x2=-3:0.1:3;
A=coeff(1);
B=coeff(2);
y2= A* exp(-B*x2.^2);% We have to find the values of A and B such that the gaussian curve fits the best 


plot(x2,y2,'m-')