function [y,n] = timerev(x1,st1)
y = fliplr(x1);
num1 = st1 + length(x1)-1;
n1 = linspace(st1,num1,length(x1));
n = -fliplr(n1);

subplot(2,1,1);
stem(n1,x1);
hold on;
xlim([min(n)-1 max(n)+1]);
ylim([min(y)-1 max(y)+1]);
xlabel('n');
ylabel('Amplitude');
title('Original Signal');
hold off;

subplot(2,1,2);
stem(n,y);
hold on;
xlim([min(n)-1 max(n)+1]);
ylim([min(y)-1 max(y)+1]);
xlabel('n');
ylabel('Amplitude');
title('Time-Reversed Signal')
hold off;
end