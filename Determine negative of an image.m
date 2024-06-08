img = imread('autumn.tif');
negative_img = imcomplement(img);
figure,
subplot(1,2,1), imshow(img), title('Original Image')
subplot(1,2,2), imshow(negative_img), title('Negative Image')