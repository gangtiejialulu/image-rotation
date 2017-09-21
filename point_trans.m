function center2 = point_trans(im, angle, center_x, center_y)

    h = size(im,1);  
    w = size(im,2);  
    radian=2*pi-angle/180*pi;  
    cos_val = cos(radian);  
    sin_val = sin(radian);  

    w2=ceil(abs(cos_val)*w+h*abs(sin_val));  
    h2=ceil(abs(cos_val)*h+w*abs(sin_val));  
    
    T = [cos_val, sin_val, -0.5*w2*cos_val-0.5*h2*sin_val+0.5*w;
         -sin_val, cos_val, 0.5*w2*sin_val-0.5*h2*cos_val+0.5*h;
         0,0,1];
    T_inv = T^-1;
    P0 =[center_x;
         center_y;
         1];
     
    P = T_inv * P0;
%     x1 = int32( P(1));
%     y1 = uint32( P(2));
    
    x1 = P(1);
    y1 = P(2);
    center2 = [x1, y1];
   
end