clear all;
clc;
W = 0;
dengdaishijian=0;
global cheliuliang;
cheliuliang=0;
cheliangmidu=0;

excuseme = zeros (60,60,3);
%ÿ�����ӵ�״̬�����֣�
% �ñ�ʾ������0��ʾ��λ��-888��ʾ���ɽ�������
redTime = 30;
greenTime = 30;
for j = 3
    B = j; %�շ�վ������
    L =3; %��������
    T = 10; % ����ʱ��Ϊ24����
    global plazalength;%����ȫ�ֱ�������������
    plazalength =199;
    plaza = create_plaza(B,L);%���ɶ�ά���飬��ʾԪ���ռ��״̬����
    
    plaza((plazalength+1)/2,3:4) = 1;
    %====================================================
    h = show_plaza4(plaza,B,NaN);                        %��ͼ����ʾԪ���ռ�
    %====================================================
    num = 7;
    %entry_vector = create_entry(T,L);%���ɳ�����������������entry_vertor(n)��ʾ��n��ʱ�䲽���ﵽ�ĳ�����
    entry_vector = create_temp_entry(num,greenTime,redTime);
    waiting_time = 0;%�ȴ�ʱ��һ��ʼΪ0
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
                plaza = move_forward(plaza); %ǰ������
                plaza = new_cars(plaza, entry_vector((i-1)*greenTime+xx)); %���������ɵĳ�����������ӵ�Ԫ���ռ������
                entry = entry + entry_vector((i-1)*greenTime+xx);
                
                %����·�����ĳ���
%                 
%                 suiji=[1,51,75,101,151,175];
%                 crosspoint= suiji(randi([1,6],1,1));
                
                  suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
                
    suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
                
                 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����



%                  %����·�����ĳ���
%                 crosspoint= (plazalength+1)/4+25;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %��������
%                 %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
%                 waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
%                 %output = output + compute_output(plaza);%ÿ������ƽ��
%                 
%                 %����·�����ĳ���
%                 cross_point=(plazalength+1)/4+75;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %��������
%                 %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
%                 waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
%                 %output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
%                 
%                 
%                 %����·�����ĳ���
%                 cross_point=(plazalength+1)/4+125;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %��������
%                 %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
%                 waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
%                 %output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
%                 
                
                %===============================================
                h=show_plaza4(plaza,B,h);                     %����ͼ��
                drawnow
                %===============================================
                plaza = clear_boundary(plaza);%��Ҫ�뿪ϵͳ�ĳ�������Ҫ��������ϵͳ���Ƴ�������Ԫ���ռ������һ�д���0 ����Ϊ0
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
                plaza = move_forward(plaza); %ǰ������
              
%                 %����·�����ĳ���
% %           
                  suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
                
%             
                 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
                
                 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
                
                   suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
               
                
                 suiji=[1,25,51,75,101,125,151,175];
                crosspoint= suiji(randi([1,8],1,1));
                [plaza,flag] = newCross_cas(plaza,crosspoint);
                entry = entry + flag;
                plaza = switch_lanes(plaza); %��������
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
                

%                  %����·�����ĳ���
%                 cross_point= (plazalength+1)/4+25;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %��������
%                 %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
%                 waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
%                 %output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
%                 
%                   %����·�����ĳ���
%                 cross_point= (plazalength+1)/4+75;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %��������
%                 %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
%                 waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
%                 %output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
%                  %����·�����ĳ���
%                 cross_point= (plazalength+1)/4+125;
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
%                 entry = entry + flag;
%                 plaza = switch_lanes(plaza); %��������
%                 %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
%                 waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
%                 %output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
%                 
                %===============================================
                h = show_plaza4(plaza,B,h);                     %����ͼ��
                drawnow
                %===============================================
                plaza = clear_boundary(plaza);%��Ҫ�뿪ϵͳ�ĳ�������Ҫ��������ϵͳ���Ƴ�������Ԫ���ռ������һ�д���0 ����Ϊ0
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
%     plot(total_entry)%������
%     title('������');
%     figure(3);
%     plot(total_wait)%�ȴ�ʱ��
%     title('�ȴ�ʱ��');
%     figure(4)
%     plot(total_traffic_capacity);%ͨ������
%     title('ͨ������');
%     figure(5)
%     plot(average_traffic_density)%�����ܶ�
%     title('�����ܶ�');
%     xlswrite('ͳ�ƽ��', total_entry, '������');
%     xlswrite('ͳ�ƽ��', average_wait, '�ȴ�ʱ��');
%     xlswrite('ͳ�ƽ��', total_traffic_capacity, 'ͨ������');
%     xlswrite('ͳ�ƽ��', average_traffic_density, '�����ܶ�');
    cheliangmidu=sum(sum(plaza==1));
    
end
