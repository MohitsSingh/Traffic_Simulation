function plaza = switch_lanes(plaza)
%换道规则，当车的前面位置被别的车辆占据时，该车考虑换道
%这种车辆在前进规则中状态已经被标记为-2，车辆以prob进行换道
prob = 0.8;
priorityLeft = 0;
[L,W] = size(plaza);
for i = (L-1):-1:1
    if i~=(L+1)/2
        for j = 2:(W-1)
            if plaza(i,j) == -2
                if rand < prob %概率满足，换道
                    if rand > priorityLeft %优先考虑向左换道
                        if j~=2 && plaza(i, j-1) == 0
                            plaza(i, j-1) = 1;
                            plaza(i, j) = 0;
                        elseif plaza(i, j+1) == 0 && j~=W-1
                            plaza(i, j+1) = 1;
                            plaza(i,j) = 0;
                        else%左右都不能换则设置当前元胞状态为1
                                        if plaza(i, j+1) == 0 && j~=W-1
                            plaza(i,j+1) = 1;
                            plaza(i,j) = 0;
                        elseif plaza(i, j-1) == 0 && j~=2
                            plaza(i, j-1) = 1;
                            plaza(i,j) = 0;
                        else
                            plaza(i,j) = 1;
                        end
                    end
                else
                    plaza(i,j) = 1;            plaza(i,j) = 1;
                        end
                    else %优先考虑向右换道

                end
            end
        end
    end
end