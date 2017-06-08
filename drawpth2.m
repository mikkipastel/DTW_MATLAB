function drawpth2(a, b, pth, offset)
[r, c] = size(pth);
nb = length(b);
plot(b, 'kx-');
hold on
a = a + offset;
na = length(a);
plot(a, 'kx-');
hold off
for i = 1:r,
    h = line([(pth(i, 1)), (pth(i, 2))], [a(pth(i, 1)) b(pth(i, 2))]);
%    set(h, 'Color', [1 0.5 0.5]);
    set(h, 'Color', [0 0 0]);
    set(h, 'LineStyle', '-.');
end
