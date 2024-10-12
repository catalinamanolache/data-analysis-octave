function [a] = get_prediction_params (K, y, lambda)
  # initializez matricea unitate
  [m m] = size(K);
  Im = eye(m);
  # obtin descompunerea L a matricii de inversat folosind cholesky
  L = cholesky(lambda * Im + K);
  # calculez vectorul de returnat folosind formula si scriu inversa matricii ca
  # A^(-1) = (L * L')^(-1) = (L')^(-1) * L^(-1) = (L^(-1))' * L^(-1)
  a = lambda * (get_lower_inverse(L)' * get_lower_inverse(L)) * y;
endfunction
