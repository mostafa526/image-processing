function [props] = CircleProps(RGBCir)

    %% To Get Normal Pie Chart Props
    %-----------------------------------------------------%
    BWCir = im2bw(RGBCir , 0) ; %get the white circle only
    BWCir=~BWCir ;
    
 
        
    boundary = im2bw(RGBCir , 0.9);%get only white boundary
    boundary =~boundary ;

 
    
    Mask =  boundary- BWCir; %get the only the parts 's Area of the circle
    [labeledImage , Num] = bwlabel(Mask);

    %% If the parts connected
    %-----------------------------------------------------%
    if Num == 1

        grayimg  = rgb2gray(RGBCir);%get edge of the circle
        boundary = edge(grayimg,'Canny');

        SE = ones(8); % to fill the gaps
        boundary = imclose(boundary , SE);

        boundary =~boundary ; %get the only the parts 's Area of the circle
        Mask =  boundary- BWCir;

        SE = ones(3);%Diconnect the area 
        Mask = imerode(Mask , SE); 

        [labeledImage , Num] = bwlabel(Mask); %get the each parts of the circle
 
    end

    %% RETURN Part   
    %-----------------------------------------------------%
	props = regionprops(labeledImage,'Area','Centroid')
   
    %% Function TEST
    %-----------------------------------------------------%
    
 
    return
    

    %% Code for the Matching function
    %-----------------------------------------------------%
    %     Num
    %     for i = 1 :Num
    %         figure , imshow(L == i)
    %         props(i).Area
    %         props(i).Centroid
    %     end

    % 	allAreas = [props.Area];
    % 	totalArea = sum(allAreas);

    %     for i = 1 : Num
    %         
    %         bwPart = bwlabel(L==i);
    %         rgbPart = uint8(double(RGBCir) .* double(bwPart));
    %         %figure , imshow(X)
    %         s = regionprops(bwPart,'Centroid' ,'Area');
    %         Center = s.Centroid;
    %         X = Center (1);
    %         Y = Center (2);
    %         
    %         PartRGB= impixel(RGBCir ,round(X) ,round(Y))
    %         
    %         PartArea = s.Area;
    %         PartPercentage = 100 * PartArea / totalArea
    % 
    %         
    %      end 

        %-----------------------------------------------------%
    
end
        