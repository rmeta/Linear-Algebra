%Armita Tehranchi 810898050
clc;clear;close all;
[X,cmap] = imread('RGB.png');
RGB = ind2rgb(X,cmap);
RGB = im2uint8(RGB);

figure
imshow(RGB)

y=ArmitaGreen(RGB);

figure

imshow(y)
%%
function y=ArmitaGreen(x)
x(:,:,1)=zeros(size(x,1),size(x,2));
x(:,:,3)=zeros(size(x,1),size(x,2));
y=x;
end