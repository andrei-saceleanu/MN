function [Q R]=gram_schmidt(A)
  %factorizare QR Gram Schmidt
  [m n]=size(A);
  Q=zeros(m,n);
  R=zeros(n,n);
  for j=1:n
    aux=A(:,j);
    for i=1:j-1
      R(i,j)=Q(:,i)'*A(:,j);
      aux=aux-R(i,j)*Q(:,i);
    endfor
    R(j,j)=norm(aux);
    Q(:,j)=aux/R(j,j);
  endfor
endfunction
