%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% (c) Rafeef Abu-Gharbieh, Karin Althoff, Ghassan Hamarneh  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function edgedata=CVedge(I,M,T,A); 
%CVedge finds the coordinates of the edges in an image 
% 
%function edgedata=CVedge(I,M,T,A); 
%	M	1:subpixel 
%	T		T:threshold = T 
%	A		A:width of smoothing kernel = B 
%	M	2:edge function 
%	T		T:threshold 
%	A		A:method ex. 'Sobel', 'Roberts' 
%	edgedata a 2-row matrix, with the x and y coordinates of the edges 
% 
%	See also: CVimage, CVhough, CVunhough, CVedge, CVline, CVproj 
 
if M>3 
   error('M should be 1(subpixel) or 2(edge)'); 
elseif M==1 %SUBPIXEL 
   edgedata=[];    
   for rownr = 1:size(I,1); 
      row = I(rownr,:); 
      edgeposfine=rowedges(row,A,T); 
      edgedata=[edgedata [edgeposfine;rownr*ones(size(edgeposfine))]]; 
   end;    
elseif M==2 %EDGE 
   switch A 
   case 1,  
      meth='sobel'; 
   case 2,  
      meth='prewitt'; 
   case 3,  
      meth='roberts'; 
   case 4,  
      meth='log'; 
   case 5,  
      meth='zerocross'; 
   case 6,  
      meth='canny'; 
   otherwise,  
      error('edge method values only 1 through 6'); 
   end    
   E=edge(I,meth,T); 
   % the edge of vertical direction 
   E(1,:)=0;E(:,size(I,2))=0; 
   E(2,:)=0;E(:,size(I,2)-1)=0;E(:,size(I,2)-2)=0; 
   E(:,1)=0;E(size(I,1),:)=0; 
   E(:,2)=0;E(size(I,1)-1,:)=0;E(size(I,1)-2,:)=0; 
    
   [r,c]=find(E); 
   edgedata=[c';r']; 
elseif M==3 %my method detect horizontal line 
    Model=[-1 -1 -1;2 2 2;-1 -1 -1]; 
    IM  =  conv2(I,Model,'same'); 
    %IM  =  uint8(abs(IM)); 
    %H   =  imhist(IM); 
    IM  =  abs(IM); 
    IMmax = max(IM(:)); 
    IMmin = min(IM(:)); 
    lowthresh  =  100;%0.4*(IMmax-IMmin); 
    highthresh =  200;%0.8*(IMmax-IMmin); 
    E(1,:)=0; 
   E(:,size(IM,2))=0; 
   E(2,:)=0; 
   E(:,size(IM,2)-1)=0; 
   E(:,size(IM,2)-2)=0; 
   E(:,1)=0; 
   E(size(IM,1),:)=0; 
   E(:,2)=0; 
   E(size(IM,1)-1,:)=0; 
   E(size(IM,1)-2,:)=0; 
    E = ((lowthresh < IM)&(IM< highthresh)); 
    %for i=1:size(I,1) 
        %for j= 1:size(I,2) 
            %E(i,j) = (lowthresh < IM(i,j))&& (IM(i,j)< highthresh); 
            %end 
            %end 
    [r,c]=find(E); 
    edgedata=[c';r']; 
end