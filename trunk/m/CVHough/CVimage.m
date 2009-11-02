%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% (c) Rafeef Abu-Gharbieh, Karin Althoff, Ghassan Hamarneh  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function I=CVimage; 
%function I=CVimage; 
%CVimage returns a normalized (0-1) grey scale image given the path 
%	I 	returned image 
% 
%	See also: CVimage, CVhough, CVunhough, CVedge, CVline, CVproj 
 
 
[F,P]=uigetfile('*.pgm;*.jpg;*.jpeg;*.tif;*.tiff;*.bmp;*.png;*.hdf;*.pcx;*.xwd','Choose Image'); 
 
if F==0 
   I=[]; 
else 
   PF=[P,F]; 
   ext=PF(findstr(PF,'.')+1:end); 
    
   if strcmp(ext,'pgm') 
      I  = readpgm(PF); 
   else %matlab image types 
       if strcmp(ext,'jpg')%my jpg format 
           Im= imread(PF); 
           In = rgb2gray(Im); 
           %I  = double(In);   
           I  = In; 
       else 
           [Im,MAP]=imread(PF); 
           if size(Im,3)>1 
               I = rgb2gray(Im); 
           else 
               I = ind2gray(Im,MAP); 
           end 
       end 
   end 
   if ~strcmp(ext,'jpg') 
       I = double(I); 
       I = I/max(I(:)); 
    end 
end 