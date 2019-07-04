close all; clear all; clc

A1=[ 0.0001 1;
    1 1];
A2=[1 1; 1 1.0001];

b=[2;2];

x1=A1\b;
x2=A2\b;

% Now, we can check by adding delta b in b vector

db=[0; 0.0001];
x1new= A1\(b+db);
x2new= A2\(b+db);

% For so,e A the solution is much robust even if we change a little bit to
% b.  Such matrices are called well conditioned and those A matrices which
% changes significantly are ill conditioned.