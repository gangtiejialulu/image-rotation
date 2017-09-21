%��תͼ�񲢼��г���������Ŀ�������������Ҫ���޺ڵ�%

close all;
clc;
clear;

lines = load('input/zhuanpan0001.txt');
%[row,col]=size(lines);
row = size(lines,1);
%col = size(lines,2);

boxes = zeros(row, 4);
boxes_large = zeros(row, 4); %��i�в�Ϊ�գ���ʾ���к������i��������������ǰ���ֵthreshold���е�������
box_large= [];

imagepath = 'input/zhuanpan0001.jpg';
im = imread(imagepath);
%[h,w,c] = size(im);
h = size(im,1);
w = size(im,2);

threshold = 3;

angle = 0;
add_angle = 10;
n = 360/add_angle-1;

for j=0:n
    angle = j*add_angle;
    B = imrotate(im,angle,'nearest','loose');  %��תim
    for i=1:row
        %��ȡ��i������boxes(i,:)
        boxes(i,1) = lines(i,1);                 %XMIN
        boxes(i,2) = lines(i,2);                 %YMIN
        boxes(i,3) = lines(i,3) - lines(i,1);    %WIDTH
        boxes(i,4) = lines(i,4) - lines(i,2);    %HEIGHT

        %boxes(i,:)�����Բ
        center = [boxes(i,1)+boxes(i,3)/2, boxes(i,2)+boxes(i,4)/2]; %Բ��
        r = sqrt((boxes(i,3)/2)^2+(boxes(i,4)/2)^2);                 %�뾶
        %im(ceil(center(2)),ceil(center(1)),:) = 255;

        center_rotate= point_trans(im, angle, center(1), center(2)); %center��ת���ͼ������
        %B(center2(2):center2(2)+10,center2(1):center2(1)+10,:) = 255;

        [xmin,ymin,width_max] = getmaxrectangle(im, angle, center(1), center(2)); %im��ת��İ���boxes(i,:)���Բ������޺ڵ�������

        if( 2*r*threshold < width_max)  
            %����ֵthreshold����
            boxes_large(i,:) = extrectangle_large(B,r,center_rotate(1),center_rotate(2),threshold);  %�Ŵ����Բ����Ӿ�threshold��
            box_large = imcrop(B,[boxes_large(i,1),boxes_large(i,2),boxes_large(i,3),boxes_large(i,4)]); 
        else
            box_large = imcrop(B,[xmin, ymin, width_max, width_max]); 
        end

        imwrite(box_large,['rotationcut/zhuanpan0001-',num2str(i),'-',num2str(angle),'.jpg']);    
    
    end
    
end








%img_rotate = my_img_rotate_chazhi(im,angle)  

% subplot(1,3,1);
% imshow( im );
% title( 'Original Image' );
% 
% subplot(1,3,2);
% imshow( B );
% title( 'B');
% 
% subplot(1,3,3);
% imshow( box_large );
% title( 'box_large');

