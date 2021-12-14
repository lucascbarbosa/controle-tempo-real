clear all
% Plots Duplo Integrador

run('duplointegrador_script.m')
N = 30;
F0 = zeros(1,n,1,N);
sim('duplointegrador_com_obs.slx',0.99)


close all
%Estados
figure(1)
plot(xd,'.')
hold on
plot(xd_hat,'.')
legend('x_1','x_2','x_1^','x_2^')
title('Estados')
xlabel('Tempo (s)')
ylabel('x')

%Saída
figure(2)
plot(yd,'.')
hold on
plot(yd_hat,'.')
legend('y','y^')
title('Saídas discretas')
xlabel('Tempo (s)')
ylabel('y')

%Estados em discreto, controle em discreto
figure(3)
plot(ud,'o-')
title('Sinais de controle')
xlabel('Tempo (s)')

