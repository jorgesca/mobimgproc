clear all;
I = imread('C:\Project\mobimgproc\images\21102009077.jpg');
% I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg');
% I = imread('C:\Project\mobimgproc\images\white-1.jpg');
% I = imread('C:\Project\mobimgproc\images\paper1.jpg');

PSF = fspecial('gaussian',15,10);
Iblur = imfilter(I,PSF,'symmetric','conv');

Ig = rgb2gray(Iblur);
figure, imshow(Ig);

J = imresize(Ig, 0.6);
% figure, imshow(J), title('first resized image');

Ig = J; 

[junk threshold] = edge(Ig, 'sobel');
fudgeFactor = .7;
BWs = edge(Ig,'sobel', threshold * fudgeFactor);
figure, imshow(BWs), title('binary gradient mask');


se90 = strel('line', 3, 90); %optimal value 3, 0
se0 = strel('line', 3, 0); %optimal value 3, 150

BWsdil = imdilate(BWs, [se90 se0]);
figure, imshow(BWsdil), title('dilated gradient mask'); 


BWnobord = imclearborder(BWsdil, 1); %optimal value 4
figure, imshow(BWnobord), title('cleared border image');


J1 = imresize(BWnobord, 0.3);
figure, imshow(J1), title('second resized image');

J2 = imresize(J1, 3);
figure, imshow(J2), title('third resized image');

% se90 = strel('line', 20, 90);
% se0 = strel('line', 20, 0);
% BWsdil = imdilate(J, [se90 se0]);
% figure, imshow(BWsdil), title('dilated after resize'); 
% 
frame_plot(BWsdil, 30, 30);
hold off
% 
% BW = not(BWsdil);
% 
% s=size(BW);
% for row = 2:s(1)
%    for col=1:s(2)
%       if not(BW(row,col))
%          break;
%       end
%    end
% 
%    contour = bwtraceboundary(BW, [row, col], 'E', 8);
%    if(~isempty(contour))
%       hold on;
%       plot(contour(:,2),contour(:,1),'g','LineWidth',2);
%       hold on;
%       plot(col, row,'gx','LineWidth',2);
%    else
%       hold on; plot(col, row,'rx','LineWidth',2);
%    end
% end

% se1 = strel('line', 20, 90);
% BWerod1 = imerode(BWsdil, se1);
% figure, imshow(BWerod1), title('erode'); 
% 
% se1 = strel('line', 20, 0);
% BWerod2 = imerode(BWerod1, se1);
% figure, imshow(BWerod2), title('erode'); 

