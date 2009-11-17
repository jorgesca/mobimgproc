I = imread('blobs.png');
imshow(I,[]);
BW = im2bw(I);
s = size(BW);

% frame_plot(BW, 10, 10);

for row = 2:s(1)
   for col=1:s(2)
      if BW(row,col)
         break;
      end
   end

   contour = bwtraceboundary(BW, [row, col], 'N');
   if(~isempty(contour))
      hold on;
      plot(contour(:,2),contour(:,1),'g','LineWidth',2);
      hold on;
      plot(col, row,'gx','LineWidth',2);
   else
      hold on; plot(col, row,'rx','LineWidth',2);
   end
%    row
%    col
%    pause;


end