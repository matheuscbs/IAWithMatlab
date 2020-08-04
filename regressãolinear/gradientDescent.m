% Salvar Como: 'gradientDescent.m"

function [w, J_it] = gradientDescent (X, y, w, alpha, iters)
   m = length(y);
   J_it = zeros (iters, 1);
   
   for i=1:iters
     hX = sigmoide (X * w);
     hXmenosY = hX - y;
     w = w - alpha / m.* (hXmenosY' * X)';
     
     J_it(i)=funcaoCusto(w, X, y);
   end
end
