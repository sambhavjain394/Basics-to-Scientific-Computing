clear all; close all;
clc

A= [4 -1 1;
    4 -8 1;
    -2 1 5];
b=[7; -21; 15];

xsol= A\b;

% Gauss -Seidel algorithm

D= diag(diag(A));
S=tril(A);
T=triu(A) - D ; 

 x0= [1;2;1]; % Initial guess to the system solution
  tol=10^(-6);  % Tolerance value
  error= 2*tol;
  x(:,1)=x0;
  iteration=1;
  while( error > tol && iteration<100 )
      iteration= iteration+1;
      x(:,iteration)= S\(b-T*x(:,iteration-1)); % It's same as x_k+1 = -S^-1 *T*x_k + S^(-1)*b
      error = norm ( x(:, iteration)- x(:,iteration-1), Inf);
  end  
  true_iter=iteration-1;