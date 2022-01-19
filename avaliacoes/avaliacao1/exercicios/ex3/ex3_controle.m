clear all;
close all;
global N Phi Gamma Q1 Q2 Q0 h
%Passo de amostragem
h = 1;

%Horizonte de otimização
N = 20;

%Modelo discreto do duplo integrador
Phi = [1 h; 0 1];    
Gamma = [h^2/2; h];
C = [1 0];
D = 0;

%ordem do sistema 
n = length(Phi);

%Custo
Q0 = eye(2);
Q1 = eye(2);
Q2 = 1;

T = Q0;
syms x1_ x2_ u_
x = [[0;0]];
x_ = [x1_;x2_];

for k=1:N-1
    F(k,:) = inv(Gamma'*T*Gamma+Q2)*Gamma'*T*Phi;
    u(k) = (-1)*F(k,:)*x(:,k);
    J = x_'*(Q1+Phi'*T*Phi)*x_+u_'*(Gamma'*T*Gamma+Q2)*u_ + x_'*(Phi'*T*Gamma)*u_+u_'*(Gamma'*T*Phi)*x_;
    dJ = diff(J,u_);
    F_(k,:) = [vpa(diff(dJ,x1_)/diff(dJ,u_)) vpa(diff(dJ,x2_)/diff(dJ,u_))]; 
    x(:,k+1) = Phi*x(:,k) + Gamma*u(k);
    T = Q1+Phi'*T*Phi-Phi'*T*Gamma*inv(Gamma'*T*Gamma+Q2)*Gamma'*T*Phi;
end

plot(1:N-1,F)
hold on
plot(1:N-1,F_)
legend('F_1 por DRE','F_2 por DRE', 'F_1 por derivação', 'F_2 por derivação');
xlabel('k');
title('Comparação entre ganhos por DRE e derivação')
