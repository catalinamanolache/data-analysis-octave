
function [precision recall F1] = metrics(true_pozitives, false_pozitives, false_negatives)
    # calculez totalul pozitivelor ca fiind suma tuturor pozitivelor
    total_positives = true_pozitives + false_pozitives;
    # calculez totalul outlierilor reali ca fiind suma true positives si false negatives
    total_real = true_pozitives + false_negatives;

    # precision este procentajul true pozitives din totalul outlierilor
    precision = true_pozitives / total_positives;
    # recall este procentajul true positives din totalul outlierilor reali
    recall = true_pozitives / total_real;
    # calculez F1 conform formulei
    F1 =  2 * precision * recall / (precision + recall);
endfunction