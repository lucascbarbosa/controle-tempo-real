clear all;
close all;
% global N Phi Gamma Q1 Q2 Q0 Q12 h

%% Steps
h = 0.1; % Sample step
h_plant = (1e-3); % Integration step

%% Continuous plant state space (double integrator)
Rm = eye(3);
A = [zeros(3) eye(3)   zeros(3);
     zeros(3) zeros(3) -Rm      ;
     zeros(3) zeros(3) zeros(3)];
B = [zeros(3) zeros(3);
     Rm       eye(3);
     zeros(3) zeros(3)];
C = [eye(3) zeros(3) zeros(3)];
D = [zeros(3) zeros(3)];
G = [zeros(3) zeros(3);
     -Rm        zeros(3);
     zeros(3) eye(3)];
Q = .1*eye(2*3);   % process_noise_covariance
R = .1*eye(3);   % measure_noise_variance
n = length(A);    % System order

%% Error system
F=A;
H=C;
B_error = zeros(9,6);
D_error = zeros(3,6);

%% Initial plant states
x0 = zeros(n, 1);

%% Observer parameters;
x0_observer = zeros(n, 1);
x0_observer(1:3, 1) = 0.1;
L = lqed(F, G, H, Q, R, h);

%% Reference
am = zeros(3,1);
g = zeros(3,1); %[0;0;-9.98];
reference=[am;g]; %[am;g]
gps = zeros(3,1);

%% Input saturation
sat_min = -(10000);
sat_max = (10000);

%% Pertubations
noise_seed = 42;
rng(noise_seed);
wind_initial_value = 0;
wind_final_value = 0;
wind_steptime = 5;

%% Simulation
simulation = 'drone_position_estimate_continuous.slx';
out = sim(simulation,10);

save_file=true;
% dirname = sprintf('%s_imgs', simulation);
% if not(isfolder(dirname)) && save_file
%     mkdir(dirname);
% end

plot_xt(out, save_file);
plot_deltax(out, save_file);
plot_real_x(out, save_file);