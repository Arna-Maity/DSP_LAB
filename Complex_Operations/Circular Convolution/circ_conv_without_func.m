function y = circ_conv_without_func(x1,x2,sz)
y2 = zeros(1,sz);
y1 = zeros(1,sz);

if length(x1)< sz
    for i = 1:length(x1)
        y1(i) = x1(i);
    end
else
    y1 = x1;
end

if length(x2) < sz
    for i = 1:length(x2)
        y2(i) = x2(i);
    end
else
    y2 = x2;
end

mat=[];
for i=1:sz
    mat =[mat (circshift(y1,[0,(i-1)]))'];
end

y = (mat*(y2'))';

subplot(3,1,1);
stem(y1);
hold on;
title('X1 Sequence');
xlim([-1 length(y1)+1]);
ylim([min(y1)-1 max(y1)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;

subplot(3,1,2);
stem(y2);
hold on;
title('X2 Sequence');
xlim([-1 length(y2)+1]);
ylim([min(y2)-1 max(y2)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;

subplot(3,1,3);
stem(y);
hold on;
title('Convolution Sequence');
xlim([-1 length(y)+1]);
ylim([min(y)-1 max(y)+1]);
xlabel('n -->');
ylabel('Amplitude -->');
hold off;
end