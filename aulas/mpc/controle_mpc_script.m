clear;
global N Phi Gamma Q1 Q2 Q0 Q12 h
%Steps
h = 1; %Sample step
h_plant = (1e-4); %Integration step

%Continuous state space
A = [0 1; 0 0];
B = [0; 1];
C = [1 0];
D = [0];

%Initial plant states
x0 = zeros(2, 1);
x0(1) = 10;
x0(2) = 0;

%Initial observer states;
x0_observer = zeros(2, 1);
x0_observer(1) = 0;
x0_observer(2) = 10;

%Discrete model of double integrator
Phi = [1 h; 0 1];    
Gamma = [h^2/2; h];
C_discrete = [1 0];
D_discrete = 0;
sysd = ss(Phi, Gamma, C, D, h);

%ordem do sistema 
n = length(Phi);

%Horizonte de otimização
N = 20;

%Custo
Q1 = eye(n);
Q2 = 1/10;
Q0 = eye(n);
Q12 = 0;    

%Ganho
[X,K,control_eig,info] = idare(Phi,Gamma,Q1,Q2,[],[]);
observer_eig = 0.1*control_eig;

%Pertubations
measure_noise_gain = 1;
wind_initial_value = 0;
wind_final_value = 0.2;
wind_steptime = 0;

%Input saturation
sat_min = -10;
sat_max = 10;

%Limites MPC

%Valores da restrição de entrada
UM = 100;
Um = -100;
%Valores da restrição de sáida
YM = 100;
Ym = -100;

%nivel ruido de processo
rp = 0;
%nivel ruido de medição
rm = 0;