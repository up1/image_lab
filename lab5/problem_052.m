load('PSF_missing_motion.mat')
I = im2double(imread('missing_motion.tif'));

myNoise = zeros(size(I, 1), size(I, 2));
noise = imnoise( myNoise,'gaussian', 0.00083934);

myOriginal = medfilt2(I, [5,5]);

Svv = abs(fft2( noise )).^2;
Sff = abs(fft2( myOriginal )).^2;

NSR = Svv ./ Sff;
J = deconvwnr(I, PSF, NSR);

mse = MSE(myOriginal, J)

figure; imshow(J);