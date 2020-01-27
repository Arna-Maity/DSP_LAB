function [y,n] = convo_using_function(x1,st1,x2,st2)
num1 = st1 + st2 + length(x1)+length(x2)-2;
n = linspace(st1+st2,num1,length(x1)+length(x2)-1);
y = conv(x1,x2);
end