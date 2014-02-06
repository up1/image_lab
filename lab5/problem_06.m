load('PSF_bonus_motion.mat');
I = im2double(imread('bonus_motion.tif'));

myNoise = zeros(size(I, 1), size(I, 2));
noise = imnoise( myNoise,'gaussian', 0, 0.0050301);

for i=5:5

    h = fspecial('gaussian', [i, i], 1);
    myOriginal = imfilter(I, h);
    %myOriginal = medfilt2(I, [7,7]);

    Svv = abs(fft2( noise )).^2;
    Sff = abs(fft2( myOriginal )).^2;

    NSR = Svv ./ Sff;
    J = deconvwnr(I, PSF, NSR);

    mse = MSE(myOriginal, J);
    
    display(['mse = ' num2str(mse)]);
    
    subplot(1,3,1); 
    imshow(noise); title('Noise');
    subplot(1,3,2); 
    imshow(myOriginal); title('Original');
    subplot(1,3,3); 
    imshow(J); title('Denoise');
end;