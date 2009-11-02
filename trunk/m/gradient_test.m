clear all;
I = imread('C:\Project\mobimgproc\images\white-1.jpg');

Ig = rgb2gray(I);
figure, imshow(Ig);

BW = edge(Ig,'log');

figure, imshow(BW);