% Function to perform convolution without
% the use of conv() function.

function [y,n] = convo(x1,st1,x2,st2)

num1 = st1 + length(x1) - 1;
n1 = linspace(st1,num1,length(x1));

num2 = st2 + length(x2) - 1;
n2 = linspace(st2,num2,length(x2));

len = length(x1) + length(x2) - 1;
conv_num = st1 + st2 + len - 1;
n = linspace(st1 + st2,conv_num,len);

y = [];
mat = zeros(length(x1),length(x2));

for i = 1:length(x1)
    for j = 1:length(x2)
        mat(i,j) = x1(i)*x2(j);
    end
end

y = zeros(1,len);
for i = 2:(len+1)
    sum_mat = 0;
    for j = 1:length(x1)
        for k = 1:length(x2)
            if k+j == i
            sum_mat = sum_mat + mat(j,k);
            end
        end
    end
      y(i-1) = sum_mat;
   end
end