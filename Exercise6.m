function [output] = Exercise6( sigma, kernel )

img=imread("test_images\Lena512_Binary2014.pgm");
%img=imread("test_images\Baboon512_binary2014.pgm");
if nargin == 1
    kernel = 6*sigma; %kernel
end

[h, w] = size(img);

K = [kernel, kernel]; %kernel

% filter
range = (K-1)/2;%kernel range
std = sqrt(sigma);
[x,y] = meshgrid(-range(2):range(2),-range(1):range(1));
filter = -1/(pi*(std^4))*(1-(x.*x+y.*y)/(2*std^2)).*exp(-(x.*x+y.*y)/(2*std^2));

% gauss filtering
img_filt = filter2(filter,img);
figure();imshow(img_filt);

% edge detecting 
output = zeros(h,w);
T = 0.75*mean2(abs(img_filt(2:h-1,2:w-1)));

for i=2:h-1
    for j=2:w-1
        if img_filt(i,j)<0
            if img_filt(i+1,j)>0||img_filt(i,j+1)>0||img_filt(i,j-1)>0||img_filt(i-1,j)>0
                if max([img_filt(i+1,j) img_filt(i,j+1) img_filt(i,j-1) img_filt(i-1,j)])-img_filt(i,j)>T
                    output(i,j)=1;
                end
            end
        else 
            if img_filt(i,j)==0
                if (img_filt(i+1,j)*img_filt(i-1,j)<0&&abs(img_filt(i+1,j)-img_filt(i-1,j))>2*T)||(img_filt(i,j+1)*img_filt(i,j-1)<0&&abs(img_filt(i,j+1)-img_filt(i,j-1))>2*T)
                    output(i,j)=1;
                end
            end
        end
    end
end
output = output*255; 
figure, imshow(uint8(output)); 
end
