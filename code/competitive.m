clc;clear
load('ini.mat');
load('g_rate.mat');
load('sig.mat');
load('decay.mat');
for i = 1:540
ini1 = ini(i,1); ini2 = ini(i,2);
r1=g_rate(i,1); r2=g_rate(i,2);
sigma1=sig(i,1);  sigma2=sig(i,2);  
[t,x]=ode45(@(t,x) df(t,x,r1,r2,sigma1,sigma2),[0 54],[ini1 ini2]);
plot(t,x(:,1),'r-',t,x(:,2),'b-','LineWidth',1) 
legend({'s1','s2'},'Location','southwest')
legend('boxoff')
f1 = x(end,1); f2 = x(end,2);
res(i,:) = [f1/(f1+f2),f2/(f1+f2)];
res1 = res(i,1); res2 = res(i,2);
d1=decay(i,1); d2=decay(i,2);
if res1> 0.67
    fres(i,:)= [d1,f1,f2];
elseif res2 > 0.67
    fres(i,:)=[d2,f1,f2];
else
    d = d1*res1+d2*res2;
    fres(i,:)=[d,f1,f2];
end;
end;