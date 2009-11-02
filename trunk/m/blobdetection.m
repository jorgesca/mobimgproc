RGB=imread('C:\Project\mobimgproc\images\30092009058.jpg'); % Load the image file and store it as the variable I. 

whos % Type "whos" in order to find out the size and class of all stored variables. 

%imshow(I); % Display the image
m = size(RGB);

whos

I = rgb2gray(RGB);
threshold = graythresh(I);
BW = im2bw(I,threshold);

figure, imshow(BW);

BWin = not( BW); %invert the image colors

se1 = strel('square',10); %create 10x10 dilate matrix
BWindialated = imdilate(BWin, se1); %dialte the image


figure, imshow(BWindialated);
