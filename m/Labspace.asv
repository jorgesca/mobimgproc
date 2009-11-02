I = imread('C:\Project\mobimgproc\images\white-2-complete.jpg'); 
cform = makecform('srgb2lab'); 
LAB = applycform(I, cform); 
rLAB = rangefilt(LAB);
imshow(I);
figure, imshow(I,[]);
figure, imshow(rLAB(:,:,1),[]);
%figure, imshow(rLAB(:,:,2),[]);
%figure, imshow(rLAB(:,:,3),[]);

E = edge(rLAB(:,:,1), 'sobel');
figure, imshow(E);