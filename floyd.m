%Floyd�㷨
%������·�����⣬���������õĺ���ͷ�ļ�
%[D,path]=floyd(a)
%�������a����ͼ�Ĵ�Ȩ�ڽӾ���D(i,j)��ʾi��j����̾���,path(i,j)i,j֮�����·���϶���i�ĺ�̵�
%[D,path,min1,path1]=floyd(a,i,j)
%�������a������ͼ�Ĵ�Ȩ�ڽӾ���i,j����յ�,min1��ʾi��j��̾��룬path1Ϊ���·��
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