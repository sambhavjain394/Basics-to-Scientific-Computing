clear all; close all; clc
 
%A=imread('arnold01','jpeg');  % is used to read the image file
A=double(rgb2gray(imread('arnold01','jpeg'))); % command used to convert the coloured image to the black and white image
pcolor(flipud(A)) , shading interp , colormap(gray)
%imshow(A)


%break
%C1=imresize( double( rgb2gray( imread('arnold01','jpeg') ) ),[120 80]);
