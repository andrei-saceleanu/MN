function [w] = learn(X, y, lr, epochs)
  no_cols=size(X,2);
  w=0.2*rand(no_cols+1,1)-0.1;
  N=size(X,1);
  for i=1:no_cols
    X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
  endfor
  bias=ones(N,1);
  Xrond=[X bias];
  batch_size=64;
  z=zeros(N-length(y),1);
  y=[y;z];
  for epoch=1:epochs
    indexes=randperm(N,batch_size);
    X_batch=Xrond(indexes,:);
    y_batch=y(indexes);
    for i=1:no_cols+1
      s=(X_batch(1:batch_size,:)*w-y_batch(1:batch_size))'*X_batch(1:batch_size,i);
      w(i)=w(i)-(lr*s)/N;
    endfor
  endfor
endfunction
