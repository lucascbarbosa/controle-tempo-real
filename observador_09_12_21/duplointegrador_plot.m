clear all
% Plots Duplo Integrador

run('duplointegrador_script.m')
N = 30;
F0 = zeros(1,n,1,N);
sim('duplointegrador_com_obs.slx',10)


close all
%Estados
figure(1)
plot(x,'.')
hold on
plot(x_hat,'.')
legend('x_1','x_2','x^_1','x^_2')
title('Estados')
xlabel('Tempo (s)')
ylabel('x')

%Saída
figure(2)
plot(yd,'.')
hold on
title('Saídas discretas')
xlabel('Tempo (s)')
ylabel('y')

%Estados em discreto, controle em discreto
figure(3)
plot(ud,'o-')
title('Sinais de controle')
xlabel('Tempo (s)')

