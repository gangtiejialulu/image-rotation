function [xmin,ymin,width] = getmaxrectangle(im, angle, center_x, center_y)

% 原始数据集要求：需保证原图im中检测框尽量位于图像中间且大小适中
%（检测框与im边缘不相切，检测框的外接圆与im边缘不相切，检测框的外接圆的平行于旋转后图像边缘的外接矩在旋转后的im内即外接矩内无黑色背景）

  h = size(im,1);
  w = size(im,2);
  len1 = abs(center_x); %left
  len2 = abs(center_y); %top
  len3 = abs(w - center_x); %right
  len4 = abs(h - center_y); %bottom
  len = [len1,len2,len3,len4];
  minlen = min(len);
  angle2 = mod(angle,90);  
  radian = abs(pi/4-angle2/180*pi);  
  cos_val = cos(radian);   
  width =  floor(sqrt(2)*(minlen /cos_val)) ; %向下取整
  
  center2 = point_trans(im, angle, center_x, center_y); %center旋转后的图像坐标
  xmin = center2(1)-width/2;
  ymin = center2(2)-width/2;
  
end