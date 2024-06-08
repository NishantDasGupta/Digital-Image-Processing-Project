img = imread('autumn.tif');
mask3x3 = ones(3, 3) / 9;
mask5x5 = ones(5, 5) / 25;
avg_img3x3 = imfilter(img, mask3x3);
avg_img5x5 = imfilter(img, mask5x5);
figure,
subplot(1,3,1), imshow(img), title('Original Image')
subplot(1,3,2), imshow(avg_img3x3), title('Averaged with 3x3 Mask')
subplot(1,3,3), imshow(avg_img5x5), title('Averaged with 5x5 Mask')