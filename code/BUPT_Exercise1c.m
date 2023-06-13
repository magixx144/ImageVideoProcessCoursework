function sub1=BUPT_Exercise1c(path)
im=imread(path);
im=im2gray(im);
%% subsample
sub1=im(1:1:end,1:2:end);
sub2=im(1:2:end,1:1:end);
sub3=im(1:2:end,1:8:end);
sub4=im(1:4:end,1:4:end);

subplot(2,2,1)
imshow(sub1)
title('2 horizontal')

subplot(2,2,2)
imshow(sub2)
title('2 vertical')

subplot(2,2,3)
imshow(sub3)
title('2 vertical and 8 horizontal')

subplot(2,2,4)
imshow(sub4)
title('4 vertical and 4 horizontal')
%% artifact
im2 = imread("../results/output/exercise1c/No_aliasing.jpg");
im2 = im2gray(im2);
sub5=im2(1:8:end, 1:8:end);
subplot(1,2,1)
imshow(im2)
title('without aliasing')
subplot(1,2,2)
imshow(sub5)
title('aliasing')
imwrite(sub5,"../results/output/exercise1c/Aliasing.jpg");
end
