function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)
  # obtinem numarul total de date pentru calculul nr de linii al variabilelor de returnat
  [m, n] = size(X);
  total_data_number = m;

  # calculez dimensiunile pentru matricile de antrenare și testare
  train_size = round(percentage * total_data_number);
  test_size = round((1 - percentage) * total_data_number);

  # initializam matricile
  X_train = zeros(train_size, n);
  X_pred = zeros(test_size, n);
  y_train = zeros(train_size, 1);
  y_pred = zeros(test_size, 1);

  # selectez primele train_size linii din matricile initiale pt antrenarea modelului
  for i = 1:train_size
    X_train(i, :) = X(i, :);
    y_train(i) = y(i);
  endfor

  # selectez restul de linii ramase din matricile initiale pt testarea modelului
  for i = train_size + 1:total_data_number
    X_pred(i - train_size, :) = X(i, :);
    y_pred(i - train_size) = y(i);
  endfor
endfunction
