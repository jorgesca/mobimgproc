I=imread('c:\project\images\cell1.jpg'); % Load the image file and store it as the variable I. 

whos % Type "whos" in order to find out the size and class of all stored variables. 

save I % Save the variable I. 

ls % List the files in your directory. 

% There should now be a file named "I.mat" in you directory 
% containing your variable I. 

clear % Clear Matlab's memory. 

load I % Load the variable I that we saved above. 

whos % Check that it was indeed loaded. 

imshow(I); % Display the image 

I=im2double(I); % Convert the variable into double. 

whos % Check that the variable indeed was converted into double 

% The next procedure cuts out the upper left corner of the image 
% and stores the reduced image as Ired. 

for i=1:256
for j=1:256
Ired(i,j)=I(i,j);
end
end 

whos % Check what variables you now have stored. 

imshow(Ired) % Display the reduced image. 