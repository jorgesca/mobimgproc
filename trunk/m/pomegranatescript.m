pomegranate = imread('c:\project\11092009037.jpg');
subplot(2,2,1), image(pomegranate), title('Tasty Pomegranate Seeds (RGB)');
subplot(2,2,2), imshow(pomegranate(:,:,1)), title('Intensity Image: Red Layer');
subplot(2,2,3), imshow(pomegranate(:,:,2)), title('Intensity Image: Green Layer');
subplot(2,2,4), imshow(pomegranate(:,:,3)), title('Intensity Image: Blue Layer');