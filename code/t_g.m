clc;clear
load('rate.mat');
load('sig.mat');
k = 1;
for i = 1:3
    for j = i+1:4
sigma1=sig(i,1);  sigma2=sig(j,1);  
r1=rate(i,1); r2=rate(j,1);
[t,x]=ode45(@(t,x) df(t,x,r1,r2,sigma1,sigma2),[0 56],[13 14]);
plot(t,x(:,1),'r-',t,x(:,2),'b-','LineWidth',1)  % x的第一列是甲种群数量，x的第二列是乙种群数量
legend({'s1','s2'},'Location','southwest')
legend('boxoff')
f1 = x(end,1); f2 = x(end,2);
res(k,:) = [f1/(f1+f2),f2/(f1+f2)];
res1 = res(k,1); res2 = res(k,2);
if 0.33 <= res1 && res1 <= 0.67
    fres(k,:)= [1];
else
    fres(k,:)=[0];
end;
k=k+1;
    end;
end;