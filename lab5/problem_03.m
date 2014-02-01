withnoise = imread('noisy_2.tif');
h = fspecial('average', [3, 3]);
denoise = imfilter(withnoise, h);

mse = MSE(withnoise, denoise);






