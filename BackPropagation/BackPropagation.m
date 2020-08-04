%Aula 07 - BackPropagation
clc;
clear;
clear all;

function g = sigmoid(z)
  g=1 ./ ( 1 + exp(-z));  
end

dados = load ('aula05_dados.txt');
X = dados (:,1:2);

y1 = double (X(:,1) >= 0.5);
y2 = double (X(:,2) >= 0.5);

y = double(xor(y1,y2));

m = length(y);
X = [ones(m,1) X]; % atributo x0 = 1

w1=rand(2,3);
w2=rand(1,3);
alpha=0.5;
iters=5000;

for i=1:iters
  a1 = X;
  z2 = X * w1';
  a2 = sigmoid(z2);
  a2 = [ones(m,1) a2];
  z3 = a2 * w2';
  a3 = sigmoid(z3);
  delta3 = a3 - y;
  zz2 = z2;
  zz2 = [ones(size(z2,1),1) z2];
  delta2 = (delta3 * w2)  .* (sigmoid(zz2) .* ( 1 - sigmoid(zz2) ));
  Delta2 = delta3' * a2;
  delta2 = delta2(:,2:3);
  Delta1 = delta2' * a1;
  w1 = w1 - ( alpha ./ m ) * Delta1;
  w2 = w2 - ( alpha ./ m ) * Delta2;
end
disp(w1);
disp(w2);
% =======================
% testes
v = [ 0 0; 0 1; 1 0; 1 1];
v = [ones(size(v,1), 1) v];

zz2 = v * w1';
aa2 = sigmoid(zz2);
aa2 = [ones(size(v,1), 1) aa2];
zz3 = aa2 * w2';
aa3 = sigmoid(zz3)
