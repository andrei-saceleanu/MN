function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  cats_path=strcat(path_to_testset,"cats/");
  not_cats_path=strcat(path_to_testset,"not_cats/");
  cat=getImgNames(cats_path);
  not_cat=getImgNames(not_cats_path);
  n1=size(cat,1);
  n2=size(not_cat,1);
  no_eval=n1+n2;
  for i=1:n1
    cats(i,:)=strcat(cats_path,cat(i,:));
  endfor
  for i=1:n2
    not_cats(i,:)=strcat(not_cats_path,not_cat(i,:));
  endfor
  count_correct=cast(0,"double");
 if strcmp(histogram,"RGB")==1
  for i=1:n1
    histo=rgbHistogram(cats(i,:),count_bins);
    pred=cast(w'*[histo 1]',"double");
    if pred>=0
      count_correct=count_correct+1;
    endif
  endfor
  for i=1:n2
    histo=rgbHistogram(not_cats(i,:),count_bins);
    pred=cast(w'*[histo 1]',"double");
    if pred<0
      count_correct=count_correct+1;
    endif
  endfor
else
  for i=1:n1
    histo=hsvHistogram(cats(i,:),count_bins);
    pred=cast(w'*[histo 1]',"double");
    if pred>=0
      count_correct=count_correct+1;
    endif
  endfor
  for i=1:n2
    histo=hsvHistogram(not_cats(i,:),count_bins);
    pred=cast(w'*[histo 1]',"double");
    if pred<0
      count_correct=count_correct+1;
    endif
  endfor
endif
  
  percentage=count_correct/no_eval;
endfunction