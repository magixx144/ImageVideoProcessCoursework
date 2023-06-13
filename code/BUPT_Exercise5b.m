function [output]=BUPT_Exercise5b(op)
%op: 1:sobel  2:roberts 3:prewitt
if op==1  %op: 1:sobel 
    x=[ 1 0 -1; 2 0 -2; 1 0 -1]; 
    y=[ -1 -2 -1; 0 0 0; 1 2 1];
elseif op==2  %op: 2:roberts
    x=[ 0 0 -1; 0 1 0; 0 0 0];
    y=[ -1 0 0; 0 1 0; 0 0 0];
elseif op==3  %op:  3:prewitt
    x=[ 1 0 -1; 1 0 -1; 1 0 -1];
    y=[ -1 -1 -1; 0 0 0; 1 1 1];
elseif op==4
    x=[0 -1 0; -1 4 -1; 0 -1 0];
end
%img=imread('test_images\Lena512_Binary2014.pgm');
img=imread('../dataset/test_images/Lena512_Binary2014.pgm');
tx = double(imfilter(img,x,'replicate'));
ty = double(imfilter(img,y,'replicate'));
T = ((tx.*tx)+(ty.*ty)).^0.5;
output = uint8(T);
output=output+img;
figure, imshow(uint8(output)); 
%title("Sobel edge");
title("Prewitt edge");
imwrite(output,'../results/output/exercise5b/edgeEnhance.jpg');
end