clear all; close all; clc

% linprog function is used to do the linear programming in the MATLAB

c=[-2 -1];
A=[1 8/3;
    1 1;
    2 0;
    -1 0;
    0 -1;];
b=[4 2 3 0 0];

[x,f,flag] =linprog(c,A,b) % x is the vector for which the C transpose x is minimum
% f is the value of the objective function
% flag is the indicator which tells that the solution is converged or not