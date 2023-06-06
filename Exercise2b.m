function histogram = Exercise2b(path)
im=imread(path);
im=uint8(im);
figure();
imhist(im);
%% equal
equal_im=histeq(im);
figure();
subplot(1,2,1)
imshow(equal_im)
subplot(1,2,2)
imhist(equal_im)
imwrite(equal_im,'./output/exercise2c/enhanced.jpg');
end
