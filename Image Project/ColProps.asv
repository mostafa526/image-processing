function [Props , MinY] = ColProps( Original)
 
    %% filter the columes only
    SE = ones(25);
    Col=imclose(Original, SE);
 

    %% BW
    BWCol = im2bw(Col, 0.95);
    BWCol = ~BWCol ;
    %figure, imshow(BWCol)
    [labeledImage , Num] = bwlabel(BWCol);
    Props = regionprops(labeledImage,'BoundingBox' ,'Centroid');
    Num 
    
    Y = Props( 2).BoundingBox(2);
    H = Props(  2).BoundingBox(4);
    MinY =H + Y;
	round(MinY)
end 
