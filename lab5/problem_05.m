load('PSF_missing_motion.mat')
I = im2double(imread('missing_motion.tif'));
original = im2double(imread('missing.tif'));
noise = im2double(imread('missing_noise.tif'));

Svv = abs(fft2( noise )).^2;
Sff = abs(fft2( original )).^2;

NSR = Svv ./ Sff;
J = deconvwnr(I, PSF, NSR);

mse = MSE(original, J)

subplot(1,3,1); 
imshow(noise); title('Noise');
subplot(1,3,2); 
imshow(original); title('Original');
subplot(1,3,3); 
imshow(J); title('Denoise');