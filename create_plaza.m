function plaza = create_plaza(B, L)
%���ɶ�ά���飬��ʾԪ���ռ��״̬����
global plazalength;%��·����
plazalength = 199;


topgap = 5;%�����շ�վ���ϱ߾�
bottomgap = 1;%�뿪�շ�վ���±߾�
plaza = zeros(plazalength,B+2);%����Ŀ��Ϊ��·�Ŀ��+2

plaza(1:plazalength,[1,2+B]) = -888;%һ��ʼʱ����һ�к����һ����Ϊ���ɽ���

%%
%  plaza((plazalength+1)/4-25,1) = 0;
%   plaza((plazalength+1)/4+25,1) = 0;
%    plaza((plazalength+1)/4+75,1) = 0;
%   plaza((plazalength+1)/4+125,1) = 0;
% plaza(75,1)=0;
% plaza(175,1)=0;
% plaza(25,1)=0;
% plaza(125,1)=0;

%%


%�����Ƿ�����������ǣ�B-LΪ��������ż�����ǣ�Ȼ���ٴ��������еĲ��ɽ�������
if mod(B-L,2)==0 %ż�����
    for col = 2:B/2 - L/2 + 1
        for row = 1:(plazalength-1)/2 - topgap * (col-1)
            plaza(row,[col, B+3-col]) = -888;
        end
        for row = (plazalength+3)/2 + bottomgap*(col-1):plazalength
            plaza(row,[col, B+3-col]) = -888;
        end
    end
else
    plaza(1:plazalength, B+3) = -888;
    for col = 2:(B+1)/2 - L/2 + 1
        for row = 1:(plazalength-1)/2 - topgap * (col-1)
            plaza(row, [col, B+4-col]) = -888;
        end
        for row = (plazalength+3)/2 + bottomgap*(col-1):plazalength
            plaza(row, [col, B+4-col]) = -888;
        end
    end
end