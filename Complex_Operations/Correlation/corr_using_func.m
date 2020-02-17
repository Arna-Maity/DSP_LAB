function [corr,n] = corr_using_func(x1,st1,x2,st2)
    num1 = st1 + length(x1) - 1;
    %n1 = linspace(st1,num1,length(x1));

    if length(x1) > length(x2)
        x2 = [x2 linspace(0,0,length(x1)-length(x2))];
    else if length(x1) < length(x2)
        x1 = [x1 linspace(0,0,length(x2)-length(x1))];
        end
    
    % Construct the time-reversed sequence.
    [x3,n2] = timerev(x2,st2);

    len = length(x1) + length(x3) - 1;
    conv_num = st1 + min(n2) + len - 1;
    n = linspace(st1 + min(n2),conv_num,len);
    
    % Perform the convolution of the original x1
    % and the time-reversed x2 sequence.
    corr = xcorr(x1,x2);
    
    % Plot the resultant correlation sequence.
    figure;
    hold on;
    stem(n,corr);
    xlim([min(n)-1 max(n)+1]);
    ylim([min(corr)-1 max(corr)+1]);
    xlabel('l -->');
    ylabel('Similarity -->');
    if (x1 == x2)
    title('Auto-Correlation Sequence (\rho) (USING FUNC.)');
    else
    title('Cross-Correlation Sequence(\rho) (USING FUNC.)');
    end
    hold off;
end