function [A, b] = generate_probabilities_system(rows)
  n=rows*(rows+1)/2;
b=zeros(n,1);
b(n-rows+1:n)=1;
X=zeros(rows,rows);
x=1;
for i=1:rows
    for j=1:i
        X(i,j)=x;
        x=x+1;
    endfor
endfor
A=zeros(n,n);
for i=1:rows
    for j=1:i
        if i==1 && j==1
            curr=X(i,j);
            A(curr,curr)=4;
            A(curr,X(i+1,j))=-1;
            A(curr,X(i+1,j+1))=-1;
        elseif i==rows && j==1
            curr=X(i,j);
            A(curr,curr)=4;
            A(curr,X(i-1,j))=-1;
            A(curr,X(i,j+1))=-1;
        elseif i==rows && j==rows
            curr=X(i,j);
            A(curr,curr)=4;
            A(curr,X(i-1,j-1))=-1;
            A(curr,X(i,j-1))=-1;
        elseif i==j && i~=1 && j~=rows
            curr=X(i,j);
            A(curr,curr)=5;
            A(curr,X(i-1,j-1))=-1;
            A(curr,X(i+1,j+1))=-1;
            A(curr,X(i,j-1))=-1;
            A(curr,X(i+1,j))=-1;
        elseif j==1 && i~=1 && i~=rows
            curr=X(i,j);
            A(curr,curr)=5;
            A(curr,X(i-1,j))=-1;
            A(curr,X(i,j+1))=-1;
            A(curr,X(i+1,j))=-1;
            A(curr,X(i+1,j+1))=-1;
        elseif i==rows && j~=1 && j~=i
            curr=X(i,j);
            A(curr,curr)=5;
            A(curr,X(i-1,j-1))=-1;
            A(curr,X(i,j+1))=-1;
            A(curr,X(i-1,j))=-1;
            A(curr,X(i,j-1))=-1;
        else
            curr=X(i,j);
            A(curr,curr)=6;
            A(curr,X(i-1,j-1))=-1;
            A(curr,X(i,j-1))=-1;
            A(curr,X(i+1,j))=-1;
            A(curr,X(i+1,j+1))=-1;
            A(curr,X(i,j+1))=-1;
            A(curr,X(i-1,j))=-1;
        endif
    endfor
 endfor
endfunction