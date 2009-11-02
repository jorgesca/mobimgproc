clear all;

I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg');
        
J = entropyfilt(I);

Jim = mat2gray(J);
imshow(Jim);


figure, imshow(J);
figure, imshow(Jim);
        
Jgray = rgb2gray(Jim); 
figure, imshow(Jgray);

F = fspecial('gaussian',[10 10], 10);
G = imfilter(Jgray,F,'conv');

figure, imshow(G);

threshold = .05;
BW = im2bw(G,threshold);    
figure, imshow(BW);

se1 = strel('square',5);
BWeroded = imerode(BW, se1);
BWopened = imdilate(BWeroded, se1);

se2 = strel('square',30);

BWdilated = imdilate(BWopened, se2);

figure, imshow(BWdilated);

        

