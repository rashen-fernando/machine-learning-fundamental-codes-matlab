i = iris_dataset;

x=i.*i;
plot(1:150,x);
% ix0 = 1:50;
% ix1 = 51:100;
% ix2 = 101:150;
% 
% S  =cov(x');
% 
% 
% [V,D]   = eigs(S);
% 
% Y   = V'*x;
% 
% plot3(Y(1,ix0),Y(2,ix0),Y(3,ix0),'ro');hold on;
% plot3(Y(1,ix1),Y(2,ix1),Y(3,ix1),'bo');hold on;
% plot3(Y(1,ix2),Y(2,ix2),Y(3,ix2),'go');grid on;
% title('PCA on tanh x');
% axis equal;