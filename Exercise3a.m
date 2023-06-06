function []=Exercise3a()
lena=imread('test_images\Lena512_ASCII2014.pgm');
peppers=imread('test_images\Peppers512_ASCII2014.pgm');
baboon=imread('test_images\Baboon512_ASCII2014.pgm');
output1=255-lena;
output2=255-peppers;
output3=255-baboon;

figure();
subplot(1,3,1)
imshow(uint8(output1));
subplot(1,3,2)
imshow(uint8(output2));
subplot(1,3,3)
imshow(uint8(output3));

lenac=imread('test_images\Lena512c_ASCII2014.ppm');
peppersc=imread('test_images\Peppers512c_ASCII2014.ppm');
baboonc=imread('test_images\Baboon512c_ASCII2014.ppm');
output1=255-lenac;
output2=255-peppersc;
output3=255-baboonc;

figure();
subplot(1,3,1)
imshow(uint8(output1));
subplot(1,3,2)
imshow(uint8(output2));
subplot(1,3,3)
imshow(uint8(output3));