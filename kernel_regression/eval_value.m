function pred = eval_value(x, X, f, f_param, a)
   # intializez vectorul coloana pentru a calcula kernelul
   m = length(a);
   K = zeros(m, 1);

   for i = 1:m
   # calculez kernelul folosind fiecare linie din X si vectorul de input x
   # si functia din enunt impreuna cu parametrul sau
      K(i) = f(X(i, :), x, f_param);
   endfor

   pred = 0;
   for i = 1 : m
   # caclulez pred folosind formula, ca suma dintre fiecare element al lui a
   # si fiecare element din kernel
      pred += (a(i) * K(i));
   endfor
endfunction