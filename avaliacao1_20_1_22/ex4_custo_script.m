clear all;
global N Phi Gamma Q1 Q2 Q0 h R
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

%Estado inicial
x0= [1;1];

%Referência
R = 0;

%F por ARE
[X,F_ARE,~,info] = idare(Phi,Gamma,Q1,Q2,[],[]); 

%Valor inicial do bloco de memória
F0 = zeros(1,n,1,N);

%Nível ruido de medição
rm = 0;
