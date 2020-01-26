function [y,n] = timeshift(x1,st1,sfu)
num1 = st1 + length(x1)-1;
n1 = linspace(st1,num1,length(x1));
n = n1 - linspace(sfu,sfu,length(x1));
y = x1;

subplot(2,1,1);
stem(n1,x1);
hold on;
xlim([min(n1)-1 max(n1)+1]);
ylim([min(x1)-1 max(x1)+1]);
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
title('Time-Shifted Signal')
hold off;

end