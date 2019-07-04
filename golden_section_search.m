clear all; close all; clc
% Algorith applies to the unimodal functions only
f=@(x) (x-4)^2;   % using function handles, defining an unimodal function

a=-10; b=80; %defining the end points of the interval 
c= 0.6190; % golden ratio or the reduction factor used to calculate the x1 and x2
x1= c*a+(1-c)*b;
x2= (1-c)*a+c*b;
while((x1-x2)<10^(-8)) % 10^(-8) is the tolerance value of the solution to the actual solution
    if f(x1)<=f(x2)
        b=x2;
        x2=x1;
        x1=c*a+ (1-c)*b;
    elseif f(x1)>f(x2)
            a=x1;
            x1=x2;
            x2=(1-c)*a+c*b; 
    end
end
x2
x1
