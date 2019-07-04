close all; clear all; clc

A=[4 3 -1; -2 -4 5; 1 2 6];

[L,U,P]=lu(A)  % Command used to give LU deccomposition which can be further used in other computationb 
%%
A=rand(10,10);
[L,U,P]=lu(A)

% Now the solution can be found by two commands:
%  y=L\b;
%  x=U\y;



