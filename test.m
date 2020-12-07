y = @(x) (100 * sin(x));
n = 9;
a = 0;
b = pi;
k = (2 - 1) * n + 1;
h = abs(b - a) / (k - 1);
my_sum = 0;

step = 1;
while step <= n - 1
    my_sum = my_sum + y(a);
    a = a + h;
    step = step + 1;
end

result = h * (y(a) + y(b) / 2 + my_sum);
result
