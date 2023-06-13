function d_convert=BUPT_format_converter(path)
ppm=fopen(path,'r');
flag=0;%0为binary,1为ASCII
%% read
%scan the file
reader=fscanf(ppm,"%s",1);

%is ASCII/P2
if(strcmp(reader,'P3')==1)
    flag=1;
end
%comment
reader=fscanf(ppm,"%s",1);
comment=fgets(ppm);

%%获取长宽
%width
reader=fscanf(ppm,'%s',1);
width=str2num(reader);
%height
reader=fscanf(ppm,'%s',1);
height=str2num(reader);
%color level
reader=fscanf(ppm,'%s',1);
level=str2num(reader);
%ASCII
%ASCII
if(flag==1)
    for i=1:height
        for j=1:width
            file(i,j,1)=fscanf(ppm,'%i',1);%R
            file(i,j,2)=fscanf(ppm,'%i',1);%G
            file(i,j,3)=fscanf(ppm,'%i',1);%B
        end
    end
%binary
else
    image_arr=uint8(fread(ppm));
    index=1;
    for i=1:height
        for j=1:width
            index=index+1;
            file(i,j,1)=image_arr(index);
            index=index+1;
            file(i,j,2)=image_arr(index);
            index=index+1;
            file(i,j,3)=image_arr(index);
        end
    end
end

R=file(:,:,1);
G=file(:,:,2);
B=file(:,:,3);
Y =  0.257 * R + 0.504 * G + 0.098 * B + 16;
U = -0.148 * R - 0.291 * G + 0.439 * B + 128;
V =  0.439 * R - 0.368 * G - 0.071 * B + 128;
%% rgb2grey
d_convert=cat(1,Y);
convert=uint8(d_convert);
ppm2pgm=fopen('../results/output/exercise1b/result_grey.pgm','w');
fprintf(ppm2pgm,'P2\n');
fprintf(ppm2pgm,'# image created by Yuwei_Min\n');
fprintf(ppm2pgm,"%u ",width);
fprintf(ppm2pgm,"%u\n",height);
fprintf(ppm2pgm,"%u\n",level);
for i=1:height
    for j=1:width
        fprintf(ppm2pgm,"%u ",convert(i,j,1));
    end
end
fclose(ppm2pgm);
YUV(:,:,1)=Y;
YUV(:,:,2)=U;
YUV(:,:,3)=V;
subplot(1,2,1);
imshow(uint8(YUV));
imwrite(YUV,'../results/output/exercise1b/RGB2YUV.jpg');
title("rgb2YUV");
%% YUV2rgb
Rc = 1.164*(Y - 16) + 1.596*(V - 128);
Gc = 1.164*(Y - 16) - 0.813*(V - 128) - 0.391*(U - 128);
Bc = 1.164*(Y - 16) + 2.018*(U - 128);
rgb(:,:,1) = Rc;
rgb(:,:,2) = Gc;
rgb(:,:,3) = Bc;
subplot(1,2,2);
imshow(uint8(rgb));
imwrite(rgb,'../results/output/exercise1b/YUV2RGB.jpg');
title("yuv2RGB");





