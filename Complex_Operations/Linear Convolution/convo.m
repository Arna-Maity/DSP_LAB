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
  
% Open a new figure.
figure;
subplot(3,1,1);
hold on;
stem(n1,x1);
xlim([min(n1)-1 max(n1)+1]);
ylim([min(x1)-1 max(x1)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
title('x1 sequence');
hold off;

subplot(3,1,2);
hold on;
stem(n2,x2);
xlim([min(n2)-1 max(n2)+1]);
ylim([min(x2)-1 max(x2)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
title('x2 sequence');
hold off;

subplot(3,1,3);
hold on;
stem(n,y);
xlim([min(n)-1 max(n)+1]);
ylim([min(y)-1 max(y)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
title('Convolved sequence');
hold off;

end