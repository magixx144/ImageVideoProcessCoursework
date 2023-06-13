function [ output ] = BUPT_lowpass( sigma )

lena = imread('../dataset/test_images/Lena512_Binary2014.pgm'); 

power_dbm = 50;  % unit:dBm
power_linear = 10^(power_dbm / 10-3);  % dBm2linear
variance = power_linear / (255^2);  

noisy_lena = imnoise(lena, 'gaussian', 0, variance);
imshow(noisy_lena);

%kernel
s = [(50-1)/2 (50-1)/2];
%atandard 
std = sigma^2;
[x, y] = meshgrid(-s(2):s(2),-s(1):s(1));  %Generate a matrix with (line, column)
ang = -(x.*x + y.*y)/(2*std);
t = exp(ang);

% lowpass filter
t(t<eps*max(t(:))) = 0;
sumh = sum(t(:));


if sumh ~= 0 
    t=t/sumh;
end
output = imfilter(noisy_lena,t,'symmetric');
figure, imshow(uint8(output));
imwrite(uint8(output),'../results/output/exercise5a/filtered.jpg');
end 






