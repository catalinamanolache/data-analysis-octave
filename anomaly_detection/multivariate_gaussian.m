function probabilities = multivariate_gaussian(X, mean_values, variances)
    # initializez vectorul coloana al probabilitatilor
    [m, n] = size(X);
    probabilities = zeros(m, 1);

    # calculez numitorul conform formulei
    fraction = 1/sqrt(((2 * pi) ^ n) * det(variances));
    for i = 1:m
    # calculez fiecare element al vectorului conform formulei
        probabilities(i) = exp((-1/2) * (X(i, :) - mean_values) * inv(variances) * (X(i, :) - mean_values)') * fraction;
    endfor
endfunction
