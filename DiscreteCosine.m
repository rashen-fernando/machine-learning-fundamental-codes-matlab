load 'Yale_32x32.mat';
x = fea';

d=dct(x(:,1));
d2=d;
d2(500:1024)=0;

y=idct(d2);

plot(y);hold on;
plot(x(:,1));
legend('dct_signal','original_signal');

