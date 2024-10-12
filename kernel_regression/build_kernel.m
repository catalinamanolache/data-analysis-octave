function [K] = build_kernel (X, f, f_param)
  # initializez matricea kernel
  [m, n] = size(X);
  K = zeros(m, m);

  for i = 1:m
    for j = 1:m
      # calculez fiecare element al kernelului folosind functia din antet, parametrul ei
      # si fiecare linie i si j din matricea de intrare
      K(i, j) = f(X(i, :), X(j, :), f_param);
    endfor
  endfor
endfunction
