%Aula4.m

%Parte1: Incializacao
clear all; close all; clc;

dados = load('aula04_dados.txt');

X = dados(: , 1:4);
y = dados(:, 5); 

y1 = double( y == 1 ); %setosa
y2 = double( y == 2 ); %versicolor
y3 = double( y == 3 ); %virginica

m = length(y);
X = [ones(m,1), X];

%Parte2: descida do gradiente
alpha = 0.01; %taxa de apredizagem
iters = 7000;

% Setosa
w1 = zeros(size(X,2), 1);
[w1, J1] = gradientDescent(X, y1, w1, alpha, iters);

figure;
plot(1:length(J1), J1,'ro', 'LineWidth',2);
 
%Versicolor
w2 = zeros(size(X,2), 1);
[w2, J2] = gradientDescent(X, y2, w2, alpha, iters);
figure;
plot(1:length(J2), J2,'ro', 'LineWidth',2);

%Virginica
w3 = zeros(size(X,2), 1);
[w3, J3] = gradientDescent(X, y3, w3, alpha, iters);
figure;
plot(1:length(J3), J3,'ro', 'LineWidth',2);

v = [1, 5.3, 3.7, 1.5, 0.2];
clas = [sigmoide(v * w1); sigmoide(v * w2); sigmoide(v * w3)];

[valor indice]=max(clas);

if indice == 1
  fprintf('Setosa\n');
elseif indice == 2
  fprintf('Versicolor\n');
elseif indice == 3
  fprintf('Virginica\n');
end

