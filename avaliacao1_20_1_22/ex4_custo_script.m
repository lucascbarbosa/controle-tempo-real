clear all;
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

%Custo
Q0 = eye(2);
Q1 = eye(2);
Q2 = 1;
x0= [1;1];

%F por DRE
T = Q0;
F_DRE= inv(Gamma'*T*Gamma+Q2)*Gamma'*T*Phi;

%F por ARE
[X,F_ARE,~,info] = idare(Phi,Gamma,Q1,Q2,[],[]); 

% N = 4;
% T = Q0;
% J = [0];

% for k=1:N-1
%     T = Q1+Phi'*T*Phi-Phi'*T*Gamma*inv(Gamma'*T*Gamma+Q2)*Gamma'*T*Phi;
%     F = inv(Gamma'*T*Gamma+Q2)*Gamma'*T*Phi;
%     u(k) = (-1)*F*x(:,k);
%     x(:,k+1) = Phi*x(:,k) + Gamma*u(k);
%     J(k+1) = J(k)+ x(:,k)'*Q1*x(:,k) + u(k)'*Q2*u(k);
% end
% J(N) = J(N-1)+x(:,N)'*Q0*x(:,N);
% 
% plot(0:N-1,J);
% xlabel('$k$','Interpreter','latex');
% ylabel('$\bar{J}[k]$','Interpreter','latex','FontSize',16);
% title('Custo parcial');