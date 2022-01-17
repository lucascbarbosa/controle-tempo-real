clear all;

% configuração inicial

% G = tf([1],[1 0 0]);
% H = c2d(G,2,'tustin');
% [num,den] = tfdata(H); 
% num = num{1};
% den = den{1};
% [Phi,Gamma,C,D] = tf2ss(num,den);

Phi = [
    0 1;
    -1 2
];
Gamma = [
    0;
    1
];
C = [1 0];
D = 1;
Q0 = 1;
Q1 = 1;
Q2 = 1;
x=[[0;0]];
N = 100;
