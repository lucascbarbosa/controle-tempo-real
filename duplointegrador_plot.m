% Plots Duplo Integrador

run('duplointegrador_script.m')
N = 30;
F0 = zeros(1,n,1,N);
sim('duplointegrador.slx',30)



%Estados
figure(1)
plot(x1)
hold on
plot(x2)
hold on
plot (x3)
legend('x1_v','x2_v','x1_c','x2_c','x1_mpc','x2_mpc')
title('Estados')
xlabel('Tempo (s)')
hold off

%Estados em discreto, controle em discreto
figure(2)
plot(u1,'o-')
hold on
plot(u2,'o-')
hold on
plot(u3,'o-')
legend('u_c','u_v','u_mpc')
title('Sinais de controle')
xlabel('Tempo (s)')
hold off

%Funções Custo 
figure(3)
plot(J1,'o-')
hold on
plot(J2,'o-')
hold on
plot(J3,'o-')
plot(J_teorico)
title('Custo')

%plot
legend('Parcial_v','Acumulado_v','Parcial_c','Acumulado_c','Parcial_MPC','Acumulado_MPC','Mínimo teórico')
xlabel('Tempo (s)')
hold off

%Ganho
figure(4)
plot(ganhos,'o-')
hold on
plot(ones(N*h,1)*Flqr)
hold on
plot(K3)
hold off
title('Ganho variável')
legend('F1_v','F2_v','F1_c','F2_c','F1_MPC','F2_MPC','Location','northwest')
xlabel('Tempo (s)')

%Kalman
figure(5)
plot(x_mpc)
hold on
plot(x_hat)
legend('x1_mpc','x2_mpc','x1_hat_mpc','x2_hat_mpc')
title('Estado real x Estimado por Kalman')
xlabel('Tempo (s)')
hold off

