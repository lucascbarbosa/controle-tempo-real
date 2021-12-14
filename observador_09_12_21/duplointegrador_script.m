clear all

global N Phi Gamma Q1 Q2 Q0 Q12 h
%Passo de amostragem
h = 0.1;
h_plant = (1e-4)*h; %Integration step

%Horizonte de otimiza��o
N = 20;

%Discrete model of double integrator
A = [0 1;0 0];
B = [0;1];
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

%Ganho de realimenta��o 

[X,Flqr,~,info] = idare(Phi,Gamma,Q1,Q2,[],[]); 
%Flqr = place(Phi,Gamma,[-0.5 0.7])
%F0 = zeros(1,n,1,N);

% Ganho do observador
obs_eig = [-10 -15];