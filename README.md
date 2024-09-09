<h1>Image Compression Using Singular Value Decomposition (SVD)</h1>

<p>By Armita Tehranchi</p>

<h2>Introduction</h2>
<p>This project demonstrates image compression using Singular Value Decomposition (SVD). The main objective is to compress an image by reducing the number of singular values used to reconstruct the image, thus reducing the amount of data required to store the image while maintaining its visual quality.</p>

<h2>Steps</h2>

<h3>1. Reading and Splitting the Image</h3>
<pre>
<code>
% Armita Tehranchi 810898050
clc;clear;close all;
% Reading image
[X,cmap] = imread('RGB.png');
RGB = ind2rgb(X,cmap);
% RGB = im2uint8(RGB);
% Splitting
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);
</code>
</pre>

<h3>2. Singular Value Decomposition (SVD)</h3>
<pre>
<code>
% svd
[Ur, Sr, Vr] = ArmitaSVD(R);
[Ug, Sg, Vg] = ArmitaSVD(G);
[Ub, Sb, Vb] = ArmitaSVD(B);
</code>
</pre>

<h3>3. Compressing the Image</h3>
<pre>
<code>
% Compressing
m = size(RGB, 1);
n = size(RGB, 2);
CR = [];
for k = [5 15 30 50]
    Rc = compress(R, k);
    Gc = compress(G, k);
    Bc = compress(B, k);
    img1(:,:,1) = Rc; img1(:,:,2) = Gc; img1(:,:,3) = Bc;
    figure;
    imshow(img1);
    title("k = " + int2str(k));
    K = k/100 * m;
    CR = [CR, n * m / (m + 1 + n) / K];
end
CR
</code>
</pre>

<h3>4. SVD Function</h3>
<pre>
<code>
% Armita Tehranchi 810898050
function [U, S, V] = ArmitaSVD(A)
    [V1, D1] = eig(A * A');
    [V2, D2] = eig(A' * A);
    V1 = flip(V1, 2);
    D1 = flip(flip(D1, 2));
    V2 = flip(V2, 2);
    D2 = flip(flip(D2, 2));
    
    % Normalizing
    for i = 1:size(V1, 2)
        V1(:, i) = V1(:, i) ./ norm(V1(:, i), 2);
    end
    for i = 1:size(V2, 2)
        V2(:, i) = V2(:, i) ./ norm(V2(:, i), 2);
    end
    
    V = [];
    U = [];
    if size(D1, 1) >= size(D2, 1)
        U = V1;
        for i = 1:size(D2, 1)
            vi = 1 / sqrt(D1(i, i)) * A' * U(:, i);
            V = [V, vi];
        end
        S = [sqrt(D2); zeros([size(D1, 1) - size(D2, 1), size(D2, 1)])];
    else
        V = V2;
        for i = 1:size(D1, 1)
            ui = 1 / sqrt(D2(i, i)) * A * V(:, i);
            U = [U, ui];
        end
        S = [sqrt(D1), zeros([size(D1, 1), size(D2, 1) - size(D1, 1)])];
    end
end
</code>
</pre>

<h3>5. Compress Function</h3>
<pre>
<code>
% Armita Tehranchi 810898050
function y = compress(x, k)
    [U, S, V] = ArmitaSVD(x);
    m1 = size(U, 1);
    n1 = size(V, 1);
    m2 = fix(m1 * k / 100);
    n2 = fix(n1 * k / 100);
    y = U(:, 1:m2) * S(1:m2, 1:n2) * V(:, 1:n2)';
end
</code>
</pre>

<h3>6. Displaying the Original and Green Images</h3>
<pre>
<code>
% Armita Tehranchi 810898050
clc;clear;close all;
[X,cmap] = imread('RGB.png');
RGB = ind2rgb(X,cmap);
RGB = im2uint8(RGB);

figure
imshow(RGB)

y = ArmitaGreen(RGB);

figure
imshow(y)
</code>
</pre>

<h3>7. Green Filter Function</h3>
<pre>
<code>
function y = ArmitaGreen(x)
    x(:,:,1) = zeros(size(x, 1), size(x, 2));
    x(:,:,3) = zeros(size(x, 1), size(x, 2));
    y = x;
end
</code>
</pre>

<h2>Conclusion</h2>
<p>This project demonstrates the effectiveness of SVD in image compression. By retaining only a subset of the singular values, we can significantly reduce the amount of data required to store an image while maintaining acceptable visual quality. This method is particularly useful in applications where storage space or transmission bandwidth is limited.</p>
