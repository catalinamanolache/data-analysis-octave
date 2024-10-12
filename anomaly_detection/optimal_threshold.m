function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)
    # initializez variabilele care vor fi returnate
    best_epsilon = 0;
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;

    # initializez vectorul de predictii cu 0
    n = length(probabilities);
    predictions = zeros(1, n);

    # calculez lungimea pasului
    minimum = min(probabilities);
    maximum = max(probabilities);
    step = (maximum - minimum) / 1000;

    for epsilon = minimum:step:maximum
        for i = 1:n
        # daca probabilitatea e mai mica decat epsilonul curent, am gasit un outlier
            if probabilities(i) < epsilon
                predictions(i) = 1;
            else
        # altfel, nu este outlier
                predictions(i) = 0;
            endif
        endfor
        # verificam natura predictiilor folosind vectorul truths
        [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths);
        # calculam parametrii corespunzatori epsilonului curent
        [precision, recall, F1] = metrics(true_pozitives, false_pozitives, false_negatives);
        if F1 > best_F1 
        # daca F1 curent este mai bun decat cel anterior, il actualizam
        # impreuna cu ceilalti parametri de returnat
            best_F1 = F1;
            best_epsilon = epsilon;
            associated_precision = precision;
            associated_recall = recall;
        endif
    endfor
endfunction
