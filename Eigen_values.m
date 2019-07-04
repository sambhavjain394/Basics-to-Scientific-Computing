clear all; close all;
 clc;
 
 A=[3 -1;
     -1 3];
 eig(A) ;
 % ORiginal matrix A
 A1= [4 -1 1;
     4 -8 1;
     -2 1 5];
 % Matrix with first and the third row swapped
 A2= [A1(3,:);
     A1(2,:);
     A1(1,:)];
 d1= diag(A1);% gives the vector of the diagonal elements of A1
 D1= diag(d1);% gives the matrix with the vector arranged in the diagonal positions
  
d2= diag(A2);% gives the vector of the diagonal elements of A2
D2= diag(d2);% gives the matrix with the vector arranged in the diagonal positions
   
T1= A1-D1;
T2= A2-D2;

% Now, looking at the eigen values of D^-1 *T
abs(eig(D1\T1))
abs(eig(D2\T2))