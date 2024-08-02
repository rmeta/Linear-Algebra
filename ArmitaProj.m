%Armita Tehranchi 810898050
clc;clear;close all;
%reading image
[X,cmap] = imread('RGB.png');
RGB = ind2rgb(X,cmap);
% RGB = im2uint8(RGB);
%spliting
R=RGB(:,:,1);
G=RGB(:,:,2);
B=RGB(:,:,3);
%%
% svd
[Ur,Sr,Vr]=ArmitaSVD(R);
[Ug,Sg,Vg]=ArmitaSVD(G);
[Ub,Sb,Vb]=ArmitaSVD(B);
%%
% compressing
m=size(RGB,1);
n=size(RGB,2);
CR=[];
for k=[5 15 30 50]
    Rc=compress(R,k);
    Gc=compress(G,k);
    Bc=compress(B,k);
    img1(:,:,1)=Rc;img1(:,:,2)=Gc;img1(:,:,3)=Bc;
    figure;
    imshow(img1);
    title("k = " + int2str(k));
    K=k/100*m;
    CR=[CR,n*m/(m+1+n)/K];
end
CR