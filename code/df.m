function dx=df(t,x,r1,r2,sigma1,sigma2)
 N1=100;   N2=100;   
 dx = zeros(2,1);
 dx(1) = r1*x(1)*(1-x(1)/N1-sigma1*x(2)/N2);
 dx(2) = r2*x(2)*(1-x(2)/N2-sigma2*x(1)/N1);   
end