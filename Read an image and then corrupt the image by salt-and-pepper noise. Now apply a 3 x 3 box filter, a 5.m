img = imread('cameraman.tif');
salt_pepper_img = imnoise(img, 'salt & pepper', 0.02);
box_filter_3x3 = imfilter(salt_pepper_img, ones(3, 3) / 9);
box_filter_5x5 = imfilter(salt_pepper_img, ones(5, 5) / 25);
median_filter = medfilt2(salt_pepper_img, [3 3]);
figure,
subplot(2,2,1), imshow(salt_pepper_img), title('Salt & Pepper Noise')
subplot(2,2,2), imshow(box_filter_3x3), title('3x3 Box Filter')
subplot(2,2,3), imshow(box_filter_5x5), title('5x5 Box Filter')
subplot(2,2,4), imshow(median_filter), title('Median Filter')