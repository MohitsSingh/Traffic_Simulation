%Floyd算法
%解决最短路径问题，是用来调用的函数头文件
%[D,path]=floyd(a)
%输入参数a是求图的带权邻接矩阵，D(i,j)表示i到j的最短距离,path(i,j)i,j之间最短路径上顶点i的后继点
%[D,path,min1,path1]=floyd(a,i,j)
%输入参数a是所求图的带权邻接矩阵，i,j起点终点,min1表示i与j最短距离，path1为最短路径
function [D,path,min1,path1]=floyd(a,start,terminal)
D=a;n=size(D,1);path=zeros(n,n);
for i=1:n
   for j=1:n
      if D(i,j)~=inf
         path(i,j)=j;
      end
   end
end
for k=1:n
   for i=1:n
      for j=1:n
         if D(i,k)+D(k,j)<D(i,j)
            D(i,j)=D(i,k)+D(k,j);
            path(i,j)=path(i,k);
         end
      end
   end
end
if nargin==3
   min1=D(start,terminal);
   m(1)=start;
   i=1;
   path1=[ ];   
   while   path(m(i),terminal)~=terminal
      k=i+1;                                
      m(k)=path(m(i),terminal);
      i=i+1;
   end
   m(i+1)=terminal;
   path1=m;
end