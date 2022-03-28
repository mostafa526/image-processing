function [flag , RGBCir] = CheckingType( img )

    I = im2bw(img , 0.9); 
    I = edge(I, 'canny');

 
    se = ones(2); %remove noise
    I  = imdilate(I ,se);
    
 
    
	se = ones(6); %connect edges > circle > Lables
    I = imclose(I ,se);
    
    
 
    flag = 0 ;
    cir = 'NO circle' ;
    
    [L, num] = bwlabel(I);% L [connected comp] , N #of element in L
    

 
    for i = 0 : num
        X = (L==i); %L[i]
        
        X =~X ;
        state = regionprops( X, 'Extent');    
        Cir = state.Extent;
        r = find(Cir > 0.67 && Cir < 0.8 );
        if r>0  

            for j = r 
                I = X ;
                flag = 1 ;
                cir = 'FOUND circle' ; 
            end
        end
    end
    
   	I = ~I ;
    BWCir = imfill(I , 'holes');% large white circle Mask cut in Org image 
	RGBCir = uint8(double(img) .* double(BWCir));

    
    cir 
    return
end