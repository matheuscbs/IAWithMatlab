clear ; close all; clc;
%Carregando os dados: Parte 1
%load('aula10_dados1.mat');
dados = load('aula10_dados2.txt');
X = dados(:, 1:2);
%figure;
%plot(X(:,1),X(:,2), 'ro');
%parte K-means
K = 5;
iters = 30;
centroids = kMeansInitCentroids(X , K);
%funcoes utilizadas no codigo
runkMeans(X, centroids, iters, true);
 