function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  cats_path=strcat(path_to_dataset,"cats/");
  not_cats_path=strcat(path_to_dataset,"not_cats/");
  cats=getImgNames(cats_path);
  not_cats=getImgNames(not_cats_path);
  n1=size(cats,1);
  n2=size(not_cats,1);
  M=3*count_bins;
  N=n1+n2;
  X=zeros(N,M);
  y=zeros(N,1);
  sz=1;
  if strcmp(histogram,"RGB")==1
    for i=1:n1
      histo=rgbHistogram(strcat(cats_path,cats(i,:)),count_bins);
      X(sz,:)=histo;
      sz=sz+1;
    endfor
    for i=1:n2
      histo=rgbHistogram(strcat(not_cats_path,not_cats(i,:)),count_bins);
      X(sz,:)=histo;
      sz=sz+1;
    endfor
    y(1:n1)=1;
    y(n1+1:N)=-1;
  else
    for i=1:n1
      histo=hsvHistogram(strcat(cats_path,cats(i,:)),count_bins);
      X(sz,:)=histo;
      sz=sz+1;
    endfor
    for i=1:n2
      histo=hsvHistogram(strcat(not_cats_path,not_cats(i,:)),count_bins);
      X(sz,:)=histo;
      sz=sz+1;
    endfor
    y(1:n1)=1;
    y(n1+1:N)=-1;
  endif

endfunction
