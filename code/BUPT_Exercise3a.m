function []=BUPT_Exercise3a()
lena=imread('../dataset/test_images/Lena512_ASCII2014.pgm');
peppers=imread('../dataset/test_images/Peppers512_ASCII2014.pgm');
baboon=imread('../dataset/test_images/Baboon512_ASCII2014.pgm');
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
imwrite(output1,'../results/output/exercise3a/output1.jpg');
imwrite(output2,'../results/output/exercise3a/output2.jpg');
imwrite(output3,'../results/output/exercise3a/output3.jpg');

lenac=imread('../dataset/test_images/Lena512c_ASCII2014.ppm');
peppersc=imread('../dataset/test_images/Peppers512c_ASCII2014.ppm');
baboonc=imread('../dataset/test_images/Baboon512c_ASCII2014.ppm');
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

imwrite(output1,'../results/output/exercise3a/output1c.jpg');
imwrite(output2,'../results/output/exercise3a/output2c.jpg');
imwrite(output3,'../results/output/exercise3a/output3c.jpg');