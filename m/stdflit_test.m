I = imread('circuit.tif');
J = stdfilt(I); 
imshow(I);
figure, imshow(J,[]); 