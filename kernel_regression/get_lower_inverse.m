function [P] = get_lower_inverse (L)
    # intializez matricea inversa
    [n n] = size(L);
    P = eye(n);
    
    for i = 1:n
        for j = i+1:n
            fraction = L(j, i) / L(i, i);
            P(j, :) -= fraction * P(i, :);
        endfor
		P(i, :) /= L(i, i);
    endfor
endfunction