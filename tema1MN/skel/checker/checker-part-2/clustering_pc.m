function [centroids] = clustering_pc(points, NC)
D=size(points,2);
prev_centroids=zeros(NC,D);
N=size(points,1);
for i=1:NC
    indices=i:NC:N;
    current_cluster=points(indices,:);
    no_points=size(current_cluster,1);
    if no_points==1
       prev_centroids(i,:)=current_cluster;
    else
       prev_centroids(i,:)=mean(current_cluster);
    endif
endfor

while 1
  indexes=zeros(N,1);
  for i=1:N
    dist=zeros(1,NC);
    for j=1:NC
      dist(j)=norm(points(i,:)-prev_centroids(j,:));
    endfor
    [~,index]=min(dist);
    indexes(i)=index;
  endfor
  centroids=zeros(NC,D);
  for i=1:NC
      po=points(indexes==i,:);
      no_points=size(po,1);
      if no_points>1
        centroids(i,:)=mean(points(indexes==i,:));
      else
        centroids(i,:)=po;
      endif
  endfor
  if norm(centroids-prev_centroids)<1e-5
    break;
  endif
  prev_centroids=centroids;
endwhile
endfunction
