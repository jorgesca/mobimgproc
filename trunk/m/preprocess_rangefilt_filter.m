clear all;

I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg');
        

J = rangefilt(I); %

I2=mat2gray(J);

figure, imshow(I);
figure, imshow(J);
        
Jgray = rgb2gray(J); 
figure, imshow(Jgray);

%E = medfilt2(Jgray, [7 7]); 
E = Jgray;
figure, imshow(E);
% F = fspecial('gaussian',[10 10], 10);
% G = imfilter(Jgray,F,'conv');


threshold = .05;
BW = im2bw(E,threshold);    
figure, imshow(BW);

BWfilled = imfill(BW, 'holes');

se1 = strel('square',5);
BWeroded = imerode(BWfilled, se1);
BWopened = imdilate(BWeroded, se1);

se2 = strel('square',30);

BWdilated = imdilate(BWopened, se2);

figure, imshow(BWdilated);

        