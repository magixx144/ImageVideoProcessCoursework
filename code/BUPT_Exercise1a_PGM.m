function PGM=BUPT_Exercise1a_PGM(path)
pgm=fopen(path,'r');
flag=0;%0为binary,1为ASCII
%% read
%scan the file
reader=fscanf(pgm,"%s",1);

%is ASCII/P2
if(strcmp(reader,'P2')==1)
    flag=1;
end
%comment
reader=fscanf(pgm,"%s",1);
comment=fgets(pgm);

%%获取长宽
%width
reader=fscanf(pgm,'%s',1);
width=str2num(reader);
%height
reader=fscanf(pgm,'%s',1);
height=str2num(reader);
%color level
reader=fscanf(pgm,'%s',1);
level=str2num(reader);
%ASCII
if(flag==1)
    for i=1:height
        for j=1:width
            file(i,j,1)=fscanf(pgm,'%i',1);
        end
    end
%binary
else
image_arr=uint8(fread(pgm));
index=1;
for i=1:height
    for j=1:width
        index=index+1;
        file(i,j,1)=image_arr(index);
    end
end
end

%% write
if(flag==1)
    newFileP2=fopen('../results/output/exercise1a/result_pgmP2.pgm','w');
    %header
    fprintf(newFileP2,'P2\n');
    fprintf(newFileP2,'# image created by Yuwei_Min\n');
    fprintf(newFileP2,"%u ",width);
    fprintf(newFileP2,"%u\n",height);
    fprintf(newFileP2,"%u\n",level);
    %body
    for i=1:height
        for j=1:width
            fprintf(newFileP2,"%u ",file(i,j,1));
        end
    end
    fclose(newFileP2);
else
    newFileP5=fopen('../results/output/exercise1a/result_pgmP5.pgm','wb');
    fprintf(newFileP5,'P5\n');
    fprintf(newFileP5,'# image created by Yuwei_Min\n');
    fprintf(newFileP5,"%u ",width);
    fprintf(newFileP5,"%u\n",height);
    fprintf(newFileP5,"%u\n",level);
    fwrite(newFileP5, file', 'uint8');
    fclose(newFileP5);
end







