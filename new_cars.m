function plaza = new_cars(plaza, entry)
%将create_entry 函数中生成的车辆到来情况加到元胞空间矩阵中
% if entry > 0 
%     
%     unoccupied = find( plaza(1,:) == 0 );% 查看一下车道第一行哪条车道允许加车
%     n = length(unoccupied); % 可以加车的车道数
%     x = randperm(n);%将可以加车的车道编号打乱
%     temp = min(entry,n);
%     for i = 1:temp%取可以加的车道数和新来的车数两者的最小值
%         plaza(1,unoccupied(x(i))) = 1;
%     end
% end
if entry > 0 
    
    unoccupied = find( plaza(1,:) == 0 );% 查看一下车道第一行哪条车道允许加车
    n = length(unoccupied); % 可以加车的车道数
    x = randperm(n);%将可以加车的车道编号打乱
    temp = min(entry,n);
    for i = 1:temp%取可以加的车道数和新来的车数两者的最小值
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