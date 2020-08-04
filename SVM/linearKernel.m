function s = linearKernel(x1, x2)
  s = 0;
  x1 = x1(:); x2 = x2(:);
  s = x1' * x2; % produto interno
end