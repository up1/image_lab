function mse = MSE( originalImage, denoiseImage )
    mse = mean( (originalImage(:) - denoiseImage(:)).^2 );
end

