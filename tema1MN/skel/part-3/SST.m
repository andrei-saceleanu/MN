function [x] = SST(A, b)
  n=size(A,1);
  m=size(A,2);
  x=zeros(m,1);
  x(m)=b(m)/A(m,m);
  for i=m-1:-1:1
    x(i)=(b(i)-A(i,i+1:m)*x(i+1:m))/A(i,i);
  endfor
end
    