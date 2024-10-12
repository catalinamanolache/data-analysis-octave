function [x] = conjugate_gradient (A, b, x0, tol, max_iter) 
  # metoda gradientului conjugat
  r = b - A * x0;
  v = r;
  x = x0;
  tol_sq = tol ^ 2;
  k = 1;

  while k < max_iter && ((r' * r) > tol_sq)
    tk = (r' * r)/(v' * A * v);
    x = x + tk * v;
    r_k = r - tk * A * v;
    sk = (r_k' * r_k)/(r' * r);
    v = r_k + sk * v;
    r = r_k;
    k++;
  endwhile
endfunction