function [oddx,evenx,n] = oddeven(x1,st1,centre)
num1 = st1 + length(x1)-1;
n = linspace(st1,num1,length(x1));
n = n - linspace(centre,centre,length(n));

[x1_rev,n1] = timerev(x1,min(n));
[x_sum,n1] = sigadd(x1,min(n),x1_rev,min(n));
evenx = x_sum/2;

[x1_rev,n1] = timerev(x1,min(n));
[x_sum,n1] = sigadd(x1,min(n),(-1)*x1_rev,min(n));
oddx = x_sum/2;

n = n + linspace(centre,centre,length(n));
subplot(3,1,1);
stem(n,x1);
hold on;
title('Original Signal');
xlim([min(n)-1 max(n)+1]);
ylim([min(x1)-1 max(x1)+1]);
xlabel('n -->');
ylabel('Amplitude');
hold off;

subplot(3,1,2);
stem(n,evenx);
hold on;
title('Even Component of Signal');
xlim([min(n)-1 max(n)+1]);
ylim([min(evenx)-1 max(evenx)+1]);
xlabel('n -->');
ylabel('Amplitude');
hold off;

subplot(3,1,3);
stem(n,oddx);
hold on;
title('Odd Component of Signal');
xlim([min(n)-1 max(n)+1]);
ylim([min(oddx)-1 max(oddx)+1]);
xlabel('n -->');
ylabel('Amplitude');
hold off;
end