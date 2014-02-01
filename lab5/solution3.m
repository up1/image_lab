g = imread('missing_motion.tif');
B = roipoly(g);
p = imhist( g(B) );
figure, bar(p,1);

v = statmoments(p, 2);
display(['variant = ' num2str(v(2))]);
