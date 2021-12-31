% Plots Duplo Integrador
clear
run('controle_mpc_script.m')
sim('controle_mpc.slx',30)

%Estados
figure(1)
plot(x)
hold on
plot(xhat)
hold on
legend('x1','x2','xhat1','xhat2')
title('Estados')
xlabel('Tempo (s)')
grid
hold off

%Estados em discreto, controle em discreto
figure(2)
plot(u,'o-')
hold on
plot(u_real,'o-')
legend('u','u_{real}')
title('Sinais de controle')
xlabel('Tempo (s)')
grid
hold off

%Funções Custo 
figure(3)
plot(Jtotal,'o-')
hold on
plot(Jpartial,'o-')
hold on
title('Custo')
xlabel('Tempo (s)')
legend('Acumulado', 'Parcial')
grid
hold off