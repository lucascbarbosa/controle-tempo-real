global N Phi Gamma Q1 Q2 Q0 Q12 h
%Passo de amostragem
h = 1;

%Horizonte de otimiza��o
N = 20;

%Discrete model of double integrator
Phi = [1 h; 0 1];    
Gamma = [h^2/2; h];
C = [1 0];
D = 0;
sysd = ss(Phi, Gamma, C, D, h);

%ordem do sistema 
n = length(Phi);

%Custo
Q1 = eye(n);
Q2 = 1/10;
Q0 = eye(n);
Q12 = 0;    

%Condi��es iniciais
x10 = 0;
x20 = 10;

%Ganho
[X,Flqr,~,info] = idare(Phi,Gamma,Q1,Q2,[],[]);

F0 = zeros(1,n,1,N);

%Parametros filtro de Kalman

G = [h^2/2; h];
Q = .001;
R = .001;

%Limites MPC

%Valores da restri��o de entrada
UM = 100;
Um = -100;
%Valores da restri��o de s�ida
YM = 100;
Ym = -100;

%nivel ruido de processo
rp = 0;
%nivel ruido de medi��o
rm = 0;