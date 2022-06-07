%   Author:  Aref YELGHI                                     
%   year:    2013                                                  
%   E-mail:  ar.yelqi (at) gmail (dot) com  

clc; close all; clear all;

% create training set.
cat=5;
num=3;

ginput(1);

for i=1:cat
   for j=1:num
       [x,y,button] = ginput(1);
         pat_1x(j)=x;
         pat_1y(j)=y;
      if i==1
         pat_1=[pat_1x; pat_1y];
         plot(x,y,'*r','MarkerSize',12); 
      end
      if i==2
          pat_2=[pat_1x; pat_1y];
         plot(x,y,'+b','MarkerSize',12); 
      end
      if i==3
          pat_3=[pat_1x; pat_1y];
         plot(x,y,'xg','MarkerSize',12);      
      end
      if i==4
          pat_4=[pat_1x; pat_1y];
         plot(x,y,'ok','MarkerSize',12);%,'MarkerSize',25); 
      end
      if i==5
          pat_5=[pat_1x; pat_1y];
         plot(x,y,'ob','MarkerSize',12);%,'MarkerSize',25); 
      end
         axis([0 1 0 1])
         hold on 
   end
end

title('Two-dimensional 5-class pattern space (Linear Classification)');
xlabel('x');
ylabel('y');

% augmented input vectors
pat_1(3,:)=-1; % adding third column 1 to main data
y1=pat_1;
d1=-1*ones(cat,num);
d1(1,:)=d1(1,:)+2*ones(1,num);

pat_2(3,:)=-1; 
y2=pat_2;
d2=-1*ones(cat,num);
d2(2,:)=d1(2,:)+2*ones(1,num);

pat_3(3,:)=-1; 
y3=pat_3;
d3=-1*ones(cat,num);
d3(3,:)=d1(3,:)+2*ones(1,num);

pat_4(3,:)=-1; 
y4=pat_4;
d4=-1*ones(cat,num);
d4(4,:)=d1(4,:)+2*ones(1,num);

pat_5(3,:)=-1; 
y5=pat_5;
d5=-1*ones(cat,num);
d5(5,:)=d1(5,:)+2*ones(1,num);

y=[y1 y2 y3 y4 y5];
d=[d1 d2 d3 d4 d5];
% RDPTA Implementation
%    
  c=1;
  W=(-1+2*rand(cat,3));
  E=0; 
  p=1;
  k=1;
  W
while k<200
   
   while p <= (cat*num)
       for i=1:cat
           o=sign(W(i,:)*y(:,p));
           W(i,:)=W(i,:)+ (0.5*c*(d(i,p)-o)*y(:,p)');
           E=0.5*((d(i,p)-o).^2)+E;
       end
       
       p=p+1;
   end
   
   Eu(k)=E;
%     % plot line
% if k==1
%      % ax + by + c = 0 ==> y=(-c-ax)/b;
%      x1 = [0,1];   %x = [xmin,xmax]; 
%      if W(1,2)==0
%          W(1,2)=W(1,2)+0.0001;
%      end
%      y1 = (-W(1,3)/W(1,2))-((W(1,1)*x1)/W(1,2));
%      plot(x1,y1,'Color','r')
%      hold on
%      
%      if W(2,2)==0
%          W(2,2)=W(2,2)+0.0001;
%      end
%      y2 = (-W(2,3)/W(2,2))-((W(2,1)*x1)/W(2,2));
%      plot(x1,y2,'Color','b')
%      hold on
%      
%      if W(3,2)==0
%          W(3,2)=W(3,2)+0.0001;
%      end
%      y3 = (-W(3,3)/W(3,2))-((W(3,1)*x1)/W(3,2));
%      plot(x1,y3,'Color','g')
%      hold on
%      
%      if W(4,2)==0
%          W(4,2)=W(4,2)+0.0001;
%      end
%      y4 = (-W(4,3)/W(4,2))-((W(4,1)*x1)/W(4,2));
%      plot(x1,y4,'Color','k')
%      hold on
%     
%     if W(4,2)==0
%          W(4,2)=W(4,2)+0.0001;
%      end
%      y5 = (-W(5,3)/W(5,2))-((W(5,1)*x1)/W(5,2));
%      plot(x1,y5,'Color','y')
%      hold on
%    %   drawnow; pause(0.1)
% end 
   
   if E==0 
     break
   else
       E=0;
       p=1;
   end
 k=k+1;
end
%%

 
 % plot line
     % ax + by + c = 0 ==> y=(-c-ax)/b;
     x1 = [0,1];   %x = [xmin,xmax]; 
     if W(1,2)==0
         W(1,2)=W(1,2)+0.0001;
     end
     y1 = (W(1,3)/W(1,2))-((W(1,1)*x1)/W(1,2));
     plot(x1,y1,'Color','r')
     hold on
     
     if W(2,2)==0
         W(2,2)=W(2,2)+0.0001;
     end
     y2 = (W(2,3)/W(2,2))-((W(2,1)*x1)/W(2,2));
     plot(x1,y2,'Color','b')
     hold on
     
     if W(3,2)==0
         W(3,2)=W(3,2)+0.0001;
     end
     y3 = (W(3,3)/W(3,2))-((W(3,1)*x1)/W(3,2));
     plot(x1,y3,'Color','g')
     hold on
     
     if W(4,2)==0
         W(4,2)=W(4,2)+0.0001;
     end
     y4 = (W(4,3)/W(4,2))-((W(4,1)*x1)/W(4,2));
     plot(x1,y4,'Color','k')
     hold on
    
    if W(5,2)==0
         W(5,2)=W(5,2)+0.0001;
     end
     y5 = (W(5,3)/W(5,2))-((W(5,1)*x1)/W(5,2));
     plot(x1,y5,'Color','y')
     hold on
     
 t=1:length(Eu);
 figure (2)
 plot(t,Eu,'Color','r')
 title('Error Convergence');
 xlabel('iteration number (k)');
 ylabel('Error');
