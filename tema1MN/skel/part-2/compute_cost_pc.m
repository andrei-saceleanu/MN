function [cost] = compute_cost_pc(points, centroids)
N=size(points,1);
D=size(points,2);
NC=size(centroids,1);
min_dist=zeros(N,1);
  for i=1:N
    dist=zeros(1,NC);
    for j=1:NC
      dist(j)=norm(points(i,:)-centroids(j,:));
    endfor
    min_dist(i)=min(dist);
  endfor
  cost=sum(min_dist);
endfunction

