function [L] = cholesky (A)
    # initializam matricea lower
    [n n]=size(A);
    L=zeros(n,n);

    for i = 1:n
        # calculam elementele de pe diagonala
        L(i, i) = sqrt(A(i, i) - L(i, 1:i-1) * L(i, 1:i-1)');
        # completam restul elementelor din matrice
        L(i+1:n, i)=(A(i, i+1:n) - L(i, 1:i-1) * L(i+1:n, 1:i-1)') / L(i, i);
    endfor
endfunction

