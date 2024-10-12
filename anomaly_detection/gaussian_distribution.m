function probability = gaussian_distribution(X, mean_value, variance)
    # initializez vectorul linie de probabilitate
    [m, n] = size(X);
    probability = zeros(1, m);

    # calculez numitorul conform formulei
    fraction = 1/sqrt(((2 * pi) ^ n) * det(variance));
    for i = 1:m
    # calculez fiecare element al vectorului conform formulei
        probability(i) = exp((-1/2) * (X(i, :) - mean_values) * inv(variance) * (X(i, :) - mean_values)') * fraction;
    endfor
endfunction