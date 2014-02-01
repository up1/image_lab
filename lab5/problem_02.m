g = imread('noisy_1.tif');
K = medfilt2(g);
imshow(g), figure, imshow(K)
