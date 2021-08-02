load Yale_32x32;
x=fea';

c  = [1:15];
ix=[];
for i=1:15
    
    ix(:,i) = (i - 1)*11+1 : 11*i ; 
end

%mean of lth lass dropped but rest of the classes
m0=[];

for l=1:15
   c1 = setdiff(c,l);
   c2 = cat(2,ix(:,c1(1))',ix(:,c1(2))',ix(:,c1(3))',ix(:,c1(4))',ix(:,c1(5))',ix(:,c1(6))',ix(:,c1(7))',ix(:,c1(8))',ix(:,c1(9))',ix(:,c1(10))',ix(:,c1(11))',ix(:,c1(12))',ix(:,c1(13))',ix(:,c1(14))');
   m0(:,l)= mean(x(:,c2)')'; 
end
m=[];

for j=1:15
    m(:,j) = mean(x(:,ix(:,j))')';
end 


Sb = (m-m0)*(m-m0)';

Sw =[0];
for k = 1:15
    Sw =Sw +  10*cov(x(:,ix(:,k)')');
end

[V,D]   =   eigs(inv(Sw)*Sb,100);
Y       =   V'*x;

 plot3(Y(1,ix(:,1)'),Y(2,ix(:,1)'),Y(3,ix(:,1)'),'r*');hold on;  
 plot3(Y(1,ix(:,2)'),Y(2,ix(:,2)'),Y(3,ix(:,2)'),'b*');hold on;
 plot3(Y(1,ix(:,3)'),Y(2,ix(:,3)'),Y(3,ix(:,3)'),'g*');hold on;
 plot3(Y(1,ix(:,4)'),Y(2,ix(:,4)'),Y(3,ix(:,4)'),'m*');
 
 xlabel('eig 1');
ylabel('eig 2');
zlabel('delta range');
legend('person 1 ','person 2','person 3','person 4');
 %axis equal;
 grid on;
