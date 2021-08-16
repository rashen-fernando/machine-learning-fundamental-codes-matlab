x=iris_dataset;
x = x(3:4,:);

min_neighbor_distance = .08;
min_neighbors_core = 5;

N = size(x,2);
core_pts = [];
C=[];

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

%boundary points
boundary_pts = [];
for i=1:N
    if(~sum(find(core_pts==i)))
    d = x - x(1:2,i);
    d =  (d(1,:).^2 + d(2,:).^2)';
    neighbors = setdiff(find(d<min_neighbor_distance),i);
        if (length(neighbors)>length(setdiff(neighbors,core_pts)))
        boundary_pts = [boundary_pts i];   
        end
    end
end
plot(x(1,core_pts),x(2,core_pts),'ro');hold on;
plot(x(1,boundary_pts),x(2,boundary_pts),'bo');
plot(x(1,setdiff(1:150,[boundary_pts core_pts])),x(2,setdiff(1:150,[boundary_pts core_pts])),'bx');
legend('core points','boundary points','outliers');