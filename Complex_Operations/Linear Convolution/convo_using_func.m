function [y,n] = convo_using_function(x1,st1,x2,st2)
num1 = st1 + st2 + length(x1)+length(x2)-2;
n = linspace(st1+st2,num1,length(x1)+length(x2)-1);

num2 = st1 + length(x1) - 1;
n1 = linspace(st1,num2,length(x1));

num3 = st2 + length(x2) - 1;
n2 = linspace(st2,num3,length(x2));
y = conv(x1,x2);

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
title('Convolved sequence (Using Function)');
hold off;
end