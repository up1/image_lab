withnoise = imread('noisy_2.tif');
h = fspecial('gaussian', [3, 3], 0.5);
denoise = imfilter(withnoise, h);

mse = MSE(withnoise, denoise)






