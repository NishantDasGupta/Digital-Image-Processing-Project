img = imread('autumn.tif');
salt_pepper_img = imnoise(img, 'salt & pepper', 0.02);
gaussian_img = imnoise(img, 'gaussian');
filtered_sp_3x3 = imfilter(salt_pepper_img, ones(3, 3) / 9);
filtered_sp_5x5 = imfilter(salt_pepper_img, ones(5, 5) / 25);
filtered_gauss_3x3 = imfilter(gaussian_img, ones(3, 3) / 9);
filtered_gauss_5x5 = imfilter(gaussian_img, ones(5, 5) / 25);
figure,
subplot(2,3,1), imshow(salt_pepper_img), title('Salt & Pepper Noise')
subplot(2,3,2), imshow(filtered_sp_3x3), title('Filtered 3x3')
subplot(2,3,3), imshow(filtered_sp_5x5), title('Filtered 5x5')
subplot(2,3,4), imshow(gaussian_img), title('Gaussian Noise')
subplot(2,3,5), imshow(filtered_gauss_3x3), title('Filtered 3x3')
subplot(2,3,6), imshow(filtered_gauss_5x5), title('Filtered 5x5')