img = imread('autumn.tif');
equalized_img = histeq(img);
figure,
subplot(1,2,1), imshow(img), title('Original Image')
subplot(1,2,2), imshow(equalized_img), title('Histogram Equalized Image')