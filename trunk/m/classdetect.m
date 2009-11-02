clear all;

I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg');


I(:,:,1) = 0;
I(:,:,2) = 0;



figure, imshow(I);

J = rangefilt(I); %

I2=mat2gray(J);

figure, imshow(I);
figure, imshow(J);
        
Jgray = rgb2gray(J); 
figure, imshow(Jgray);

%E = medfilt2(Jgray, [7 7]); 

% F = fspecial('gaussian',[10 10], 10);
% G = imfilter(Jgray,F,'conv');

E = Jgray;

threshold = .05;
BW = im2bw(E,threshold);    
figure, imshow(BW);

BB = bwareaopen(BW, 50);

figure, imshow(BB);


se1 = strel('square',5);
BWeroded = imerode(BB, se1);
BWopened = imdilate(BWeroded, se1);

se2 = strel('square',50);

BWdilated = imdilate(BWopened, se2);

se2 = strel('square',45);

BWeroded = imerode(BWdilated, se2);

%BWskel = Bwmorph(BWdilated, 'skel', Inf);

figure, imshow(BWeroded);

[B,L,N] = bwboundaries (BWopened);

figure; imshow(BWopened); hold on;
for k=1:length(B),
    boundary = B{k};
    if(k > N)
        plot(boundary(:,2),...
            boundary(:,1),'g','LineWidth',2);
    else
        plot(boundary(:,2),...
            boundary(:,1),'r','LineWidth',2);
    end
end

hold off;



