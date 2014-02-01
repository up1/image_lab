load('PSF_missing_motion.mat')
n = imread('missing_motion.tif');
J = deconvwnr( n, PSF, 0 );
imshow(J); 