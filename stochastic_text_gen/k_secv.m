function B = k_secv (A, k)
    # gasim lungimea vectorului A
    n = length(A);

    # calculam numarul de k-secvente
    cell_length = n - k;

    # initializam cell-arrayul
    B = cell(cell_length, 1);
    for i = 1:cell_length
    # extragem k-secventa si o adaugam in cell-array
        B{i, 1} = strjoin(A(i:i + k - 1), ' ');
    endfor
endfunction
