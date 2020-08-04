%Aula 6 - Perceptron Rede MLP (XOR)
clc;
clear;
close all;

function g = sigmoid(z)
  g=1 ./ ( 1 + exp(-z));  
end

dados = load ('aula05_dados.txt');
X = dados (:,1:2);

y1 = double (X(:,1) >= 0.5);
y2 = double (X(:,2) >= 0.5);

y = xor(y1,y2);

c1 = find ( y == 0 );
c2 = find ( y == 1 );

figure;
plot(X(c1,1), X(c1,2), 'rx', 'MarkerSize', 9);
hold on;
plot(X(c2,1), X(c2,2), 'bo', 'MarkerSize', 9);
hold off;

m = length(y);
X = [ones(m,1) X]; % atributo x0 = 1

w1 = [ -2, 4, 4; 6, -4, -4 ];
w2 = [ -6, 4, 4];

z2 = X *w1';
a2 = sigmoid(z2);
a2 = [ones(m,1) a2];

z3 = a2 * w2';
a3 = sigmoid(z3);

% =======================
% testes
v = [ 0 0; 0 1; 1 0; 1 1];
v = [ones(size(v,1), 1) v];

zz2 = v * w1';
aa2 = sigmoid(zz2);
aa2 = [ones(size(v,1), 1) aa2];
zz3 = aa2 * w2';
aa3 = sigmoid(zz3);
