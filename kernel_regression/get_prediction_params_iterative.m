function [a] = get_prediction_params_iterative (K, y, lambda)
  # initializez matricea unitate
  [m m] = size(K);
  Im = eye(m);
  # intializez vectorul solutiilor
  x0 = zeros(m, 1);
  # folosesc metoda gradientului conjugat cu parametrii indicati
  a = conjugate_gradient(lambda * Im + K, y, x0, 1e-6, 1000);
endfunction
