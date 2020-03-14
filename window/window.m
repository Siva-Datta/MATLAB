clc
clear all
close all
N=128;
n = 0:1:N-1;
wc=pi*0.5;
w1=linspace(-pi,pi,1024);
k=(8-1)/2;
for i=1:8
    if i==k
        hd8(i)=wc/pi;
    else    
        hd8(i)=sin(wc*(i-k))/(pi*(i-k));
    end
end;
k=(64-1)/2;
for i=1:64
    if i==k
        hd64(i)=wc/pi;
    else    
        hd64(i)=sin(wc*(i-k))/(pi*(i-k));
    end
end;
%t=0:1/1:length(H1)-1;
figure(1);
c=0;
for j=[8 64 512]
    c=c+1;
    k=(j-1)/2;
    for i=1:j
        if i==k
            hd1(i)=wc/pi;
        else    
            hd1(i)=sin(wc*(i-k))/(pi*(i-k));
        end
    end;
    
    rw=ones(1,j);
    h1=hd1.*rw;
    H1=freqz(h1,1,w1);
    subplot(3,1,c);
    plot(abs(H1));
    axis([0 1000 -0.1 1.1]);
    title(['Rectangular Windowed N =',num2str(j)]);
end;    

figure(2);
c=0;
for j=[8 64 512]
    c=c+1;
    
    k=(j-1)/2;
    for i=1:j
        if i==k
            hd2(i)=wc/pi;
        else    
            hd2(i)=sin(wc*(i-k))/(pi*(i-k));
        end
    end;
    

    %triangular window
    for i=1:j
        tw(i)=1-2*[i-(j-1)/2]/(j-1);
    end;

    h2=hd2.*tw;
    H2=freqz(h2,1,w1);
    subplot(3,1,c);
    plot(abs(H2));
    axis([0 1000 -0.1 1.1]);
    title(['Triangular Windowed N =',num2str(j)]);
end;

figure(3);
c=0;
for j=[8 64 512]
    c=c+1;
    k=(j-1)/2;
    for i=1:j
        if i==k
            hd3(i)=wc/pi;
        else    
            hd3(i)=sin(wc*(i-k))/(pi*(i-k));
        end
    end;
    
    for i=1:j
        hnw(i)=0.5-0.5*cos(2*pi*i/(j-1));
    end;
    h3=hd3.*hnw;
    H3=freqz(h3,1,w1);
    subplot(3,1,c);
    plot(abs(H3));
    axis([0 1000 -0.1 1.1]);
    title(['Hanning Windowed N =',num2str(j)]);
end;

figure(4);
c=0;
for j=[8 64 512]
    c=c+1;
    k=(j-1)/2;
    for i=1:j
        if i==k
            hd4(i)=wc/pi;
        else    
            hd4(i)=sin(wc*(i-k))/(pi*(i-k));
        end
    end;
    
    for i=1:j
        hmw(i)=0.54-0.46*cos(2*pi*i/(j-1));
    end;
    h4=hd4.*hmw;
    H4=freqz(h4,1,w1);
    subplot(3,1,c);
    plot(abs(H4));
    axis([0 1000 -0.1 1.1]);
    title(['Hamming Windowed N =',num2str(j)]);
   
end;

figure(5);
c=0;
for j=[8 64 512]
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
    subplot(3,1,c);
    plot(abs(H5));
    axis([0 1000 -0.1 1.1]);
    title(['Blackmnan Windowed N =',num2str(j)]);
end;    

figure(6);
n8 = 0:1:8-1;
subplot(3,1,1);
stem(n8,hd8);
axis([0 8 -0.2 0.5]);
title(['hd for N=8']);

subplot(3,1,2);
n64 = 0:1:64-1;

stem(n64,hd64);
axis([0 64 -0.2 0.5]);
title(['hd for N=64']);

subplot(3,1,3);
n512 = 0:1:512-1;
stem(n512,hd5);
axis([0 512 -0.2 0.5]);
title(['hd for N=512']);
sgtitle('LPF');
%{
y1 = fft(x,n1);         %taking fft of the signal
y1 = fftshift(y1);      %fft shift to get in -fs to +fs range
m1 = abs(y1)/n1;        %absolute value / n
f1 = (-length(y1)/2:length(y1)/2-1)*fs/length(y1);
figure(7);
subplot(2,1,1);
stem(f1,m1);
title('DFT of Signal with only two sinusoids');

fin=conv(h5,x);

y2 = fft(fin,n1);         %taking fft of the signal
y2 = fftshift(y2);      %fft shift to get in -fs to +fs range
m2 = abs(y2)/n1;        %absolute value / n
f2 = (-length(y2)/2:length(y2)/2-1)*fs/length(y2);
subplot(2,1,2);
stem(f2,m2);
title('DFT of Filtered signal');
%}

