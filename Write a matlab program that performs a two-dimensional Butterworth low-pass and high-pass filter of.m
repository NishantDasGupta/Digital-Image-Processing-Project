img = imread('autumn.tif');
img_gray = img; % Assuming the image is already grayscale, otherwise use rgb2gray(img)
D0 = 30; % Cut-off frequency
n = 2; % Filter order

% Butterworth Low-pass filter
H_low = butterworth_low_pass(size(img_gray), D0, n);
filtered_img_low = ifft2(fftshift(H_low .* fftshift(fft2(double(img_gray)))));

% Butterworth High-pass filter
H_high = butterworth_high_pass(size(img_gray), D0, n);
filtered_img_high = ifft2(fftshift(H_high .* fftshift(fft2(double(img_gray)))));

% Display images
figure,
subplot(1,3,1), imshow(img_gray, []), title('Original Grayscale Image')
subplot(1,3,2), imshow(real(filtered_img_low), []), title('Butterworth Low-pass Filtered Image')
subplot(1,3,3), imshow(real(filtered_img_high), []), title('Butterworth High-pass Filtered Image')

% Function to create a Butterworth Low-pass Filter
function H = butterworth_low_pass(dim, D0, n)
    [U, V] = dftuv(dim(1), dim(2));
    D = sqrt(U.^2 + V.^2);
    H = 1 ./ (1 + (D ./ D0).^(2*n));
end

% Function to create a Butterworth High-pass Filter
function H = butterworth_high_pass(dim, D0, n)
    [U, V] = dftuv(dim(1), dim(2));
    D = sqrt(U.^2 + V.^2);
    H = 1 ./ (1 + (D0 ./ D).^(2*n));
end

% Function to compute the frequency grid
function [U, V] = dftuv(M, N)
    u = 0:(M-1);
    v = 0:(N-1);
    idx = find(u > M/2);
    u(idx) = u(idx) - M;
    idy = find(v > N/2);
    v(idy) = v(idy) - N;
    [V, U] = meshgrid(v, u);
end
