function retval = gaussian_kernel (x, y, sigma)
  # aplic formula pentru gaussian kernel
  retval = exp(-(norm(x - y) ^ 2) / (2 * (sigma ^ 2)));
endfunction