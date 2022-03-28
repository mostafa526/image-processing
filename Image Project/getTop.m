function [NumOfMaxCol , MaxHigh] = getTop (Original ,MaxY)

 
  
 
    img = im2bw(Original , 0.8);
    img =~ img ;
    [h,w]= size(img);
    for H = 1: h
        for W = 1: w

            if  W > w/15 
                 img(H,W) = 0;
            end
        end 
    end


    SE = ones(2);
    img=imerode(img, SE);



    SE = ones(10);
    img=imdilate(img, SE);



    [L , Num] = bwlabel(img);

    Props = regionprops(L , 'BoundingBox');

    MinY = 10000000 ; 

    for i = 1 : Num

        y =Props(i).BoundingBox(2);y=round(y);
        if MinY > y

            MinY = y ; 
            TargetIndex  = i;

        end

    end

    x= Props(TargetIndex).BoundingBox(1);x=round(x);
    y= Props(TargetIndex).BoundingBox(2);y=round(y);
    width= Props(TargetIndex).BoundingBox(3);
    hight= Props(TargetIndex).BoundingBox(4);

    NumOnly = imcrop(Original,[x y width-3 hight]);

    NumOnly = im2bw(NumOnly );

    T = ocr(NumOnly , 'TextLayout' ,'Block');

    NumOfMaxCol = str2double(T.Words);
   
    NumOfMaxCol 
    MaxHigh = MaxY - y;
    MaxHigh = round(MaxHigh);
    %figure , imshow(NumOnly)
    return
end 
 
 
 
 

