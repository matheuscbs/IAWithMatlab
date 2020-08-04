function s = gaussianKernel(x1, x2, sigma)
  x1 = x1(:); x2 = x2(:);
  s = 0;
  s = exp( - sum( (x1 - x2) .^ 2 ) ./ (2 .* sigma .* sigma) );
end
