clear all; close all; clc
 
A=[1 1 1; 1 2 4; 1 3 9];
b=[1; -1; 1];

x=A\b              %This backslash acts as an operator to solve linear systems

% We can even check well in advance by finding deteminant

det(A)

% we can also use condition number instead of finding determinant 
% For singular matrices, condition number is verry high ~10^12-16 order
% For nnon singular matrices, condition number is ~0

cond(A)
%%
% We can even use rand functin to create random matrices and vectors 

A = rand(1000,1000);
b=  rand(10 00,1);

x=A\b
 