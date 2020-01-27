function [y,n] = sigmult(x1,st1,x2,st2)

num1 = st1 + length(x1)-1;
n1 = linspace(st1,num1,length(x1))
subplot(3,1,1);
stem(n1,x1);
hold on;
xlim([min(n1)-1 max(n1)+1]);
ylim([min(x1)-1 max(x1)+1]);
title('Signal 1 (X1)');
ylabel('Amplitude');
xlabel('n -->')
hold off;

num2 = st2 + length(x2)-1;
n2 = linspace(st2,num2,length(x2))
subplot(3,1,2);
stem(n2,x2);
hold on;
xlim([min(n2)-1 max(n2)+1]);
ylim([min(x2)-1 max(x2)+1]);
title('Signal 2 (X2)');
ylabel('Amplitude');
xlabel('n -->')
hold off;

n = min(min(n1),min(n2)):max(max(n1),max(n2));
y1 = zeros(1,length(n));
y2 = y1;
y1(find((n>=min(n1)) & (n<= max(n1)))) = x1;
y2(find((n>=min(n2)) & (n<= max(n2)))) = x2;
y = y1 .* y2;
subplot(3,1,3);
stem(n,y);
hold on;
xlim([min(n)-1 max(n)+1]);
ylim([min(y)-1 max(y)+1]);
title('Resultant Signal (Y = X1 + X2)');
ylabel('Amplitude');
xlabel('n -->');
hold off;

end
