function PPM=BUPT_Exercise1a_PPM(path)
ppm=fopen(path,'r');
flag=0;%0为binary,1为ASCII

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

if(flag==1)
    %write
    newFileP3=fopen('../results/output/exercise1a/result_pgmP3.ppm','w');
    %header
    fprintf(newFileP3,'P3\n');
    fprintf(newFileP3,'# image created by Yuwei_Min\n');
    fprintf(newFileP3,"%u ",width);
    fprintf(newFileP3,"%u\n",height);
    fprintf(newFileP3,"%u\n",level);
    %body
    for i=1:height
        for j=1:width
            fprintf(newFileP3,"%u ",file(i,j,1));
            fprintf(newFileP3,"%u ",file(i,j,2));
            fprintf(newFileP3,"%u ",file(i,j,3));
        end
    end
    fclose(newFileP3);
else
    newFileP6=fopen('../results/output/exercise1a/result_pgmP6.ppm','wb');
    fprintf(newFileP6,'P6\n');
    fprintf(newFileP6,'# image created by Yuwei_Min\n');
    fprintf(newFileP6,"%u ",width);
    fprintf(newFileP6,"%u\n",height);
    fprintf(newFileP6,"%u\n",level);
    fwrite(newFileP6, permute(file, [3 2 1]), 'uint8');
    fclose(newFileP6);
end
