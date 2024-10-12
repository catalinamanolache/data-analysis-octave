function retval = word_idx (distinct_wds)
    # initializam un dictionar gol
    dictionary = containers.Map();
    # gasim lungimea vectorului de k-secvente distincte
    n = length(distinct_wds);
    for i = 1:n
    # adaugam in dictionar la cheia data de k-secventa curenta, valoarea curenta
        dictionary(distinct_wds{i}) = i;
    endfor
    # returnam acest dictionar
    retval = dictionary
endfunction
