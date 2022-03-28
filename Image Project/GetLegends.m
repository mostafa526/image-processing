function  [RGBBox] = GetLegends( Original )

    %% Get the binaryImage
    img = rgb2gray(Original);
    binaryImage = img < 140;
    binaryImage = imfill(binaryImage, 'holes');


    %% Croping
    [h,w]= size(binaryImage);
    new_w = w- (w/4);
    new_h = h- (h/8);

    for H = 1: h
        for W = 1: w
            if  H >h/6 && W < new_w && H < new_h
                 binaryImage(H,W) = 0;
            end
        end 
    end 

    
    %% get bigest 2 Rectangles
    se = true(9, 9);
    binaryImage = imopen(binaryImage, se);
    binaryImage = bwareafilt(binaryImage, 2); 
    [L , Num] = bwlabel(binaryImage);

   %% filter between the two Rec 
   
   MostRegion = 0;
   for i = 1 : Num 

        TempImage = (L==i);

        TempImage2 = uint8(double(Original) .* double(TempImage));
        TempImage2  = im2bw(TempImage2 , 0.9);
        se = ones(5);
        TempImage2  = imclose(TempImage2  , se);
        TempImage2 = ~ TempImage2 ;
        TempImage = ~ TempImage ;

        TempImage2  = TempImage2  - TempImage ;
        [L2 , Num2 ] = bwlabel(TempImage2);
        NumberOfRegions = Num2 ;
        
        if MostRegion < NumberOfRegions
            MostRegion  = NumberOfRegions ;
            MyBoxIndex = i;
        end
     
   end
    
   %% extract the Legend Box from the original image
    RGBBox = (L==MyBoxIndex);
	RGBBox = uint8(double(Original) .* double(RGBBox));
    %figure , imshow(RGBBox);


end