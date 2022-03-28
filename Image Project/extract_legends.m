function [ rect,num_rect,text,num_text ] = extract_legends( i )
i2=im2bw(i,.9);
[hight,width]=size(i2);
img=ones(hight,width);
img2=zeros(hight,width);



[label,num]=bwlabel(i2);


reg1=regionprops(label,'BoundingBox');
x=reg1(1). BoundingBox(1);
y=reg1(1). BoundingBox(2);
w=reg1(1). BoundingBox(3);
h=reg1(1). BoundingBox(4);
for z=int64(y):h+int64(y)
        for e=int64(x):w+int64(x)
         img(z,e)=i2(z,e);
        end
end
%figure , imshow(img);

img=~img;

%figure , imshow(img);



img4=img;

se = strel('rectangle',[5 5]);
img=imerode(img,se);
[label1,num3]=bwlabel(img);
%figure , imshow(img);

num3

reg2=regionprops(label1,'BoundingBox');

for i=1:num3
 x=reg2(i).BoundingBox(1);
 y=reg2(i).BoundingBox(2);
 w=reg2(i).BoundingBox(3);
 h=reg2(i).BoundingBox(4);
 y=int64(y);
 x=int64(x);
 if(img(y,x)==1)
     
    for z=y:y+h
        for j=x:x+w
        img2(z,j)=img(z,j);
        end
    end
    
 end

%figure , imshow(img2);



end

se = strel('rectangle',[5 5]);
img2=imdilate(img2,se);
%figure , imshow(img2);

[label2,num4]=bwlabel(img2);

reg2=regionprops(label2,'BoundingBox','Area','Centroid');
rect=reg2;
num_rect=num4;








i3=img4-img2;
i3 = bwareaopen(i3,10);

se = strel('rectangle',[2 2]);
i3=imerode(i3,se);
%figure , imshow(i3);


se = strel('rectangle',[9 9]);
i3=imdilate(i3,se);
[labelll,num5]=bwlabel(i3);
%figure , imshow(i3);

text=regionprops(labelll,'BoundingBox','Area','Centroid');


num_text=num5;


end

