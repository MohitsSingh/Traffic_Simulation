clear all;
clc;
W = 0;
dengdaishijian=0;
global cheliuliang;
cheliuliang=0;
cheliangmidu=0;

excuseme = zeros (60,60,3);
%每个格子的状态有三种：
% 用表示车辆，0表示空位，-888表示不可进入区域
redTime = 30;
greenTime = 30;
for j = 3
    B = j; %收费站的数量
    L =3; %车道数量
    T = 10; % 更新时间为24毫秒
    global plazalength;%定义全局变量，车道长度
    plazalength =199;
    plaza = create_plaza(B,L);%生成二维数组，表示元胞空间的状态矩阵
    
    plaza((plazalength+1)/2,3:4) = 1;
    %====================================================
    h = show_plaza4(plaza,B,NaN);                        %用图像显示元胞空间
    %====================================================
    num = 7;
    %entry_vector = create_entry(T,L);%生成车辆到来数的向量，entry_vertor(n)表示第n个时间步长达到的车辆数
    entry_vector = create_temp_entry(num,greenTime,redTime);
    waiting_time = 0;%等待时间一开始为0
    output = 0;
    k=1;
    total_wait = zeros((greenTime+redTime)*num,1);
    total_entry = zeros(2*num,1);
    total_traffic_capacity = zeros(2*num,1);
    total_traffic_density = zeros((redTime+greenTime)*num,1);
    cross_point = (plazalength+1)/4-25;
    average_wait = zeros(2*num,1);
    k=1;
    for i = 1:14
        waiting_time = 0;
        output = 0;
        entry = 0;
        traffic_capacity = 0;
        if mod(i,2)~=0
            for xx=1:greenTime
                plaza = move_forward(plaza); %前进规则
                plaza = new_cars(plaza, entry_vector((i-1)*greenTime+xx)); %将上面生成的车辆到来情况加到元胞空间矩阵中
                entry = entry + entry_vector((i-1)*greenTime+xx);
                
                %交叉路口来的车辆
%                 
%                 suiji=[1,51,75,101,151,175];
%                 crosspoint= suiji(randi([1,6],1,1));
                
                  suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
                
    suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
                
                 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数



%                  %交叉路口来的车辆
%                 crosspoint= (plazalength+1)/4+25;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %换道规则
%                 %计算这个时间步长元胞空间的车辆逗留时间
%                 waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
%                 %output = output + compute_output(plaza);%每辆车的平均
%                 
%                 %交叉路口来的车辆
%                 cross_point=(plazalength+1)/4+75;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %换道规则
%                 %计算这个时间步长元胞空间的车辆逗留时间
%                 waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
%                 %output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
%                 
%                 
%                 %交叉路口来的车辆
%                 cross_point=(plazalength+1)/4+125;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %换道规则
%                 %计算这个时间步长元胞空间的车辆逗留时间
%                 waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
%                 %output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
%                 
                
                %===============================================
                h=show_plaza4(plaza,B,h);                     %更新图像
                drawnow
                %===============================================
                plaza = clear_boundary(plaza);%将要离开系统的车辆，需要将车辆从系统中移除，即将元胞空间中最后一行大于0 的设为0
                if plaza((plazalength+1)/2,2) == 1
                    traffic_capacity = traffic_capacity+1;
                end
                total_traffic_density(k) = size(find(plaza((plazalength+1)/4:(plazalength+1)/2-1,:)>0),1);
                total_wait(k) = waiting_time;
                k = k+1;
                pause(0.1);
            end
        else
            for xx=1:redTime
                plaza = move_forward(plaza); %前进规则
              
%                 %交叉路口来的车辆
% %           
                  suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
                
%             
                 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
                
                 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
                
                   suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
               
                
                 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %换道规则
                %计算这个时间步长元胞空间的车辆逗留时间
                waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
                

%                  %交叉路口来的车辆
%                 cross_point= (plazalength+1)/4+25;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %换道规则
%                 %计算这个时间步长元胞空间的车辆逗留时间
%                 waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
%                 %output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
%                 
%                   %交叉路口来的车辆
%                 cross_point= (plazalength+1)/4+75;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %换道规则
%                 %计算这个时间步长元胞空间的车辆逗留时间
%                 waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
%                 %output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
%                  %交叉路口来的车辆
%                 cross_point= (plazalength+1)/4+125;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %换道规则
%                 %计算这个时间步长元胞空间的车辆逗留时间
%                 waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
%                 %output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
%                 
                %===============================================
                h = show_plaza4(plaza,B,h);                     %更新图像
                drawnow
                %===============================================
                plaza = clear_boundary(plaza);%将要离开系统的车辆，需要将车辆从系统中移除，即将元胞空间中最后一行大于0 的设为0
                if plaza((plazalength+1)/2,2) == 1
                    traffic_capacity = traffic_capacity+1;
                end
                total_traffic_density(k) = size(find(plaza((plazalength+1)/4:(plazalength+1)/2-1)>0),1);
                %total_wait(k) = waiting_time;
                k = k+1;
            end
        end
         total_wait(i) = waiting_time;
        average_wait(i) = waiting_time/greenTime;
        total_entry(i) = entry;
        total_traffic_capacity(i) = traffic_capacity;
        
        
    end
    h=show_plaza4(plaza,B,h);
    
%     W(j+1) = waiting_time/output;
%     xlabel({strcat('B = ',num2str(B)), ...
%         strcat('mean cost time = ', num2str(round(W(j+1))))})

    count = 1;
    average_traffic_density = zeros(2*num,1);
    for i=1:num
        average_traffic_density(count) = sum(total_traffic_density((i-1)*(greenTime+redTime)+1:(i-1)*(greenTime+redTime)+greenTime));
        count = count+1;
        average_traffic_density(count) = sum(total_traffic_density((i-1)*(greenTime+redTime)+1+greenTime:(i-1)*(greenTime+redTime)+greenTime+redTime));
        count = count+1;
    end

%     figure(2);
%     plot(total_entry)%车流量
%     title('车流量');
%     figure(3);
%     plot(total_wait)%等待时间
%     title('等待时间');
%     figure(4)
%     plot(total_traffic_capacity);%通行能力
%     title('通行能力');
%     figure(5)
%     plot(average_traffic_density)%车流密度
%     title('车流密度');
%     xlswrite('统计结果', total_entry, '车流量');
%     xlswrite('统计结果', average_wait, '等待时间');
%     xlswrite('统计结果', total_traffic_capacity, '通行能力');
%     xlswrite('统计结果', average_traffic_density, '车流密度');
    cheliangmidu=sum(sum(plaza==1));
    
end
