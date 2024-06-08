img = imread('autumn.tif');
if size(img, 3) == 3
    img_gray = rgb2gray(img); 
else
    img_gray = img;
end
gray_levels = [128, 64, 32, 16, 8];
figure, 
subplot(2, 3, 1), imshow(img_gray), title('Original Grayscale Image')
for i = 1:length(gray_levels)
    reduced_img = reduce_gray_levels(img_gray, gray_levels(i));
    subplot(2, 3, i + 1), imshow(reduced_img, []), title([num2str(gray_levels(i)) ' Gray Levels'])
end
function reduced_img = reduce_gray_levels(img, levels)  
    img = double(img);
    step_size = 256 / levels; 
    reduced_img = floor(img / step_size) * step_size;    
    reduced_img = uint8(reduced_img);
end
