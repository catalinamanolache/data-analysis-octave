function retval = polynomial_kernel (x, y, d)
  # aplic formula pentru gaussian kernel
  retval = (1 + x * y') ^ d;
endfunction
