function [xmin,ymin,width] = getmaxrectangle(im, angle, center_x, center_y)

% ԭʼ���ݼ�Ҫ���豣֤ԭͼim�м�����λ��ͼ���м��Ҵ�С����
%��������im��Ե�����У���������Բ��im��Ե�����У���������Բ��ƽ������ת��ͼ���Ե����Ӿ�����ת���im�ڼ���Ӿ����޺�ɫ������

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
  width =  floor(sqrt(2)*(minlen /cos_val)) ; %����ȡ��
  
  center2 = point_trans(im, angle, center_x, center_y); %center��ת���ͼ������
  xmin = center2(1)-width/2;
  ymin = center2(2)-width/2;
  
end