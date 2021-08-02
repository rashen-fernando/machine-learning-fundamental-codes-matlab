load Yale_32x32;
x=fea';

c  = [1:15];
c0 = 3;
c1 = setdiff(c,c0);

ix0 = (c0 - 1)*11+1 : 11*c0 ; 
ix1 = [];

for k=1:length(c1)
    ix1 = [ix1 (c1(k) - 1)*11+1 : 11*c1(k)];
end

Nc0 = length(ix0);
Nc1 = length(ix1);

m  = mean(x')';
m0 = mean(x(:,ix0)')';
m1 = mean(x(:,ix1)')';

%interclass scatter - goal is to maxximize this
Sb = (m0-m1) * (m0-m1)';

%inclassScatter - goal is to minimize this
S0 = (Nc0-1)*cov(x(:,ix0)');
S1 = (Nc1-1)*cov(x(:,ix1)');
Sw = S0+S1;

[V,D] = eigs(inv(Sw)*Sb);
Y = V' * x;

plot(Y(1,ix0),Y(2,ix0),'r*');hold on;
plot(Y(1,ix1),Y(2,ix1),'b*');hold on;

