% Q3
clear all; clc
n = 1000;
fx = zeros(1,n);
fc = zeros(1,n);
ux = zeros(1,n);
uc = zeros(1,n);
for i = 1:n
    for j = 1:i
        x = rand();
        fx(j) = x^2;
        fc(j) = cos(pi*x);
    end
    ux(i) = sum(fx)/i;
    uc(i) = sum(fc)/i;
end
figure;
subplot(2,1,1);
t = linspace(1,1000,1000);
plot(t, ux);
hold on
yline(1/3, 'r');
hold off
xlabel('# of trials');
ylabel('Estimate');
title('Monte Carlo Analysis for x^2');
legend({'x^2' '1/3'});

subplot(2,1,2);
t = linspace(1,1000,1000);
plot(t, uc);
hold on
yline(0,'r');
hold off
xlabel('# of Trials');
ylabel('Estimate');
title('Monte Carlo Analysis for cos(pi*x)');
legend({'cos(pi*x)' '0'});