img = imread('autumn.tif');
img_gray = img; % Image is already grayscale
% High-pass filter in frequency domain
H_high = butterworth_high_pass(size(img_gray), 30, 2);
filtered_img_high = ifft2(fftshift(H_high .* fftshift(fft2(double(img_gray)))));
% Low-pass filter in frequency domain
H_low = butterworth_low_pass(size(img_gray), 30, 2);
filtered_img_low = ifft2(fftshift(H_low .* fftshift(fft2(double(img_gray)))));
% Band-pass filter in frequency domain
H_band_pass = butterworth_band_pass(size(img_gray), 10, 50, 2);
filtered_img_band_pass = ifft2(fftshift(H_band_pass .* fftshift(fft2(double(img_gray)))));
% Band-stop filter in frequency domain
H_band_stop = butterworth_band_stop(size(img_gray), 10, 50, 2);
filtered_img_band_stop = ifft2(fftshift(H_band_stop .* fftshift(fft2(double(img_gray)))));
figure,
subplot(2,2,1), imshow(real(filtered_img_high), []), title('High-pass Filter')
subplot(2,2,2), imshow(real(filtered_img_low), []), title('Low-pass Filter')
subplot(2,2,3), imshow(real(filtered_img_band_pass), []), title('Band-pass Filter')
subplot(2,2,4), imshow(real(filtered_img_band_stop), []), title('Band-stop Filter')
function H = butterworth_low_pass(dim, D0, n)
% Butterworth Low-pass Filter
[U, V] = dftuv(dim(1), dim(2));
D = sqrt(U.^2 + V.^2);
H = 1 ./ (1 + (D ./ D0).^(2*n));
end
function H = butterworth_high_pass(dim, D0, n)
% Butterworth High-pass Filter
[U, V] = dftuv(dim(1), dim(2));
D = sqrt(U.^2 + V.^2);
H = 1 ./ (1 + (D0 ./ D).^(2*n));
end
function H = butterworth_band_pass(dim, D1, D2, n)
% Butterworth Band-pass Filter
[U, V] = dftuv(dim(1), dim(2));
D = sqrt(U.^2 + V.^2);
H = 1 ./ (1 + ((D.^2 - D1*D2) ./ (D .* (D2 - D1))).^(2*n));
end
function H = butterworth_band_stop(dim, D1, D2, n)
% Butterworth Band-stop Filter
[U, V] = dftuv(dim(1), dim(2));
D = sqrt(U.^2 + V.^2);
H = 1 ./ (1 + ((D .* (D2 - D1)) ./ (D.^2 - D1*D2)).^(2*n));
end
function [U, V] = dftuv(M, N)
% Compute meshgrid frequency matrices.
u = 0:(M-1);
v = 0:(N-1);
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
[V, U] = meshgrid(v, u);
end