#Traffic Simulation of Neighborhood based on Cellular Automaton
##背景
                这是2016CUMCM我的部分代码，用于模拟长方形小区与周围道路的交通流
##原理
                使用matlab编写，基于元胞自动机的演化规则进行的模拟。
                origincellular.m 用于模拟封闭小区
                cellular2.m 用于模拟开放两个出入口的小区
                cellular4.m 用于模拟开放四个出入口的小区
                
                其余几个m文件都封装函数
                creat_plaza.m 封装了地图初始化
                creat_entry.m 封装了出入口的初始化
                switch_lanes.m 封装了换道规则
                move_forward.m 封装了前进规则
                new_cars.m 封装了新车辆产生规则
                show_plaza.m 封装了更新地图函数
##最终效果
###仿真过程及统计结果截图
![image](/src/1.jpg)
![image](/src/11.jpg)
![image](/src/show.jpg)
![image](/src/show.jpg)




        
                
