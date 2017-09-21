function box_large = extrectangle_large(B, r, center_rotate_x, center_rotate_y, threshold)

    h = size(B,1);
    w = size(B,2);
    
    box_large = zeros(1, 4);
    
%     %boxes(i,:)�����Բ����Ӿ�
%     XMIN_ext  = center_rotate_x-r;
%     YMIN_ext  = center_rotate_y-r;
%     WIDTH_ext  = 2*r;
%     HEIGHT_ext  = 2*r;

    %�Ŵ�Ϊ������Ӿص�threshold���ľ���
    XMIN = center_rotate_x - threshold*r;
    YMIN = center_rotate_y - threshold*r;
    WIDTH = 2*r*threshold;
    HEIGHT = 2*r*threshold;

    if(XMIN < 0) 
        WIDTH = XMIN + WIDTH;
    else 
        box_large(1) = XMIN;
    end
    if(YMIN < 0) 
        HEIGHT = YMIN + HEIGHT;
    else
        box_large(2) = YMIN; 
    end
    if(box_large(1) + WIDTH > w) 
        box_large(3) = w - box_large(1); 
    else
        box_large(3) = WIDTH;
    end
    if(box_large(2) + HEIGHT > h) 
        box_large(4) = h - box_large(2); 
    else
        box_large(4) = HEIGHT;
    end
    
%     %�������þ��ε��ڲ����������
%     if(WIDTH < HEIGHT)
%         box_large(4) = WIDTH;
%     elseif (WIDTH > HEIGHT)
%         box_large(3) = HEIGHT;
%     end
    
end
