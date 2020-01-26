function [oddx,evenx,n] = oddeven(x1,st1)
num1 = st1 + length(x1)-1;
n = linspace(st1,num1,length(x1));

x_rev = timerev(x1,st1);
x_sum = sigadd(x1,x_rev);
evenx = x_sum/2;

x_rev = -timerev(x1,st1);
x_sum = sigadd(x1,x_rev);
oddx = x_sum/2;

end