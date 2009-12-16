clear all;
I = imread('C:\Project\mobimgproc\images\21102009077.jpg');
% I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg');
%  I = imread('C:\Project\mobimgproc\images\nature.JPG');
% I = imread('C:\Project\mobimgproc\images\white-1.jpg');
% I = imread('C:\Project\mobimgproc\images\paper1.jpg');
% I = imread('C:\Project\mobimgproc\images\white-1-dottedline.jpg');

% I = imread('C:\Project\mobimgproc\images\19112009116.jpg');
% I = imread('C:\Project\mobimgproc\images\19112009117.jpg');
% I = imread('C:\Project\mobimgproc\images\19112009118.jpg');
% I = imread('C:\Project\mobimgproc\images\19112009119.jpg');
% I = imread('C:\Project\mobimgproc\images\19112009121.jpg');

PSF = fspecial('gaussian',15,10);
Iblur = imfilter(I,PSF,'symmetric','conv');

Ig = rgb2gray(Iblur);
figure, imshow(Ig);
hold off;

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
% figure, imshow(BWsdil), title('dilated gradient mask'); 


BWnobord = imclearborder(BWsdil, 1); %optimal value 4
% figure, imshow(BWnobord), title('cleared border image');


  J1 = imresize(BWnobord, 0.3);
% figure, imshow(J1), title('second resized image');

  J2 = imresize(J1, 3);
 figure, imshow(J2), title('third resized image');

se = strel('square', 30); 

% J2sdil = imdilate(BWnobord,se);
J2sdil = imdilate(J2,se);

se = strel('square', 30); 

J2erod = imerode(J2sdil,se);
 figure, imshow(J2erod), title('third resized image');

BW = not(J2erod);
% BW = J2sdil;

cc = bwconncomp(BW);

Jlabeled = labelmatrix(cc);
RGB_label = label2rgb(Jlabeled);
imshow(RGB_label,'InitialMagnification','fit');

s = regionprops(BW, 'Centroid', 'BoundingBox');
centroids = cat(1, s.Centroid);
bounds = cat(1, s.BoundingBox);


hold on

plot(centroids(:,1), centroids(:,2), 'k*')

% bounds = h1(BW, bounds);
%bounds = h4(BW, bounds);
%bounds = h2(BW, bounds);
%bounds = h3(Jlabeled, cc.NumObjects , bounds);

for k = 1 : length(bounds)
    rectangle('Position', bounds(k,:), ...
        'EdgeColor','k');
end
hold off

% L = bwlabel(J2sdil);
% figure, imshow(L), title('Labeled'); 
% 
% find(cc == 1)

% se90 = strel('line', 20, 90);
% se0 = strel('line', 20, 0);
% BWsdil = imdilate(J, [se90 se0]);
% figure, imshow(BWsdil), title('dilated after resize'); 
% 
% frame_plot(BWsdil, 30, 30);


% hold off
% 
% [H,theta,rho] = hough(BWsdil);
% 
% P = houghpeaks(H,5000,'threshold',ceil(0.5*max(H(:))) );
% lines = houghlines(BWsdil,theta,rho,P,'FillGap',4,'MinLength',5);
% 
% figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,'InitialMagnification','fit');
% xlabel('\theta (degrees)'), ylabel('\rho');
% axis on, axis normal;
% colormap(hot);
% 
% figure, imshow(BWsdil), hold on;
% 
% %figure, imshow(I), hold on
% max_len = 0;
% 
% length(lines)
% for k = 1:length(lines)
%    xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%    % Plot beginnings and ends of lines
%    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
%    % Determine the endpoints of the longest line segment
%    len = norm(lines(k).point1 - lines(k).point2);
%    if ( len > max_len)
%       max_len = len;
%       xy_long = xy;
%    end
% end
% 
% plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

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

