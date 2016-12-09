function plaza = move_forward(plaza)
%前进规则
%分为三段从车前进方向前后扫描每一辆车，分别是收费亭前面，收费亭和收费亭后面
%对于收费亭前或收费亭后的车，如果该车前面位置被一辆车占用，则该车陂标记为-2，表示换道准备
%否则，该车以概率为prob前进到它前面的位置
[L, W] = size(plaza); %get its dimensions
prob = .7;
delay = 3;
%收费亭过后 %%
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
%%收费亭 %%
%对于收费亭的车，我们用plaza矩阵中相应位置元素记录其在收费亭中的时间，
%当这个服务时间等于或大于标准服务时间，且收费亭前面位置为空位时，
%那么该车就离开当前收费亭前进到前面的位置
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
%% 未进入收费亭区域 %%
% 与离开收费亭后的区域的原理相同
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