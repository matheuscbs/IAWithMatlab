clear all; 
close all; 
clc;
#carregando os dados para treinamento
dados = load('seeds_dataset.txt');
X = dados(:, 1:7);
Y= dados(:,8);
m=length(Y); % qtd de exemplos de treinamento
a=double(Y==1);
b=double(Y==2);
d=double(Y==3);
Y=[a,b,d];
%Normalizando X;
##mu0 = mean(X); 
##sigma0 = std(X); 
##X = (X - mu0) ./ sigma0; 
##X = [ones(m, 1), X];
% parte 1 :visualização
##figure;
##plotData(X,y);
% parte 2: contruindo um svm linear kernel
c=1;% paramentro de regularização
figure(1);
sigma=0.1;
hold on;
modelo1=svmTrain(X,a,c,@(p1,p2,p3)gaussianKernel(p1,p2,sigma));
%visualizeBoundary(X, a, modelo1);
hold on;
figure(2);
modelo2=svmTrain(X,b,c,@(p1,p2,p3)gaussianKernel(p1, p2,sigma));
%visualizeBoundary(X, b, modelo2);
hold on;
figure(3);
modelo3=svmTrain(X,d,c,@(p1,p2,p3)gaussianKernel(p1, p2,sigma));
%visualizeBoundary(X, d, modelo3);
hold on;
%previsão de conjunto  treinamento
prev1 = svmPredict(modelo1, X);
prev2 = svmPredict(modelo2, X);
prev3 = svmPredict(modelo3, X);
p1=mean(double(prev1==a));
fprintf('\nConjunto de treinamento: resultado %0.2f%%:\n\n',100*p1);
p2=mean(double(prev2==b));
fprintf('\nConjunto de treinamento: resultado %0.2f%%:\n\n',100*p2);
p3=mean(double(prev3==d));
fprintf('\nConjunto de treinamento: resultado %0.2f%%:\n\n',100*p3);
####%previsão de um conjunto qualquer
T=[14.46 14.35 0.8818 5.388 3.377 2.802 5.044
12.73 13.75 0.8458 5.412 2.882 3.533 5.067
17.63 15.86 0.8800 6.033 3.573 3.747 5.929
20.97 17.25 0.8859 6.563 3.991 4.677 6.316
11.35 13.12 0.8291 5.176 2.668 4.337 5.132

];
prev1 = svmPredict(modelo1, T);
prev2 = svmPredict(modelo2,T);
prev3 = svmPredict(modelo3, T);
fprintf('resultado :\n');
prev1
fprintf('\nO resultado do Conjunto de treinamento eh 1 para Kama\n' );
prev2
fprintf('\nO resultado do Conjunto de treinamento eh 1 para Rosa\n' );
prev3
fprintf('\nO resultado do Conjunto de treinamento eh 1 para Canadian\n' );
hold on;
plot(T(:,1),T(:,2),'k+','MarkerSize',14);
