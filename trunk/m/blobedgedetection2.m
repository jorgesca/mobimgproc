clear;

RGB=imread('c:\project\images\blob1.jpg'); % Load the image file and store it as the variable I. 

whos % Type "whos" in order to find out the size and class of all stored variables. 

%imshow(I); % Display the image
m = size(RGB);

whos

%I=im2double(I); % Convert the variable into double. 

I = rgb2gray(RGB);
threshold = graythresh(I);
BW = im2bw(I,threshold);

figure, imshow(BW);

BWin = not( BW);

se1 = strel('square',10);

%BWindialated = imdilate(BWin, se1);

%figure, imshow(BWindialated);

%BWedged = edge(BWin,'Canny');

%BWedged = bwperim(BWin);

%BWedged = bwmorph(BWindialated,'skel',10);

BWedged = BWin;

se2 = strel('square',15);

%BWedged1 = imdilate(BWedged, se2);

BWedged1 = BWedged;

se3 = strel('square',10);
%BWedged2 = imerode(BWedged1, se2);
BWedged2 = BWedged1;


figure, imshow(BWedged2);

[H,theta,rho] = hough(BWedged2);

%P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
P = houghpeaks(H,5000,'threshold',ceil(0.5*max(H(:))) );
lines = houghlines(BWedged,theta,rho,P,'FillGap',4,'MinLength',5);

%figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,'InitialMagnification','fit');
%xlabel('\theta (degrees)'), ylabel('\rho');
%axis on, axis normal;
%colormap(hot);

figure, imshow(BWedged2), hold on;

%figure, imshow(I), hold on
max_len = 0;

length(lines)
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

%subplot(2,2,1), image(I), title(num2str(m(3)));
%subplot(2,2,2), image(Igray), title('2');
%subplot(2,2,3), image(BW), title('3');
%subplot(2,2,2), imshow(I(:,:,1)), title('1');
%subplot(2,2,3), imshow(I(:,:,2)), title('Intensity Image: Green Layer');
%subplot(2,2,4), imshow(I(:,:,3)), title('Intensity Image: Blue Layer');



whos % Check what variables you now have stored. 
