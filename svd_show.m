clear all; close all; clc

%A=imresize(double(imread('IMAGES 00001','tif')),[384 128]);
% A is already in the gray scale, hence no need of using rgb2gray()
% function

% We need to convert the image into double to improve the precision of the
% image as the default type is uint which varys from 0 to 255 and doesn't
% include decimal numbers

% imshow(A) doesn't work in case of the double numbers as it reads only
% integers

%pcolor(flipud(A)), shading interp, colormap(gray)

% Cropping the image
%a(:,:)=A(270:1:384,40:1:100);
%figure
% pcolor(flipud(a)), shading interp, colormap(gray)
%% Importing 1000 images and storing them in the columns of the matrix A

% The images which I imported are a bit confidential, so those can't be
% shared. But U can upload your own images to check this out.



for n=1:1000
    if n>999
        A_temp=imresize(imread(sprintf('IMAGES 0%03d.tif',n)),[384 128]);
        a_temp(:,:)=A_temp(270:1:384,40:1:100);
        A(:,n)=reshape(a_temp,1,115*61);
    else
        A_temp=imresize(imread(sprintf('IMAGES 00%03d.tif',n)),[384 128]);
        a_temp(:,:)=A_temp(270:1:384,40:1:100);
        A(:,n)=reshape(a_temp,1,115*61);
    end
end
A=double(A);
clear A_temp
clear a_temp
clear n

% Matrix A successfully created

%% Performing SVD through EVD ( BASICS )


[V,D]=eig(A'*A);
sigma(:,:)= sqrt(D(:,:));
% Clearing the junk variables

% Sorting the elements of the sigular matrix in descending order
for i=1:1000
    for j=(i+1):1000
        if sigma(j,j)>sigma(i,i)
            k=sigma(j,j);
            sigma(j,j)=sigma(i,i);
            sigma(i,i)=k;
            temp(:,1)=V(:,i);
            V(:,i)=V(:,j);
            V(:,j)=temp(:,1);
        end
    end
end

% Clearing the junk variables
clear k
clear temp


% Now, finding the U

% Finding the inverse of the matrix sigma to find the U matrix
for i=1:1000
    for j=1:7015
        if i==j
            S_inverse(i,j)=1/sigma(i,j);  
        else
            S_inverse(i,j)=0;
        end
    end
end


% S is the final singular matrix
for i=1:7015
    for j=1:1000
        if i==j
            S(i,j)=sigma(i,j);  
        else
            S(i,j)=0;
        end
    end
end

% Following eqation is the result of SVD eqn manipulation
U=A*V*(S_inverse);

% Clearing out junk variables
clear sigma
clear S_inverse
clear i
clear j

%% Plotting the % Energy distributions over the SVD modes 

E=diag(S);
bar(E(1:100)/sum(E(1:100)),'r','linewidth',1.2), hold on
plot(cumsum(E(1:100))/sum(E(1:100)),'k','LineWidth',1.2)
xlabel('SVD mode');
ylabel('% Energy or % Cumulative Energy');

%% Performing the lower rank approximations:

% For rank1 approximation:
S_rank1(:,:)=S(:,:);
S_rank1(2:end,2:end)=0;
A_rank1=U*S_rank1*V';
% For rank2 approximation:
S_rank2(:,:)=S(:,:);
S_rank2(3:end,3:end)=0;
A_rank2=U*S_rank2*V';
% For rank3 approximation:
S_rank3(:,:)=S(:,:);
S_rank3(4:end,4:end)=0;
A_rank3=U*S_rank3*V';
% For rank4 approximation:
S_rank4(:,:)=S(:,:);
S_rank4(5:end,5:end)=0;
A_rank4=U*S_rank4*V';
% For rank5 approximation:
S_rank5(:,:)=S(:,:);
S_rank5(6:end,6:end)=0;
A_rank5=U*S_rank5*V';

%% Making animation of the different rank approximations:

nframes=100;
Frames=moviein(nframes);
v = VideoWriter('rank_approximations.avi','Uncompressed AVI');
open(v);
figure
 for i=1:1000
     subplot(2,3,1)
     pcolor(flipud(reshape(A(:,i),115,61))), shading interp, colormap(gray)
     title('Original Video')
     subplot(2,3,2)
    pcolor(flipud(reshape(A_rank1(:,i),115,61))), shading interp, colormap(gray)
    title('Rank 1 Approximation')
         subplot(2,3,3)
    pcolor(flipud(reshape(A_rank2(:,i),115,61))), shading interp, colormap(gray)
    title('Rank 2 Approximation')
         subplot(2,3,4)
    pcolor(flipud(reshape(A_rank3(:,i),115,61))), shading interp, colormap(gray)
    title('Rank 3 Approximation')
         subplot(2,3,5)
    pcolor(flipud(reshape(A_rank4(:,i),115,61))), shading interp, colormap(gray)
    title('Rank 4 Approximation')
         subplot(2,3,6)
    pcolor(flipud(reshape(A_rank5(:,i),115,61))), shading interp, colormap(gray)
    title('Rank 5 Approximation')
    
frame=getframe(gcf);
writeVideo(v,frame);
 end

close(v)
%% PLotting the chronos
plot(abs(fft(V(:,2))));
plot(abs(fft(V(:,6))));
