function plaza = move_forward(plaza)
%ǰ������
%��Ϊ���δӳ�ǰ������ǰ��ɨ��ÿһ�������ֱ����շ�ͤǰ�棬�շ�ͤ���շ�ͤ����
%�����շ�ͤǰ���շ�ͤ��ĳ�������ó�ǰ��λ�ñ�һ����ռ�ã���ó�����Ϊ-2����ʾ����׼��
%���򣬸ó��Ը���Ϊprobǰ������ǰ���λ��
[L, W] = size(plaza); %get its dimensions
prob = .7;
delay = 3;
%�շ�ͤ���� %%
for i = (L-1):-1:((L + 1)/2 + 1)
% for i = (L-1):-1: 1
    for j = 1:W
        if plaza(i,j) == 1
            if plaza(i+1, j) ~= 0
                plaza(i,j) = -2;
            elseif prob >= rand
                plaza(i,j) = 0;
                plaza(i+1, j) = 1;
            end
        end
    end
 end
%%�շ�ͤ %%
%�����շ�ͤ�ĳ���������plaza��������Ӧλ��Ԫ�ؼ�¼�����շ�ͤ�е�ʱ�䣬
%���������ʱ����ڻ���ڱ�׼����ʱ�䣬���շ�ͤǰ��λ��Ϊ��λʱ��
%��ô�ó����뿪��ǰ�շ�ͤǰ����ǰ���λ��
for i = (L+1)/2
    for j=2
        if plaza(i,j) > 0
            %if plaza(i,j) == delay
            if plaza(i+1,j) == 0
                plaza(i+1,j) = 1;
                plaza(i,j) = 0;
            end
%             if plaza(i,j)>=delay & plaza(i+1,j)==0
%                 plaza(i,j) = 0;
%                 plaza(i+1,j) = 1;
%             else
%                 plaza(i,j) = plaza(i,j) + 1;
%             end
        end
    end
end
% for i = (L+1)/2
%     for j = 1:W
%         if plaza(i,j) > 0
%             %if plaza(i,j) == delay
%             if plaza(i,j)>=delay & plaza(i+1,j)==0
%                 plaza(i,j) = 0;
%                 plaza(i+1,j) = 1;
%             else
%                 plaza(i,j) = plaza(i,j) + 1;
%             end
%         end
%     end
% end
%% δ�����շ�ͤ���� %%
% ���뿪�շ�ͤ��������ԭ����ͬ
for i = (L-1)/2:-1:1
    for j = 1:W
        if plaza(i,j) == 1
            if plaza(i+1, j) ~= 0
                plaza(i,j) = -2;
            elseif prob >= rand
                plaza(i,j) = 0;
                plaza(i+1, j) = 1;
            end
        end
    end
end