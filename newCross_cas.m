function [update_plaza,flag] = newCross_cas(plaza,cross_point)

update_plaza = plaza;
r = rand();
flag = 0;
if r<0.25
    if plaza(cross_point,2) == 0
        flag = 1;
        update_plaza(cross_point,2) = 1;
    end
end
