clear all
% Plots Duplo Integrador

run('duplointegrador_script.m')
N = 30;
F0 = zeros(1,n,1,N);
sim('duplointegrador.slx',30)


close all
%Estados
figure(1)
plot(x,'.')
hold on
legend('x1','x2')
title('Estados')
xlabel('Tempo (s)')

%Estados em discreto, controle em discreto
figure(2)
plot(u,'o-')
title('Sinais de controle')
xlabel('Tempo (s)')