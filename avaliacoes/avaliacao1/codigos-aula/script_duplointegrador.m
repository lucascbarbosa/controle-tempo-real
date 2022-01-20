clear all;
close all;
global N Phi Gamma Q1 Q2 Q0 Q12 h
%Steps
h = 1; %Sample step
h_plant = (1e-3); %Integration step


%Continuous state space
A = [0 1; 0 0];
B = [0; 1];
C = [1 0];
D = [0];

%Initial plant states
x0 = zeros(2, 1);
x0(1) = 1;
x0(2) = 0;

%Initial observer states;
x0_observer = zeros(2, 1);
x0_observer(1) = 0;
x0_observer(2) = 0;

%Discrete model of double integrator
Phi = [1 h; 0 1];    
Gamma = [h^2/2; h];
C_discrete = [1 0];
D_discrete = 0;
sysd = ss(Phi, Gamma, C, D, h);

%ordem do sistema 
n = length(Phi);

%Horizonte de otimização
N = 40;

%Referência
reference=0;

%Custo
Q1 = eye(n);
Q2 = 1/10;
Q0 = eye(n);
Q12 = 0;    

%Condições iniciais
%x10 = 0;
%x20 = 0;

%Ganho
[X,K,control_eig,info] = idare(Phi,Gamma,Q1,Q2,[],[]);
observer_eig = 0.1*control_eig;

%Pertubations
measure_noise_gain = 1e-2;
wind_initial_value = 0;
wind_final_value = 0.2;
wind_steptime = 0;

%Input saturation
sat_min = -(10);
sat_max = (10);


%Parametros filtro de Kalman

% G = [h^2/2; h];
% Q = .001;
% R = .001;

%Limites MPC

% %Valores da restrição de entrada
% UM = 100;
% Um = -100;
% %Valores da restrição de sáida
% YM = 100;
% Ym = -100;

%nivel ruido de processo
rp = 0;
%nivel ruido de medição
rm = 0;

out = sim('duplointegrador.slx', 10);

teste = 1;
dirname = sprintf('teste_%i_imgs', teste);
if not(isfolder(dirname))
    mkdir(dirname);
end
filepath = sprintf('%s\\parameters.txt', dirname);
fileID = fopen(sprintf('%s\\parameters.txt', dirname),'w');
fprintf(fileID, 'A = %.2f\n', A);
fprintf(fileID, 'B = %.2f\n', B);
fprintf(fileID, 'C = %.2f\n', C);
fprintf(fileID, 'D = %.2f\n', D);
fprintf(fileID, 'Phi= %.2f\n', Phi);
fprintf(fileID, 'Gamma = %.2f\n', Gamma);
fprintf(fileID, 'C_discrete = %.2f\n', C_discrete);
fprintf(fileID, 'D_discrete = %.2f\n', D_discrete);
fprintf(fileID, 'h = %.2f\n', h);
fprintf(fileID, 'h_plant = %.2f\n', h_plant);
fprintf(fileID, 'x0 = %.2f\n', x0);
fprintf(fileID, 'xo_observer = %.2f\n', x0_observer);
fprintf(fileID, 'Q1 = %.2f\n', Q1);
fprintf(fileID, 'Q2 = %.2f\n', Q2);
fprintf(fileID, 'Q12 = %.2f\n', Q12);
fprintf(fileID, 'Q0 = %.2f\n', Q0);
fprintf(fileID, 'N = %i\n', N);
fprintf(fileID, 'control_eig = %.2f\n', control_eig);
fprintf(fileID, 'observer_eig = %.2f\n', observer_eig);
fprintf(fileID, 'sat_min = %.2f\n', sat_min);
fprintf(fileID, 'sat_max = %.2f\n', sat_max);
fprintf(fileID, 'measure_noise_gain = %.2f\n', measure_noise_gain);
fprintf(fileID, 'wind_initial_value = %.2f\n', wind_initial_value);
fprintf(fileID, 'wind_final_value = %.2f\n', wind_final_value);
fprintf(fileID, 'wind_steptime = %.2f\n', wind_steptime);
fclose(fileID);

plot_u(out);
plot_y(out);
plot_j(out);
plot_j_total(out);
plot_x(out);