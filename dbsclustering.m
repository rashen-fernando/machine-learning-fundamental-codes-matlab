x=iris_dataset;
x = x(3:4,:);

min_neighbor_distance = .08;
min_neighbors_core = 14;

N = size(x,2);
core_pts = [];


for i=1:N
    d = x - x(1:2,i);
    d =  (d(1,:).^2 + d(2,:).^2)';
    neighbors = setdiff(find(d<min_neighbor_distance),i);
    %C = [C neighbors];
    %core points
    if(length(neighbors) > min_neighbors_core)
       core_pts=[core_pts i];
    end
end


C=[];
k=0;
ix =[];
for i=core_pts
    d = x(:,core_pts) - x(1:2,i);
    d =  (d(1,:).^2 + d(2,:).^2)';
    neighbors = find(d<min_neighbor_distance);
    
    if(  sum(ismember(C,neighbors)) >  1   )
        ix = [ix k];
    else
        k=k+1;
        ix = [ix k];
        
    end
   
    C = neighbors;
   
end



cluster = zeros(1,150);
L=1;
for i=core_pts
    cluster(1,i)=ix(1,L);
    L=L+1;
end
%boundary points
boundary_pts = [];

for i= setdiff(1:150,core_pts)

    d = x - x(1:2,i);
    d =  (d(1,:).^2 + d(2,:).^2)';
    neighbors = setdiff(find(d<min_neighbor_distance),i);
         if ( ~isempty( intersect(neighbors,core_pts) ) )
             
         boundary_pts = [boundary_pts i];
         
         cluster(1,i) = round( sum(cluster( 1,intersect(neighbors,core_pts) ))/ length( intersect(neighbors,core_pts) ) ) ;
        end

end

gscatter(x(1,:),x(2,:),cluster);hold on;
legend('outliers','cluster 1','cluster 2');