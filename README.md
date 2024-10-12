**Nume:** Manolache Maria-Catalina
**Grupă:** 313CAb

**Analiza datelor:**
Programul are trei sarcini: detectia anomaliilor folosind distributii
gaussiene si optimizarea unui prag de detectie, kernel regression 
aplicat cu mai multe functii kernel si generarea de text
prin secvente si probabilitati, folosind o matrice stocastica pentru a
modela relatiile dintre cuvinte.

## Task 1: Detectia anomaliilor
Setul de date folosit pentru analiza va fi prelucrat in urmatoarele functii:

* estimate_gaussian: se vor aplica primele doua formule, pentru a obtine 
vectorul medie pe componente si matricea de varianta din matricea de input

* gaussian_distribution: se va aplica a treia formula pentru a obtine
probabilitatea aparitiei unui element printre valorile datasetului folosit,
care va fi stocata sub forma unui vector linie probability

* multivariate_gaussian: asemenea functiei anterioare, singura diferenta este
reprezentata de faptul ca vectorul returnat va fi un vector coloana

* check_predictions: se va verifica natura outlierilor/predictiilor
facute in optimal_threshold si va creste contoarele pentru true_positives,
daca predictia si adevarul sunt 1, false_positive daca predictia e 1 dar
adevarul este 0 si false_negative daca predictia e 0 si adevarul este 1

* metrics: aceasta functie va calcula parametrii corespunzatori fiecarui
epsilon testat in optimal_threshold (precision, recall si F1) folosind
formulele corespunzatoare

* optimal_threshold: aceasta functie va gasi parametrii optimi pentru a
determina outlierii din dataset, iterand pentru mai multe valori ale lui
epsilon si gasind anumite predictii ale outlierilor prin testarea
probabilitatii ca acestia sa se gaseasca in dataset. Aceste predictii vor fi
impartite in trei categorii prin apelarea functiei check_predictions si
parametrii epsilonului curent vor fi determinati prin apelarea functiei
metrics. Daca epsilonul curent este cel mai bun dintre cei descoperiti (are
scorul F1 cel mai bun), parametrii vor fi actualizati

## Task 2: Kernel Regression

* linear_kernel, gaussian_kernel, polynomial_kernel: se vor aplica formulele
de calcul ale celor trei tipuri de kerneluri

* split_dataset: se imparte setul de date intr-unul pentru antrenare si unul
pentru testare, primul continand un anumit procent din datele initiale, iar
cel de-al doilea restul datelor. Se initializeaza matricile ce vor contine
aceste date si se selecteaza din setul de date original liniile corespunzatoare
acestor procentaje

* build_kernel: se va crea matricea kernel, folosind functia din antet si
f_param (cel de-al treilea parametru din functiile de calcul ale kernelurilor)
pe baza fiecarei linii i si j din matricea de input

* cholesky: se aplica algoritmul pentru factorizarea Cholesky pentru a 
descompune matricea A in L * L'

* get_lower_inverse: se aplica un algoritm de inversare a unei matrici lower

* conjugate_gradient: se aplica algoritmul pentru metoda gradientului conjugat
pentru aflarea solutiei unei ecuatii liniare

* eval_value: se calculeaza predictia calculata pentru datele de intrare x,
calculand un vector coloana kernel folosind fiecare linie din matricea X,
vectorul x si functiile date ca parametri. Predictia este calculata ulterior
inmultind fiecare element din a cu fiecare element din kernel si adunand acest
produs la pred.

* get_prediction_params: se obtine vectorul coloana ce contine estimarile
parametrilor folositi la evaluare cu ajutorul formulei. Se calculeaza
inversa folosind descompunerea Cholesky

* get_prediction_params_iterative: asemanatoare functiei de mai sus, dar se
foloseste metoda gradientului conjugat

## Task 3: Generare de text

* distinct_k_secv si distinct_words: se returneaza k-secventele/cuvintele
sortate si unice

* k_secv: se formeaza k-secventele (corpus) prin parsarea tuturor cuvintelor
date ca input si concatenarea lor k cate k

* k_secv_idx: se creeaza un dictionar ce va contine asocierea cheie-valoare:
k-secventa-numarul ei de ordine, prin atribuirea fiecarei k-secvente un numar
intre 1 si dimensiunea vectorului tuturor k-secventelor

* word_idx: asemanatoare functiei de mai sus, singura diferenta fiind data de
faptul ca se creeaza un dictionar de cuvinte (cu aceeasi proprietate)

* stochastic_matrix: se creeaza matricea stochastica, numarul de linii al
acesteia fiind nr de k-secvente distincte si numarul de coloane, numarul de
cuvinte distincte. Se creeaza dictionare pentru k-secvente si cuvinte. Se
itereaza prin toate elementele vectorului de k-secvente, alegand k-secventa
curenta si cuvantul ce urmeaza dupa ea din corpus_words. Verificam daca acest
cuvant nu iese din dimensiunile vectorului cu toate cuvintele, apoi crestem
probabilitatea de aparitie a cuvantului dupa k-secventa curenta, in matricea
stocastica.

