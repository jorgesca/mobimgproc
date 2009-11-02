I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg'); 

J = rangefilt(I); 

I2=mat2gray(J);

%figure, imshow(I);
% figure, imshow(J);
        
Jgray = rgb2gray(J); 
% figure, imshow(Jgray);

Jadj = imadjust(Jgray);

E = medfilt2(Jadj, [17 17]); %works very good to reduce the noises

figure, imshow(E);

se1 = strel('square',5);
Jerod = imerode(E, se1);
Jopen = imdilate(Jerod, se1);

figure, imshow(Jopen);

se2 = strel('square',10);

Jdil = imdilate(Jopen, se2);

Jdiladj = imadjust(Jdil);

figure, imshow(Jdiladj);

figure, imshow(Jdiladj);

Jed = edge(Jdil, 'sobel', 00.08);

figure, imshow(Jed);






