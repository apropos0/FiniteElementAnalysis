%function%
function TINT = TRAPEI(f, n, h)
i = 1; sum = 0;
while(1)
    sum = sum + 2 * f(i+1);
    if i>=n, break, end
    i = i + 1;
end
sum = sum + f(1) + f(n);
TINT = (h/2) * sum;
