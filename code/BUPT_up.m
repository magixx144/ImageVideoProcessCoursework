function [output] = BUPT_up( type, factor )

img=imread("../dataset/test_images/Lena512_Binary2014.pgm");
img=imread("../dataset/test_images/Baboon512_ASCII2014.pgm");
%sample type  1:nearest  2:bilinear
if type==1
    output = imresize(img, factor, 'nearest');
    figure, imshow(uint8(output)); 
    imwrite(uint8(output),'../results/output/exercise4b/nearest.jpg');
elseif type==2
    output = imresize(img, factor, 'bilinear');
    figure, imshow(uint8(output)); 
    imwrite(uint8(output),'../results/output/exercise4b/bilinear.jpg');
end

