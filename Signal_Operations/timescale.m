function [y,n] = timescale(x1,st1,sf)
y = x1;
num1 = st1 + length(x1)-1;
n1 = linspace(st1,num1,length(x1));

subplot(2,1,1);
stem(n1,x1);
hold on;
xlim([-5 5]);
ylim([-10 10]);
xlabel('n');
ylabel('Amplitude');
title('Original Signal');
hold off;

n = n1/sf;
subplot(2,1,2);
stem(n,y);
hold on;
xlim([-5 5]);
ylim([-10 10]);
xlabel('n');
ylabel('Amplitude');
title('Time-Scaled Signal')
hold off;
end