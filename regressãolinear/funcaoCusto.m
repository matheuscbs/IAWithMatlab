%Salvar como "FuncaoCusto.m"

function [J, grad] = funcaoCusto(w, X, y)
  m = length (y);
  
  hX = sigmoide (X * w);
  J = (-y' * log(hX) - (1 - y)' * log(1 - hX)) ./ m;
  
  hXmenosY = (hX - y);
  grad = (hXmenosY' * X)' ./ m; 
end