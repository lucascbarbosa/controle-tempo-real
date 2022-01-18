%Configuração inicial
clear all;
close all;
run('ex4_custo_script.m')

F0 = zeros(1,n,1,N);
out = sim('ex4_custo.slx',(N-1)*h);


%Estados
figure(1)
plot(out.xd_ARE,'o-')
hold on
plot(out.xd_DRE,'o-')
legend('x_{1_{ARE}}[k]','x_{2_{ARE}}[k]','x_{1_{DRE}}[k]','x_{2_{DRE}}[k]')
title('Estados em tempo discreto')
xlabel('k')
ylabel('x[k]')
hold off

%Saída
figure(2)
plot(out.xd_ARE.Time,out.xd_ARE.Data(:,1),'o-')
hold on
plot(out.xd_DRE.Time,out.xd_DRE.Data(:,1),'o-')
yline(0,'-','Referência');
legend('y_{ARE}','y_{DRE}')
title('Saídas em tempo discreto')
xlabel('k')
ylabel('y[k]')
hold off

%Erro
figure(3)
plot(out.xd_ARE.Time,R-out.xd_ARE.Data(:,1),'o-')
hold on
plot(out.xd_DRE.Time,R-out.xd_DRE.Data(:,1),'o-')
legend('e_{ARE}','e_{DRE}')
title('Erro de rastreamento em tempo discreto')
xlabel('k')
ylabel('e[k]')
hold off

%Sinal de controle
figure(4)
plot(out.ud_ARE,'o-')
hold on
plot(out.ud_DRE,'o-')
hold on
legend('u_{ARE}','u_{DRE}')
title('Sinais de controle em tempo discreto')
xlabel('k')
ylabel('u[k]')
hold off

%Custos
figure(5)
plot(out.J_ARE,'o-')
hold on
plot(out.J_DRE,'o-')
hold on
legend('J_{ARE}','J_{DRE}')
title('Custos em tempo discreto')
xlabel('k')
ylabel('J[k]')
hold off

