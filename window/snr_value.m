clc
clear all
close all
N=128;
n = 0:1:N-1;
wc=pi*0.5;
w1=linspace(-pi,pi,1024);
c=0;
for j=[64]
    c=c+1;
    k=(j-1)/2;
    for i=1:j
        if i==k
            hd5(i)=wc/pi;
        else    
            hd5(i)=sin(wc*(i-k))/(pi*(i-k));
        end
    end;
    
    for i=1:j
        bw(i)=0.42-0.5*cos(2*pi*i/(j-1))+0.08*cos(4*pi*i/(j-1));
    end;
    h5=hd5.*bw;
    H5=freqz(h5,1,w1);
    %subplot(3,1,c);
    %plot(abs(H5));
    %axis([0 1000 -0.1 1.1]);
    %title(['Blackmnan Windowed N =',num2str(j)]);
end;   
n1=258;
n=0:1:n1;
x=sin(0.5*wc*n)+sin(1.5*wc*n);
y1 = fft(x,n1);         %taking fft of the signal
y1 = fftshift(y1);      %fft shift to get in -fs to +fs range
m1 = abs(y1);        %absolute value / n
figure(1);
subplot(3,1,1);
plot(x);
title('Signal with two sinusoids');
subplot(3,1,2);
plot(m1);
title('DFT of Signal with only two sinusoids');

fin= filter(h5,1,x);
y2 = fft(fin,n1);         %taking fft of the signal
y2 = fftshift(y2);      %fft shift to get in -fs to +fs range
m2 = abs(y2)/n1;        %absolute value / n
subplot(3,1,3);
plot(m2);
title('DFT of Filtered signal');

no=1.5*(rand(size(x))-0.5);
yn=x+no;
figure(2);
subplot(3,1,1);
plot(yn);
title('NOise + Signal with two sinusoids');
subplot(3,1,2);
plot(m1);
title('DFT of Noise + Signal with only two sinusoids');

nfin= filter(h5,1,yn);
yn2 = fft(nfin,n1);         %taking fft of the signal
yn2 = fftshift(yn2);      %fft shift to get in -fs to +fs range
mn2 = abs(yn2)/n1;        %absolute value / n
subplot(3,1,3);
plot(mn2);
title('DFT of Filtered signal+noise');

snr(nfin,nfin-fin)
