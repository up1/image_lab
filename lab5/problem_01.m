g = imread('noisy_2.tif');
B = roipoly(g);

p = imhist(g(B));
figure, bar(p, 1);
