function plaza = new_cars(plaza, entry)
%��create_entry ���������ɵĳ�����������ӵ�Ԫ���ռ������
% if entry > 0 
%     
%     unoccupied = find( plaza(1,:) == 0 );% �鿴һ�³�����һ��������������ӳ�
%     n = length(unoccupied); % ���Լӳ��ĳ�����
%     x = randperm(n);%�����Լӳ��ĳ�����Ŵ���
%     temp = min(entry,n);
%     for i = 1:temp%ȡ���Լӵĳ������������ĳ������ߵ���Сֵ
%         plaza(1,unoccupied(x(i))) = 1;
%     end
% end
if entry > 0 
    
    unoccupied = find( plaza(1,:) == 0 );% �鿴һ�³�����һ��������������ӳ�
    n = length(unoccupied); % ���Լӳ��ĳ�����
    x = randperm(n);%�����Լӳ��ĳ�����Ŵ���
    temp = min(entry,n);
    for i = 1:temp%ȡ���Լӵĳ������������ĳ������ߵ���Сֵ
        r = rand();
        if r<0.21
            if unoccupied(i) == 2
                plaza(1,unoccupied(i)) = 1;
            end
        elseif r<0.65
            if unoccupied(i) == 3
                plaza(1,unoccupied(i)) = 1;
            end
        else
            if unoccupied(i) == 4
                plaza(1,unoccupied(i)) = 1;
            end
        end
    end
end
%% 21 44 45