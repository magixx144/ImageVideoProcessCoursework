function [] = Exercise4a(noise_type, sigma)
 

lena=imread('test_images\Lena512_Binary2014.pgm');
peppers=imread('test_images\Peppers512_binary2014.pgm');
baboon=imread('test_images\Baboon512_binary2014.pgm');
[h1, w1] = size(lena);
[h2, w2] = size(peppers);
[h3, w3] = size(baboon);


if noise_type==1  
    Img_noise1 = imnoise(lena,'gaussian',0,sigma);
    Img_noise2 = imnoise(peppers,'gaussian',0,sigma);
    Img_noise3 = imnoise(baboon,'gaussian',0,sigma);
else noise_type==2  
    Img_noise1 = imnoise(lena,'salt & pepper');
    Img_noise2 = imnoise(peppers,'salt & pepper');
    Img_noise3 = imnoise(baboon,'salt & pepper');
end


% MSE and PSNR
n1 = Img_noise1-lena;
n1 = n1.*n1;

n2 = Img_noise2-peppers;
n2 = n2.*n2;

n3 = Img_noise3-baboon;
n3 = n3.*n3;

dims1 = ndims(Img_noise1);  % rgb or grey
dims2 = ndims(Img_noise2);
dims3 = ndims(Img_noise3);

if dims1 == 2 % grey
    MSE1=sum(sum(n1))/(w1*h1);
    PSNR1=20*log10(255/(MSE1^0.5));
elseif dims1 == 3 % RGB
    MSE1=sum(sum(sum(n1))/(w1*h1*3));
    PSNR1=20*log10(255/(MSE1^0.5));
end
if dims2 == 2 % grey
    MSE2=sum(sum(n2))/(w2*h2);
    PSNR2=20*log10(255/(MSE2^0.5));
elseif dims2 == 3 % RGB
    MSE2=sum(sum(sum(n2))/(w2*h2*3));
    PSNR2=20*log10(255/(MSE2^0.5));
end
if dims3 == 2 % grey
    MSE3=sum(sum(n3))/(w3*h3);
    PSNR3=20*log10(255/(MSE3^0.5));
elseif dims3 == 3 % RGB
    MSE3=sum(sum(sum(n3))/(w3*h3*3));
    PSNR3=20*log10(255/(MSE3^0.5));
end

figure()
subplot(1,3,1)
imshow(Img_noise1);
title(strcat('MSE=',num2str(MSE1),', PSNR=',num2str(PSNR1)));
subplot(1,3,2)
imshow(Img_noise2)
title(strcat('MSE=',num2str(MSE2),', PSNR=',num2str(PSNR2)));
subplot(1,3,3)
imshow(Img_noise3)
title(strcat('MSE=',num2str(MSE3),', PSNR=',num2str(PSNR3)));

end


