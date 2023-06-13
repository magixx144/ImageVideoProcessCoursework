function quan_im=BUPT_Exercise2a(path,quan_factor)
im=BUPT_format_converter(path);%double arr
quan_im=fix(im/quan_factor);
l=256/quan_factor;
figure();
quan_im=uint8(quan_im/l*256)
imshow(quan_im);
imwrite(quan_im,'../results/output/exercise2a/quan_image.pgm');
end