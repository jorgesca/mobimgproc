clear all;

I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg');

J = rangefilt(I);

I2=mat2gray(J);

figure, imshow(I);
figure, imshow(J);
        
Jgray = rgb2gray(J); 
figure, imshow(Jgray);

% FF = filter2(fspecial('sobel'),Jgray);
% K = mat2gray(FF);
% figure, imshow(K);

background = imopen(Jgray,strel('disk',3));
figure, imshow(background);

figure, surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
set(gca,'ydir','reverse');

Jfor = Jgray - background;
figure, imshow(Jfor);

Jadj = imadjust(Jfor);
figure, imshow(Jadj);

level = graythresh(Jadj);
BW = im2bw(Jadj, level);
BB = bwareaopen(BW, 50);

figure, imshow(BB);





