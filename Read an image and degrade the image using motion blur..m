img = imread('autumn.tif');
PSF = fspecial('motion', 21, 11);
motion_blur_img = imfilter(img, PSF, 'conv', 'circular');
figure,
subplot(1,2,1), imshow(img), title('Original Image')
subplot(1,2,2), imshow(motion_blur_img), title('Motion Blurred Image')