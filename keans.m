
x=iris_dataset;
x=x(3:4,:);

clsses=[ones(1,50) 2*ones(1,50) 3*ones(1,50)];
gscatter(x(1,:),x(2,:),clsses); hold on;

N = size(x,2);
k=3;
ix = randi(k,1,N);

for i=1:10
    C=[];
    D=[];
    gscatter(x(1,:),x(2,:),ix); hold on;
    for p=1:k
        ixd = find(ix==p);
        if (~isempty(ixd))
        mC = mean(x(:,ixd)');
        d = x-mC';
        d = d(1,:).^2+d(2,:).^2;
        D = [D;d];
        C = [C;mC];
        plot(mC(1),mC(2),'ko');
        end
    end
    
    [m,ix]=min(D);
    hold off;
    drawnow;
    pause;
end
