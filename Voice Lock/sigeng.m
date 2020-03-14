function [y] = sigeng(x)
    z = x.*x;
    y = sum(z);
end