function y = circ_conv_func(x1,x2,sz)
% l = length(x1)+length(x2);
y = cconv(x1,x2,sz);
subplot(3,1,1);
stem(x1);
hold on;
title('X1 Sequence');
xlim([-1 length(x1)+1]);
ylim([min(x1)-1 max(x1)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;

subplot(3,1,2);
stem(x2);
hold on;
title('X2 Sequence');
xlim([-1 length(x2)+1]);
ylim([min(x2)-1 max(x2)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;

subplot(3,1,3);
stem(y);
hold on;
title('Circular Convolution Sequence');
xlim([-1 length(y)+1]);
ylim([min(y)-1 max(y)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;
end