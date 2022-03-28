function   bar_matching( rect_prop,num_rect,text_prop,num_text,coloum_props, valueofmaxcol , maxhigh,pic  )
if num_rect==num_text
    
   for i=1:num_text
     min_distance_rect_bar=1000000;%%%dictance of ecludin between cicle and rect%%
     min_distance_rect_text=1000000;
     index_rect=0;
     index_text=0;



    x1= coloum_props(i).Centroid(1);
    y1= coloum_props(i).Centroid(2);
    x1=uint64(x1);
    y1=uint64(y1);
    r1 = pic(y1,x1,1);
    g1 = pic(y1,x1,2);
    b1= pic(y1,x1,3);
    
    r1=double(r1);
    g1=double(g1);
    b1=double(b1);


   





     for e=1:num_rect
         x2= rect_prop(e).Centroid(1);
         y2= rect_prop(e).Centroid(2);
         x2=uint64(x2);
         y2=uint64(y2);
          r2 = pic(y2,x2,1);
          g2 = pic(y2,x2,2);
          b2=  pic(y2,x2,3);
          
          r2=double(r2);
          g2=double(g2);
          b2=double(b2);
          distance1 = sqrt( (r1-r2).^2 + (g1-g2).^2+(b1-b2).^2 );

         if (distance1<min_distance_rect_bar)
        
            min_distance_rect_bar=distance1;
            index_rect=e;
         end
       
     end 
    for z=1:num_text

          x1= rect_prop(index_rect).Centroid(1);
          y1= rect_prop(index_rect).Centroid(2);
          
          
          x1=double(x1);
          y1=double(y1);
          x2= text_prop(z).BoundingBox(1);
          y2= text_prop(z).BoundingBox(2);
          h2= text_prop(z).BoundingBox(4);
          x2=double(x2);
          y2=double(y2);
          h2=double(h2);
          
          y2=y2+(h2/2);

          
          distance2 = sqrt( (x1-x2).^2 + (y1-y2).^2 );
          
            

        if (distance2<=min_distance_rect_text)
           
            
   
        
        min_distance_rect_text=distance2;
        index_text=z;
        
        end
    end
    
    
    
     x=text_prop(index_text).BoundingBox(1);
     y=text_prop(index_text).BoundingBox(2);
     w=text_prop(index_text).BoundingBox(3);
     h=text_prop(index_text).BoundingBox(4);
     
     highcoloum=coloum_props(i).BoundingBox(4);
     highcoloum
     
     high=double((highcoloum*valueofmaxcol)/maxhigh);
     high;
   
    crop=imcrop(pic,[x y w h]);
  	subplot(round(num_text/2 ),2,i),imshow(crop)
	title(['hight : ',num2str(round(high))])
    
    
    

     
  end    
   
     
    
    
    
    
    
    
    
elseif num_rect>num_text
    for i=1:num_text
     min_distance_rect_bar=1000000;%%%dictance of ecludin between cicle and rect%%
     min_distance_rect_text=1000000;
     index_rect=0;
     index_text=0;



    x1= coloum_props(i).Centroid(1);
    y1= coloum_props(i).Centroid(2);
    x1=uint64(x1);
    y1=uint64(y1);
    r1 = pic(y1,x1,1);
    g1 = pic(y1,x1,2);
    b1= pic(y1,x1,3);
    
    r1=double(r1);
    g1=double(g1);
    b1=double(b1);


   





     for e=1:num_rect
          w= rect_prop(e).BoundingBox(4);
          if w>100
              continue
          end    
         
         
         x2= rect_prop(e).Centroid(1);
         y2= rect_prop(e).Centroid(2);
         
         x2=uint64(x2);
         y2=uint64(y2);
          r2 = pic(y2,x2,1);
          g2 = pic(y2,x2,2);
          b2=  pic(y2,x2,3);
          
          r2=double(r2);
          g2=double(g2);
          b2=double(b2);
          distance1 = sqrt( (r1-r2).^2 + (g1-g2).^2+(b1-b2).^2 );

         if (distance1<min_distance_rect_bar)
        
            min_distance_rect_bar=distance1;
            index_rect=e;
         end
       
     end 
    for z=1:num_text

          x1= rect_prop(index_rect).Centroid(1);
          y1= rect_prop(index_rect).Centroid(2);
          
          
          x1=double(x1);
          y1=double(y1);
          x2= text_prop(z).BoundingBox(1);
          y2= text_prop(z).BoundingBox(2);
          h2= text_prop(z).BoundingBox(4);
          x2=double(x2);
          y2=double(y2);
          h2=double(h2);
          
          y2=y2+(h2/2);

          
          distance2 = sqrt( (x1-x2).^2 + (y1-y2).^2 );
          
            

        if (distance2<=min_distance_rect_text)
           
            
   
        
        min_distance_rect_text=distance2;
        index_text=z;
        
        end
    end
    
    
    
     x=text_prop(index_text).BoundingBox(1);
     y=text_prop(index_text).BoundingBox(2);
     w=text_prop(index_text).BoundingBox(3);
     h=text_prop(index_text).BoundingBox(4);
     
     highcoloum=coloum_props(i).BoundingBox(4);
     highcoloum
     
     high=double(highcoloum*valueofmaxcol)/maxhigh;
     high
     
   
    crop=imcrop(pic,[x y w h]);
	subplot(round(num_text/2 ),2,i),imshow(crop)
	title(['hight : ',num2str(round(high)) ])
    
    

     
   end    
    
    
    
