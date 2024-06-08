img = imread('autumn.tif');
brighter_img = img + 50;
darker_img = img - 50;
figure,
subplot(1,3,1), imshow(img), title('Original Image')
subplot(1,3,2), imshow(brighter_img), title('Brighter Image')
subplot(1,3,3), imshow(darker_img), title('Darker Image')
