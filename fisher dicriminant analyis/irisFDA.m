x = iris_dataset;

ix0 = 1:50;
ix1 = 51:150;

m0  = mean(x(:,ix0)')';
m1  = mean(x(:,ix1)')';
Sb  = (m0-m1)*(m0-m1)';

S0  = 49*cov(x(:,ix0)');
S1  = 99*cov(x(:,ix1)');
Sw  = S0+S1;

[V,D]   = eigs(inv(Sw)*Sb);

Y   = V'*x;

plot(Y(1,ix0),Y(2,ix0),'ro');hold on;
plot(Y(1,ix1),Y(2,ix1),'bo');grid on;
title('FDA - Iris two class');
axis equal;


