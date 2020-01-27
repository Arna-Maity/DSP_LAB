function E = sigenergy(x1)
    E = 0;
    for i = 1:length(x1)
        E = E + abs(x1(i))^2;
    end
end