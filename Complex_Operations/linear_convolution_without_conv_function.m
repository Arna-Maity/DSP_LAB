clc
clear all;
close all;

x1 = input('enter sequence1');
start1 = input('enter starting point of sequence 1');
end1 = start1 + length(x1);
n1 = start1:end1-1;

x2 = input('enter sequence2');
start2 = input('enter starting point of sequence 2');
end2 = start2 + length(x2);
n2 = start2:end2-1;
 
conv_start = start1 + start2;
conv_last = length(x1)+length(x2)-1;
conv_n = conv_start:conv_start+conv_last-1;

conv_mat = zeros(length(x1),length(x2));

for i=1:length(x1)
    for j=1:length(x2)
        conv_mat(i,j) = x1(i)*x2(j)%creating convolution matrix
    end
end

conv_sequence = zeros(1,conv_last)

for k=2:(conv_last+1)
    temp_sum = 0
    for i = 1:length(x1)
        for j = 1:length(x2)
            if i+j == k
                temp_sum = temp_sum + conv_mat(i,j)%logic-only sum those elements whose sum of indices/location is equal to a value which is constant throughout the given diagonal.
            end
        end
    end
    conv_sequence(k-1) = temp_sum
end
verify = conv(x1,x2)%To verify the output using in-built function
%plotting
subplot(4,1,1)
stem(n1,x1)
hold on
title('Sequence1')
axis([-10 10 -10 10])
hold off

subplot(4,1,1)
stem(n1,x1)
hold on
title('Sequence1')
axis([-10 10 -10 10])
hold off

subplot(4,1,2)
stem(n2,x2)
hold on
title('Sequence2')
hold off

subplot(4,1,3)
stem(conv_n,conv_sequence)
hold on
title('without using in-built function')
hold off

subplot(4,1,4)
stem(conv_n,verify)
hold on
title('Using in-built function')
hold off