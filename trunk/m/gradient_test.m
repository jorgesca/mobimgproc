clear all;
% I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg');
I = imread('C:\Project\mobimgproc\images\white-1.jpg');

Ig = rgb2gray(I);
figure, imshow(Ig);

[junk threshold] = edge(Ig, 'sobel');
fudgeFactor = .4;
BWs = edge(Ig,'sobel', threshold * fudgeFactor);
figure, imshow(BWs), title('binary gradient mask');


se90 = strel('line', 3, 0);
se0 = strel('line', 3, 150);

BWsdil = imdilate(BWs, [se90 se0]);
figure, imshow(BWsdil), title('dilated gradient mask');

% BWdfill = imfill(BWsdil, 'holes');

BWdfill = BWsdil;
figure, imshow(BWdfill);
title('binary image with filled holes');

BWnobord = imclearborder(BWdfill, 4);
figure, imshow(BWnobord), title('cleared border image');

seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
figure, imshow(BWfinal), title('segmented image');

se90 = strel('line', 3, 200);
se0 = strel('line', 3, 0);

BWsdil = imdilate(BWfinal, [se90 se0]);
figure, imshow(BWsdil), title('dilated gradient mask');

% figure, imshow(BW);