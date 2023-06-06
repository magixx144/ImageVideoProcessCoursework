function output = BUPT_transform(rotate,skew,flag)
img=imread("output\exercise3b\mona_lisa.jpg");
[h, w] = size(img);  
rotate=rotate/180*pi;  
skew=-(90-skew)/180*pi;

rotate=[cos(rotate) -sin(rotate) 0;sin(rotate) cos(rotate) 0;0 0 1];

if skew==0
    skew=[1 0 0; 0 1 0; 0 0 1];
else
    skew=[1 1/(tan(skew)) 0; 0 1 0; 0 0 1];
end

if flag==1 
    T=rotate*skew;
else
    T=skew*rotate;
end

C1=T*[1 1 1]';  % origin point
C2=T*[w h 1]';  % diagonal point
C3=T*[1 h 1]';  % top point
C4=T*[w 1 1]';  % right point
newMax=max(C1,max(C2,max(C3,C4)));
newMin=min(C1,min(C2,min(C3,C4)));
newMax1=round(newMax);
newMin1=round(newMin);
output = zeros(newMax1(2)-newMin1(2)+1,1+newMax1(1)-newMin1(1));


for i=1:h
    for j=1:w
        locate=T*[j i 1]';
        output(round(locate(2))-newMin1(2)+1,1+round(locate(1))-newMin1(1))=img(i,j);
    end
end

[h_new,w_new] = size(output);
for i=1:h_new
    for j=1:w_new
        if output(i,j)==0
            old=round(inv(T)*[j+newMin1(1)-1 i+newMin1(2)-1 1]');
            if old(1)>0&&old(2)>0&&old(1)<w&&old(2)<h
                output(i,j)=img(old(2),old(1));
            end
        end
    end
end 
figure, imshow(uint8(output));
title("transform");
end 

