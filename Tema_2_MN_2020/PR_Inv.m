function B = PR_Inv(A)
  %calcul inversa cu ajutorul factorizari QR de tip Gram Schmidt
   [Q R]=gram_schmidt(A);
   Q=Q';
   n=size(R,1);
   B=zeros(n);
   for i=1:n
     B(:,i)=SST(R,Q(:,i));%obtinere coloana ca solutie a sistemului
     % T*xi=ei unde T a fost factorizat T=Q*R
   endfor
endfunction
