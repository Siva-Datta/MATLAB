function [n,signal]=phone_pad(k);

N=204; 
n=0:N-1;
fs=8192; 
F_c=[697;770;852;941]*ones(1,4);
F_c=F_c';F_c=F_c(:)';
F_r=[1209;1336;1477;1633]*ones(1,4);
F_r=F_r(:)';
F=2*pi/fs*[F_c;F_r];
switch k
case {1,2,3}
signal=cos(F(:,k)*n);
signal=sum(signal);
signal=[signal zeros(size(signal))];
case 'A'
signal=cos(F(:,4)*n);
signal=sum(signal);
signal=[signal zeros(size(signal))];
case {4,5,6}
signal=cos(F(:,k+1)*n);
signal=sum(signal);
signal=[signal zeros(size(signal))];
case {7,8,9}
signal=cos(F(:,k+2)*n);
signal=sum(signal);
signal=[signal zeros(size(signal))];

case 'B'
signal=cos(F(:,8)*n);
signal=sum(signal);
signal=[signal zeros(size(signal))];
case '*'
signal=cos(F(:,13)*n);
signal=sum(signal);
signal=[signal zeros(size(signal))];
case '#'
    signal=cos(F(:,15)*n);
    signal=sum(signal);
    signal=[signal zeros(size(signal))];
case 'D'
    signal=cos(F(:,16)*n);
    signal=sum(signal);
    signal=[signal zeros(size(signal))];
case 'C'
    signal=cos(F(:,12)*n);
    signal=sum(signal);
    signal=[signal zeros(size(signal))];
case 0   
    signal=cos(F(:,14)*n);
    signal=sum(signal);
    signal=[signal zeros(size(signal))];
    
otherwise disp('Unknown digit')
end
signal=signal';

figure(2);
subplot(2,2,1)
plot(signal)
axis([0 205 -2 2]);
title(['signal']);
n=1:size(signal,1);
n1=204;
y1 = fft(signal,n1);         %taking fft of the signal
y1 = fftshift(y1);      %fft shift to get in -fs to +fs range
m1 = abs(y1);   
subplot(2,2,3)
plot(m1)
%axis([0 205 -2 2]);
title(['FFT of signal']);


no=1.5*(rand(size(signal))-0.5);
noise_signal=signal+no;
subplot(2,2,2)
plot(noise_signal)
axis([0 205 -2 2]);
title(['noise + signal']);

y2 = fft(noise_signal,n1);         %taking fft of the signal
y2 = fftshift(y2);      %fft shift to get in -fs to +fs range
m2 = abs(y2);   
subplot(2,2,4)
plot(m2)
%axis([0 205 -2 2]);
title(['FFT of noise+signal']);




