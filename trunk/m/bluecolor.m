clear all;

I = imread('C:\Project\mobimgproc\images\21102009077.jpg');
% I = imread('C:\Project\mobimgproc\images\white-1.jpg');
% I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg');
% I = imread('C:\Project\mobimgproc\images\white-2-complete-con2.jpg');
% I = imread('C:\Project\mobimgproc\images\12092009043.jpg');
% I = imread('C:\Project\mobimgproc\images\white-2-complete-con.jpg');

figure, imshow(I);

% PSF = fspecial('gaussian',11,5);
% Blurred = imfilter(I,PSF,'conv');
% figure;imshow(Blurred);
% title('Blurred');
% 
% I = Blurred;

HSV=rgb2hsv(I);
H=HSV(:,:,1);
S=HSV(:,:,2);
V=HSV(:,:,3);
% figure, 
% subplot(2,2,1), imshow(H)
% subplot(2,2,2), imshow(S)
% subplot(2,2,3), imshow(V)
% subplot(2,2,4), imshow(histeq(S))

% figure, imshow(HSV);


[xlen,ylen] = size(H);

% f = find(H<minH | H>maxH);
% f = 150;
% xlen = 100;
% ylen = 50;

% fy = fix(f./xlen) + 1;
% fx = mod(f, xlen);
% 
% I(fx, fy, 1) = 0;
% I(fx, fy, 2) = 0;
% I(fx, fy, 3) = 0;

R = I(:,:,1);
R = R(:);

G = I(:,:,2);
G = G(:);

B = I(:,:,3);
B = B(:);
% 
minH = 160/360;
maxH = 254/360;

f = find(H<minH | H>maxH);
R(f) = 255;
G(f) = 0;
B(f) = 255;

% minS = 6.5/100;
% maxS = 100/100;
% 
% f = find(S<minS | S>maxS);
% R(f) = 255;
% G(f) = 255;
% B(f) = 255;

% minV = 60/100;
% maxV = 100/100;
% 
% f = find(V<minV | V>maxV);
% R(f) = 255;
% G(f) = 255;
% B(f) = 255;

In(:,:,1) = reshape(R, xlen, ylen);
In(:,:,2) = reshape(G, xlen, ylen);
In(:,:,3) = reshape(B, xlen, ylen);



% Hd2d = reshape(Hf,size(Hf),1701)

figure, imshow(In);

