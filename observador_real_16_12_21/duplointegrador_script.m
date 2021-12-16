clear all

global N Phi Gamma Q1 Q2 Q0 Q12 h
%Passo de amostragem
h = 0.1;
h_plant = (1e-4)*h; %Integration step

%Horizonte de otimização
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
Q1 = eye(n); % Transitório dos estados
Q2 = 1/10; % Energia do controle
Q0 = eye(n); % Estado final - erro de regime
Q12 = 0;    

%Condições iniciais
x10 = 0;
x20 = 10;

%Ganho de realimentação 

[X,Flqr,~,info] = idare(Phi,Gamma,Q1,Q2,[],[]); 
%Flqr = place(Phi,Gamma,[-0.5 0.7])
%F0 = zeros(1,n,1,N);

% Ganho do observador
obs_eig = [-0.01 0.01];

% Saturação de entrada
sat_umin = -10;
sat_umax = 10;

% Ruído de medição
noise_gate = 1;

% Perturbação do vento
wind_gate = 1;
wind_steptime = 0;
wind_initialvalue = 0;
wind_finalvalue = 1;