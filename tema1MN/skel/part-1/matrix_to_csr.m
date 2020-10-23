function [values, colind, rowptr] = matrix_to_csr(A)
    n=nnz(A);
    rows=size(A,1);
    cols=size(A,2);
    values=zeros(n,1);
    colind=zeros(n,1);
    rowptr=zeros(rows+1,1);
    valueindex=1;
    rowindex=1;
    seen=0;
    for i=1:rows
        for j=1:cols
            if A(i,j)~=0
                values(valueindex)=A(i,j);
                colind(valueindex)=j;
                if seen==0
                    rowptr(rowindex)=valueindex;
                    rowindex=rowindex+1;
                    seen=1;
                endif
                valueindex=valueindex+1;
            endif
        endfor
        seen=0;
    endfor
    rowptr(rowindex)=n+1;
    values=values';
    rowptr=rowptr';
    colind=colind';

endfunction