function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  cats_path=strcat(path_to_testset,"cats/");
  not_cats_path=strcat(path_to_testset,"not_cats/");
  cat=getImgNames(cats_path);
  not_cat=getImgNames(not_cats_path);
  n1=size(cat,1);
  n2=size(not_cat,1);
  no_eval=n1+n2;
  N=n1+n2;
  for i=1:n1
    cats(i,:)=strcat(cats_path,cat(i,:));
  endfor
  for i=1:n2
    not_cats(i,:)=strcat(not_cats_path,not_cat(i,:));
  endfor
  count_correct=cast(0,"double");
  sz=1;
 if strcmp(histogram,"RGB")==1
  for i=1:n1
    histo=rgbHistogram(cats(i,:),count_bins);
    X(sz,:)=histo;
    sz=sz+1;
  endfor
  for i=1:n2
    histo=rgbHistogram(not_cats(i,:),count_bins);
    X(sz,:)=histo;
    sz=sz+1;
  endfor
  for i=1:3*count_bins
    X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
  endfor
  bias=ones(N,1);
  Xrond=[X bias];
  pred=w'*Xrond';
  count_correct=count_correct+nnz(pred(1:n1)>=0);
  count_correct=count_correct+nnz(pred(n1+1:N)<0);
else
  for i=1:n1
    histo=hsvHistogram(cats(i,:),count_bins);
    X(sz,:)=histo;
    sz=sz+1;
  endfor
  for i=1:n2
    histo=hsvHistogram(not_cats(i,:),count_bins);
    X(sz,:)=histo;
    sz=sz+1;
  endfor
  for i=1:3*count_bins
    X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
  endfor
  bias=ones(N,1);
  Xrond=[X bias];
  pred=w'*Xrond';
  count_correct=count_correct+nnz(pred(1:n1)>=0);
  count_correct=count_correct+nnz(pred(n1+1:N)<0);
endif
percentage=count_correct/no_eval;
endfunction