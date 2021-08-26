load 'Yale_32x32.mat';
x = fea';
p1=reshape(fea(1,:),[32,32]);



y1=fft2(p1);

val =16;
lparr = ones(val);
lpfilt= padarray(lparr,[(32-val)/2 (32-val)/2],'both');
filteredface=fftshift(abs(y1)).*lpfilt;
filtFaceTdomain = ifft2(ifftshift(filteredface),32,32);



f1=figure;
f2=figure;
f3=figure;
f4=figure;
f5=figure;

figure(f1); %plot the person
imshow(p1,[]);
title('plot the person');

figure(f2);%fourier data plot
mesh(abs(fftshift(y1)));
title('fourier data plot');

figure(f3);%plot filter
mesh(lpfilt);
title('plot filter');

figure(f4); %fourirer of the filtered face
mesh(filteredface);
title('fourirer of the filtered face');

figure(f5); %image of filtered face
imshow(filtFaceTdomain,[]);
title('image of filtered face');
