clear all; close all;
clc
A=[4 -1 1;
    4 -8 1;
    -2 1 5]
b=[7; -21; 15]

xsol=A\b % solution of LU decomposition

% solving by JACOBI ITERATION
% x_k+1 =  M*x_k + b

 M=[0 1/4 -1/4;
     1/2 0 1/8;
     2/5 -1/5 0]
 b2=[7/4; 21/8; 15/5]
  x0= [1;2;1]; % Initial guess to the system solution
  tol=10^(-6)  % Tolerance value
  error= 2*tol
  x(:,1)=x0;
  iteration=1;
  while( error > tol && iteration<100 )
      iteration= iteration+1;
      x(:,iteration)=M*x(:,iteration-1)+ b2;
      error = norm ( x(:, iteration)- x(:,iteration-1), Inf);
  end 
  true_iter=iteration-1;
  