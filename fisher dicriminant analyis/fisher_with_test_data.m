load Yale_32x32;
x=fea';

c  = [1:15];
ix=[];
for i=1:15
    
    ix(:,i) = (i - 1)*11+1 : 11*i-2 ; 
end

%mean of pth class dropped but rest of the classes included forr claculting
%mean
m0=[];

for p=1:15
   c1 = setdiff(c,p);
   c2 = cat(2,ix(:,c1(1))',ix(:,c1(2))',ix(:,c1(3))',ix(:,c1(4))',ix(:,c1(5))',ix(:,c1(6))',ix(:,c1(7))',ix(:,c1(8))',ix(:,c1(9))',ix(:,c1(10))',ix(:,c1(11))',ix(:,c1(12))',ix(:,c1(13))',ix(:,c1(14))');
   m0(:,p)= mean(x(:,c2)')'; 
   
end

m=[];
for j=1:15
    m(:,j) = mean(x(:,ix(:,j)')')';
end 




Sb = (m-m0)*(m-m0)';

Sw =[0];
for k = 1:15
    Sw =Sw +  10*cov(x(:,ix(:,k)')');
end

[V,D]   =   eigs(inv(Sw)*Sb);
Y       =   V'*x;

test    =   V'*x(:,[10:11 21:22]); %1 and second person samples
plot3(Y(1,ix(:,1)'),Y(2,ix(:,1)'),Y(3,ix(:,1)'),'r*');hold on;  
 plot3(Y(1,ix(:,2)'),Y(2,ix(:,2)'),Y(3,ix(:,2)'),'b*');hold on;
 plot3(test(1,1),test(2,1),test(3,1),'ro');hold on;
 plot3(test(1,2),test(2,2),test(3,2),'ro');hold on;
 xlabel('eig 1');
ylabel('eig 2');
zlabel('delta range');
legend('person 1 train ','person 2 train','person 1 test','person 1 test');
 %axis equal;
 grid on;
