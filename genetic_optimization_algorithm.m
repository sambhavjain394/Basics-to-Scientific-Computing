clear all; close all; clc
% Given below shows the temperature profile of the 24 hours
x=1:24;
y=[75 77 76 73 69 68 63 59 57 55 54 52 50 50 49 49 49 50 54 56 59 63 67 72];

plot(x,y,'ko')  

m=200; % number of the generations
n= 50; % number of guesses
n2=10; % number of guesses to be selected as best

A=12+ randn(n,1); % randn(i,j) returns random numbers of form of i*j matrix
B=pi/12 + randn(n,1);
C=60 + randn(n,1);

for jgen=1:m   % loop runs for the number of generations
    for j=1:n
        E(j)=sum((A(j)*cos(B(j)*x)+C(j)-y).^2); % Evaluating the error for each of the guesses
    end 
    plot(E), pause(0.5)
    
    [Es,Ej]=sort(E); % sorts the E vector from small to large and stores the index positions of the sorted vector
    
    Ak1=A(Ej(1:n2));  % selecting the n2 number of best guesses out of the total number of the guesses
    Bk1=B(Ej(1:n2));
    Ck1=C(Ej(1:n2));
    
    Ak2=Ak1 + randn(n2,1)/jgen;
    Bk2=Bk1 + randn(n2,1)/jgen;
    Ck2=Ck1 + randn(n2,1)/jgen;
    
    
    Ak3=Ak1 + randn(n2,1)/jgen;
    Bk3=Bk1 + randn(n2,1)/jgen;
    Ck3=Ck1 + randn(n2,1)/jgen;
    
    Ak4=Ak1 + randn(n2,1)/jgen;
    Bk4=Bk1 + randn(n2,1)/jgen;
    Ck4=Ck1 + randn(n2,1)/jgen;
    
    Ak5=Ak1 + randn(n2,1)/jgen;
    Bk5=Bk1 + randn(n2,1)/jgen;
    Ck5=Ck1 + randn(n2,1)/jgen;
     
    A=[ Ak1; Ak2; Ak3; Ak4; Ak5];
    B=[ Bk1; Bk2; Bk3; Bk4; Bk5];
    C=[ Ck1; Ck2; Ck3; Ck4; Ck5];
    
end