else
    check_text=[];
    check_coulm=[];
     for i=1:num_rect
     min_distance_rect_bar=1000000;%%%dictance of ecludin between cicle and rect%%
     min_distance_rect_text=1000000;
     index_coulm=0;
     index_text=0;



    x1= rect_prop(i).Centroid(1);
    y1= rect_prop(i).Centroid(2);
    x1=uint64(x1);
    y1=uint64(y1);
    r1 = pic(y1,x1,1);
    g1 = pic(y1,x1,2);
    b1= pic(y1,x1,3);
    
    r1=double(r1);
    g1=double(g1);
    b1=double(b1);



   





     for e=1:num_text
          
         
         
         x2= coloum_props(e).Centroid(1);
         y2= coloum_props(e).Centroid(2);
         
         x2=uint64(x2);
         y2=uint64(y2);
          r2 = pic(y2,x2,1);
          g2 = pic(y2,x2,2);
          b2=  pic(y2,x2,3);
          
          r2=double(r2);
          g2=double(g2);
          b2=double(b2);
          distance1 = sqrt( (r1-r2).^2 + (g1-g2).^2+(b1-b2).^2 );

         if (distance1<min_distance_rect_bar)
        
            min_distance_rect_bar=distance1;
              index_coulm=e;

         end
       
     end 
    for z=1:num_text

          x1= rect_prop(i).Centroid(1);
          y1= rect_prop(i).Centroid(2);
          
          
          x1=double(x1);
          y1=double(y1);
          x2= text_prop(z).BoundingBox(1);
          y2= text_prop(z).BoundingBox(2);
          h2= text_prop(z).BoundingBox(4);
          x2=double(x2);
          y2=double(y2);
          h2=double(h2);
          
          y2=y2+(h2/2);

          
          distance2 = sqrt( (x1-x2).^2 + (y1-y2).^2 );
          
            

        if (distance2<=min_distance_rect_text)
           
            
   
        
        min_distance_rect_text=distance2;
        index_text=z;
        
        end
    end
    
    
    
     x=text_prop(index_text).BoundingBox(1);
     y=text_prop(index_text).BoundingBox(2);
     w=text_prop(index_text).BoundingBox(3);
     h=text_prop(index_text).BoundingBox(4);
     check_text=[check_text,index_text];
     check_coulm=[check_coulm,index_coulm];
     
     highcoloum=coloum_props(i).BoundingBox(4);
%      highcoloum
%      maxhigh
%      valueofmaxcol
     high=double(highcoloum*valueofmaxcol)/maxhigh;
     high
   
    crop=imcrop(pic,[x y w h]);
	subplot(round(num_rect/2 ),2,i),imshow(crop)
	title(['hight : ',num2str(round(high)) ])
    
    
    

     
     end
     
     
     colum_ind=0;
     text_ind=0;
    for i=1:num_text
        s=0;
        for j=1:length(check_text)
            if i~=check_text(j)
                text_ind=i;
                s=1;
                
            else
              text_ind=0;
              s=0;
              break;
            end    
        end
        if s==1
            break;
        end    
    end 
    
    for i=1:num_text
                s=0;

        for j=1:length(check_coulm)
            if i~=check_coulm(j)
              colum_ind=i;
                s=1;

            else
              colum_ind=0;
              s=0;
              break;
            end    
        end
        if s==1
            break;
        end    
    end
     highcoloum=coloum_props(colum_ind).BoundingBox(4);

     
     high=double(highcoloum*valueofmaxcol)/maxhigh;
     high
    
     x=text_prop(text_ind).BoundingBox(1);
     y=text_prop(text_ind).BoundingBox(2);
     w=text_prop(text_ind).BoundingBox(3);
     h=text_prop(text_ind).BoundingBox(4);
     crop=imcrop(pic,[x y w h]);
	subplot(round(num_text/2 ),2,i),imshow(crop)
	title(['hight : ',num2str(round(high)) ])
    
    
end
end


