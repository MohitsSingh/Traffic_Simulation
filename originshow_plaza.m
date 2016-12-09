function h = originshow_plaza(plaza, B, h)
%��ͼ����ʾԪ���ռ�
[L, W] = size(plaza); %��ȡ�������ȣ�������
temp = plaza;
temp(temp==1) = 0;%һ��ʼ�Ȱѳ����еĳ����

PLAZA(:,:,1) = plaza;
PLAZA(:,:,2) = plaza;
PLAZA(:,:,3) = temp;

PLAZA = 1-PLAZA;
PLAZA(PLAZA>=888)=0.3;

global cheliuliang;
cheliuliang=(sum(plaza(30,2:4)==1)+sum(plaza(80,2:4)==1)+sum(plaza(130,2:4)==1)+sum(plaza(180,2:4)==1))/4+cheliuliang;


for i = (L+1)/2
    for j = ceil(W/2)-ceil(B/2)+2:ceil(W/2)+floor(B/2)
        if plaza(i,j) == 0;
            PLAZA(i,j,1) =0;
            PLAZA(i,j,2) =1;
            PLAZA(i,j,3) =0;
        else
            PLAZA(i,j,1) =1;
            PLAZA(i,j,2) =0;
            PLAZA(i,j,3) =0;
        end
    end
end


excuse=ones(60,60,3); 
excuse(6:55,1:5,1:3)=rot90(rot90(PLAZA(101:150,1:5,1:3)));
excuse(56:60,6:55,1:3)=rot90(rot90(rot90(PLAZA(51:100,1:5,1:3))));
excuse(6:55,56:60,1:3)=PLAZA(1:50,1:5,1:3);
excuse(1:5,6:55,1:3)=rot90(PLAZA(150:199,1:5,1:3));


if ishandle(h)
    set(h,'CData',excuse)
else
    figure('position',[100,100,500,500])
    h = imagesc(excuse);    
    hold on
%     plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')%������
%     plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')%������
    axis image
    set(gca,'xtick',[]);%ȥ������x��ı�ǩ
    set(gca,'ytick',[]);%ȥ�����y��ı�ǩ
end