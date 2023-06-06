function [] = Exercise2d()
imageA=imread('./test_images/Lena512C_ASCII2014.ppm');
imageB=imread('./test_images/Peppers512C_ASCII2014.ppm');
figure()
subplot(2,2,1)
imshow(imageA)
subplot(2,2,2)
imhist(imageA)
subplot(2,2,3)
imshow(imageB)
subplot(2,2,4)
imhist(imageB)

grayImageA = rgb2gray(imageA);

numBins = 256;
histValuesA = imhist(grayImageA, numBins);

%% model
grayImageB = rgb2gray(imageB);
eqImageB = histeq(grayImageB, histValuesA);
figure()
subplot(2,2,1);
imshow(imageA);
title('Image A');
subplot(2,2,2);
imshow(imageB);
title('Image B');
subplot(2,2,3);
imshow(grayImageA);
title('Gray Image A');
subplot(2,2,4);
imshow(eqImageB);
title('Equalized Image B using Histogram of Image A');
figure();
imhist(eqImageB)
%% expotential



