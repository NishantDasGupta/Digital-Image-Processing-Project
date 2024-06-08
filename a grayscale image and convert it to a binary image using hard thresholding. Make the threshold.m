img = imread('cameraman.tif');
threshold = 100;
binary_img = img > threshold;
figure,
subplot(1,2,1), imshow(img), title('Original Image')
subplot(1,2,2), imshow(binary_img), title(['Binary Image with Threshold '
num2str(threshold)])