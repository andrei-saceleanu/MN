function [sol] = rgbHistogram(path_to_image, count_bins)
  img=imread(path_to_image);
  red=vec(img(:,:,1));
  green=vec(img(:,:,2));
  blue=vec(img(:,:,3));
  sol=zeros(3*count_bins,1);
  edges=zeros(count_bins+1,1);
  edges=(0:count_bins)*256/count_bins;
  x1=histc(red,edges);
  x2=histc(green,edges);
  x3=histc(blue,edges);
  n1=x1(1:length(x1)-1);
  n2=x2(1:length(x2)-1);
  n3=x3(1:length(x3)-1);
  sol=[n1;n2;n3]';
end