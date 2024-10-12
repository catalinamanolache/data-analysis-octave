function [mean_values variances] = estimate_gaussian(X)
    [m, n] = size(X);
    # initializez vectorul linie de medie
    mean_values = zeros(1, n);

    for i = 1:n
    # calculez media pe fiecare coloana conform formulei
        mean_values(i) = sum(X(:, i)) / m;
    endfor
    # initializez matricea de varianta
    variances = zeros(n, n);
    for i = 1:n
        for j = 1:n 
        # calculez fiecare element conform formulei
        variances(i, j) = sum((X(:, i) - mean_values(i))' * (X(:, j) - mean_values(j))) / m;
        endfor
    endfor

endfunction
