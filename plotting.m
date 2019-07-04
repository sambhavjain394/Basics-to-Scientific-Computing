clear all; close all; clc

x1=-10:0.1:10;
y1=sin(x1);

x2=[-5 sqrt(3) pi 4];
y2= sin(x2);

x3= linspace(-10,10,64);
y3= x3.*sin(x3);   % component by component multiplication

subplot(2,1,1 )

plot(x1,y1,'linewidth',[2]);
hold on;
plot(x2,y2,'ko','linewidth',[3]);
plot(x3,y3,'m:d','linewidth',[2]);

% To ionclude value of a variable into graph title or eny string or any
% other place
% It uses num2str 
A=9;

xlabel('x values')
ylabel('y values')
title(['My graph for A=' num2str(A)],'Fontsize',[15])
grid on
text(1,5, 'Stuff')
%axis off
set(gca, 'FOntsize',[14])% gca stands for get current axis

legend('data 1','data 2', 'data 3','location','Bestoutside')

% saving the vector as a text file

%save x1.dat x1 -ASCII

%load x1.dat

% if we want to save the loop data into a seperate data file, we can do as
% following:
% For loop=1:5 
  % (STUFF)
  % save(['loopnumber' num2str(loop)])
% end

% Saving the matlab figures directly as jpeg:
% figure(1), print -djpeg fig1.jpg
