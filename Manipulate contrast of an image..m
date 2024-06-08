img = imread('autumn.tif');
contrast_img = imadjust(img, stretchlim(img), []);
figure,
subplot(1,2,1), imshow(img), title('Original Image')
subplot(1,2,2), imshow(contrast_img), title('Contrast Adjusted Image')