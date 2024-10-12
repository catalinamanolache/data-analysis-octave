function retval = k_secv_idx (distinct_k_sec)
    # initializam un dictionar gol
    dictionary = containers.Map();
    # gasim lungimea vectorului de k-secvente distincte
    n = length(distinct_k_sec);
    for i = 1:n
    # adaugam in dictionar la cheia data de k-secventa curenta, valoarea curenta
        dictionary(distinct_k_sec{i}) = i;
    endfor
    # returnam acest dictionar
    retval = dictionary;
endfunction