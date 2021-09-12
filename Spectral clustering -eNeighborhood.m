load Yale_32x32;
x=fea';
R = cov(x');
[V,D] = eigs(R);
Y = V'*x;
%Y=x;
% plot3(Y(1,1:11),Y(2,1:11),Y(3,1:11),'b*');hold on;plot3(Y(1,12:165),Y(2,12:165),Y(3,12:165),'r*');

W = zeros(size(Y,2));
P=[];
e=.5;
for i=1:size(Y,2)
    for j=i:size(Y,2)
        a = Y(:,i)-Y(:,j); 
        if((a'*a)/(10^6)<e)
            W(i,j)=1;
        else
            W(i,j)=0;
        end
        W(j,i)=W(i,j);
    end
    P = [P sum(W(i,:))];
end
%imshow(W);hold on;title(['adjacency matrix of yale data set - neighborhood graph (e = ',num2str(e),')/PCA is applied'])
Degree_matrix = diag(P);
Lap = Degree_matrix - W;
[l,d] = eigs(Lap,165);

S=diag(d);
bar(S);hold on;title(['eigen values for e = ',num2str(e)]);
[i,g]=max(abs(diff(S)));


bar(l(:,g));hold on;title([num2str(g),'th eigan vector for e = ',num2str(e)])
plot3(l(1:11,g),l(1:11,g-1),l(1:11,g-2),'*');hold on;
plot3(l(12:22,g),l(12:22,g-1),l(12:22,g-2),'*');hold on;
plot3(l(23:33,g),l(23:33,g-1),l(23:33,g-2),'*');hold on;
plot3(l(34:44,g),l(34:44,g-1),l(34:44,g-2),'*');hold on;
plot3(l(45:55,g),l(45:55,g-1),l(45:55,g-2),'*');hold on;
plot3(l(56:66,g),l(56:66,g-1),l(56:66,g-2),'*');hold on;
plot3(l(67:77,g),l(67:77,g-1),l(67:77,g-2),'*');hold on;
plot3(l(78:88,g),l(78:88,g-1),l(78:88,g-2),'*');hold on;
plot3(l(89:99,g),l(89:99,g-1),l(89:99,g-2),'*');hold on;
plot3(l(100:110,g),l(100:110,g-1),l(100:110,g-2),'*');hold on;
plot3(l(111:121,g),l(111:121,g-1),l(111:121,g-2),'*');hold on;
plot3(l(122:132,g),l(122:132,g-1),l(122:132,g-2),'*');hold on;
plot3(l(133:143,g),l(133:143,g-1),l(133:143,g-2),'*');hold on;
plot3(l(144:154,g),l(144:154,g-1),l(144:154,g-2),'*');hold on;
plot3(l(155:165,g),l(155:165,g-1),l(155:165,g-2),'*');hold on;grid on;
legend('cluster 1','cluster 2','cluster 3','cluster 4','cluster 5','cluster 6','cluster 7','cluster 8','cluster 9','cluster 10','cluster 11','cluster 12','cluster 13','cluster 14','cluster 15');hold on;title(['eigan vector = ',num2str(g)]);