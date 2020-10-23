function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  x0=zeros(length(c),1);
  while 1
    a=csr_multiplication(G_values,G_colind,G_rowptr,x0);
    x=a+c;
    if norm(x-x0)<tol
      break;
    endif
    x0=x;
  endwhile
endfunction