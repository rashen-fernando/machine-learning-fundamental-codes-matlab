i = iris_dataset;

x=i.*i;
ix0 = 1:50;
ix1 = 51:100;
ix2 = 101:150;

m   = mean(x')';
m0  = mean(x(:,ix0)')';
m1  = mean(x(:,ix1)')';
m2  = mean(x(:,ix2)')';
Sb  = (m0-m)*(m0-m)' + (m1-m)*(m1-m)' + (m2-m)*(m2-m)';

S0  = 49*cov(x(:,ix0)');
S1  = 49*cov(x(:,ix1)');
S2  = 49*cov(x(:,ix2)');
Sw  = S0+S1+S2;

[V,D]   = eigs(inv(Sw)*Sb);

Y   = V'*x;


plot3(Y(1,ix0),Y(2,ix0),Y(3,ix0),'ro');hold on;
plot3(Y(1,ix1),Y(2,ix1),Y(3,ix1),'bo');hold on;
plot3(Y(1,ix2),Y(2,ix2),Y(3,ix2),'go');grid on;
title('FDA on  x^2');
axis equal;