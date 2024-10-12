function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)
    # initializez matricea stochastica
    m = length(k_secv_set); # liniile din matrice corespund k-secventelor
    n = length(words_set); # coloanele sunt cuvintele
    total_secv = length(k_secv_corpus);
    total_words = length(corpus_words);
    stochastic_matrix = zeros(m, n);

    # folosesc functiile din biblioteca pentru a crea dictionarele pentru k-secv si cuvinte
    words_dic = word_idx(words_set);
    k_secv_dic = k_secv_idx(k_secv_set);

    for i = 1:total_secv
        # k-secventa curenta
        secv = k_secv_corpus{i};
        # cuvantul care urmeaza dupa ea este cu k pozitii in fata
        word = corpus_words{i + k};

        # verificam daca nu depasim dimensiunile vectorului de cuvinte
        if i + k <= total_words
        # crestem numarul de aparitii al cuvantului dupa k-secventa curenta
        # la pozitiile indicate de fiecare dictionar
            stochastic_matrix(k_secv_dic(secv), words_dic(word))++;
        endif
    endfor
    # returnam matricea stochastica
    retval = stochastic_matrix;
endfunction