clear; clc; close all;

function g=sigmoid(z)
  g= 1 ./ (1+exp(-z));

end

dados = load('aula04_dados.txt');
X = dados(:,1:4);
y = double(dados(:,5) == 1);
m = length(y);

X = [ones(m,1) , X];
w = zeros(size(X,2), 1);
iteracoes = 1000;
alpha = 0.01;

%funcao descida do gradiente
for i=1:iteracoes
  fprintf('Iteracao %d\r',i);
  hX = sigmoid (X * w); %hipotese
  hXmenosY = hX - y; %erro
  grad = hXmenosY' * X; %gradiente
  w = w - (alpha ./ m) .* grad'; %ajuste de pesos
end

fprintf('\n');

prev = double(sigmoid(X * w) >= 0.5);

##y(1)=0; alterar o valor de y para mudar o precisao de acerto
##y(2)=0;
##y(3)=0;

fprintf('Precisao sobre o training set: \n');
fprintf('%.2f%%\n',100 * mean(double(prev == y)));