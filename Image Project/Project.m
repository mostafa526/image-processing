clc;
close all  ;
 
img= imread('rec1.png');
 pic=img;
[CircleFlag ,I] = CheckingType(img);


if CircleFlag 
     Props = CircleProps(I);% return value = Parts Area , Cetroid
     RGBBox = GetLegends( img );% return value = RGBBox
    [ rect,num_rect,text,num_text ] =  extract_legends(RGBBox);
    pie_matching(rect,num_rect,text,num_text ,Props  , pic)

    
else
    
    [Props , MinY] = ColProps(img);% return YMin,region pros Centroid , Bounding Box
	[TheNumOfMaxCol , MaxHigh] = getTop(img , MinY);  %[TheNumOfMaxCol , MaxHigh]
    
 	RGBBox = GetLegends( img );% return value is RGBBox of the legends
    [ rect,num_rect,text,num_text ] =  extract_legends(RGBBox);
    bar_matching( rect,num_rect,text,num_text,Props, TheNumOfMaxCol ,MaxHigh ,pic  )


end

