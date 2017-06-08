function [cost, pth] = dtw(a, b)
na = length(a);
nb = length(b);
D = zeros(na, nb);
di = D;

for i = 1:nb,
    for j = 1:na,
        d = (a(j) - b(i))^2;
        if (i > 1) && (j > 1)
            if D(j-1, i) > D(j, i-1)
                if D(j, i-1) > D(j-1, i-1)
                    D(j, i) = d + D(j-1, i-1);
                    di(j, i) = 3;
                else
                    D(j, i) = d + D(j, i-1);
                    di(j, i) = 2;
                end
            else
                if D(j-1, i) > D(j-1, i-1)
                    D(j, i) = d + D(j-1, i-1);
                    di(j, i) = 3;
                else
                    D(j, i) = d + D(j-1, i);
                    di(j, i) = 1;
                end
            end
        elseif (i == 1) && (j == 1)
            D(j, i) = d;
            di(j, i) = 0;
        elseif (j == 1)
            D(j, i) = d + D(j, i-1);
            di(j, i) = 2;
        else
            D(j, i) = d + D(j-1, i);
            di(j, i) = 1;
        end
    end
end

j = na;
i = nb;
cost = sqrt(D(j, i));
pth = [j, i];
while di(j, i) ~= 0,
    nj = j - mod(di(j, i), 2);
    i = i - floor(di(j, i)/2);
    j = nj;
    pth = [[j, i]; pth];
end
