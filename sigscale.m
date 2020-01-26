function [y,n] = sigscale(x1,st1,sf)

num1 = st1 + length(x1)-1;
n = linspace(st1,num1,length(x1));
y = x1 * sf;

subplot(2,1,1);
stem(n,y);
hold on;
xlim([min(n)-1 max(n)+1]);
ylim([min(x1)-1 max(x1)+1]);
ylabel('Amplitude');
xlabel('n -->');
title('Original Signal');
hold off;

subplot(2,1,2);
stem(n,y);
hold on;
xlim([min(n)-1 max(n)+1]);
ylim([min(y)-1 max(y)+1]);
ylabel('Amplitude');
xlabel('n -->');
title('Scaled Signal');
hold off;

end