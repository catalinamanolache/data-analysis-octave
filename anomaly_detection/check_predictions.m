function [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths)
    # initializez contoarele
    false_pozitives = 0;
    false_negatives = 0;
    true_pozitives = 0;
    n = length(predictions);

    for i = 1:n
        if predictions(i) && truths(i)
        # daca predictia si adevarul sunt 1, outlierul este true positive
            true_pozitives++;
        endif
        if predictions(i) && truths(i) == 0
        # daca predictia e 1 si adevarul e 0, outlierul este false positive
            false_pozitives++;
        endif
        if predictions(i) == 0 && truths(i)
        # daca predictia e 0 si adevarul e 1, outlierul este false negative
            false_negatives++;
        endif
    endfor
endfunction