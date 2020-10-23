function [w] = learn(X, y)
  N=size(X,1);
  bias=ones(N,1);
  Xrond=[X bias];
  [Q R]=Householder(Xrond);
  z=zeros(N-length(y),1);
  y=[y;z];
  yy=Q'*y;
  w=SST(R,yy);
end
