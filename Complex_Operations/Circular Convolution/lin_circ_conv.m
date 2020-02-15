function [y,n] = lin_circ_conv(x1,st1,x2,st2)

num1 = st1 + length(x1) - 1;
n1 = linspace(st1,num1,length(x1));

num2 = st2 + length(x2) - 1;
n2 = linspace(st2,num2,length(x2));

len = length(x1) + length(x2) - 1;
conv_num = st1 + st2 + len - 1;
n = linspace(st1 + st2,conv_num,len);

y = circ_conv_without_func(x1,x2,length(x2)+length(x2)-2);

% Opens a new figure
figure;
subplot(3,1,1);
stem(n1,x1);
hold on;
title('X1 Sequence');
xlim([min(n1)-1 max(n1)+1]);
ylim([min(x1)-1 max(x1)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;

subplot(3,1,2);
stem(n2,x2);
hold on;
title('X2 Sequence');
xlim([min(n2)-1 max(n2)+1]);
ylim([min(x2)-1 max(x2)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;

subplot(3,1,3);
stem(n,y);
hold on;
title('Linear Convolution');
xlim([min(n)-1 max(n)+1]);
ylim([min(y)-1 max(y)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;
end