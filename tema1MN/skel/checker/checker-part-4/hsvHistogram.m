function [sol] = hsvHistogram(path_to_image, count_bins)
  img=imread(path_to_image);
  hsvimg=rgb2hsv(img);
  hue=vec(hsvimg(:,:,1));
  sat=vec(hsvimg(:,:,2));
  value=vec(hsvimg(:,:,3));
  sol=zeros(3*count_bins,1);
  edges=zeros(count_bins+1,1);
  edges=((0:count_bins)*101/(count_bins*100));
  x1=histc(hue,edges);
  x2=histc(sat,edges);
  x3=histc(value,edges);
  n1=x1(1:length(x1)-1);
  n2=x2(1:length(x2)-1);
  n3=x3(1:length(x3)-1);
  sol=[n1;n2;n3]';
end