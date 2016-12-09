function plaza = create_plaza(B, L)
%生成二维数组，表示元胞空间的状态矩阵
global plazalength;%道路长度
plazalength = 199;


topgap = 5;%进入收费站的上边距
bottomgap = 1;%离开收费站的下边距
plaza = zeros(plazalength,B+2);%数组的宽度为道路的宽度+2

plaza(1:plazalength,[1,2+B]) = -888;%一开始时，第一列和最后一列设为不可进入

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


%下面是分两种情况考虑，B-L为奇数或者偶数考虑，然后再从设置其中的不可进入区域
if mod(B-L,2)==0 %偶数情况
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