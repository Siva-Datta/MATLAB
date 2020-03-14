voices = string({'Morning1.wav','Morning2.wav','Morning3.wav','Lunch1.wav','Lunch2.wav','Lunch3.wav','morning1p.wav','morning2p.wav','morning3p.wav','Lunchp1.wav','Lunchp2.wav','Lunchp3.wav','morning1pj.wav','morning2pj.wav','morning3pj.wav','afternoon1pj.wav','afternoon2pj.wav','afternoon3pj.wav'});
%rectangular window

N = 1024*2*2*2*2+1;
No = 20;
for k = 1:N
    m = k-1;
    w1(k) = 1; 
end

%triangular window
for k = 1:N
    m = k-1;
    w2(k) = 1-2*(m- (N-1)/2)/(N-1);
end

%hanning window
for k = 1:N
    m = k-1;
    w3(k) = 0.5-0.5*cos(2*pi*m/(N-1));
end

%hamming window
for k = 1:N
    m = k-1;
    w4(k) = 0.54 - 0.46*cos(2*pi*m/(N-1));
end

%blackmann window
for k = 1:N
    m = k-1;
    w5(k) = 0.42-0.5*cos(2*pi*m/(N-1))+0.08*cos(4*pi*m/(N-1)); 
end

h = zeros([No,N]);
for i = 1:No
    h(i,1:N) = mysincB(pi/(2*No),N,(2*i-1)*pi/(2*No)).*w3;
    w = linspace(-pi,pi,512);
    H=freqz(h(i,1:N),1,w);
    hold on;
    plot(w,abs(H));
end




figure(2);
[sm1,Fs] = audioread('Morning1.wav');
S1 = fft(sm1);
S = fftshift(S1);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(231);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('Mayank morning 1');
[sm2,Fs] = audioread('Morning2.wav');
S2 = fft(sm2);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(232);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('Mayank morning 2');

[sm3,Fs] = audioread('Morning3.wav');
S2 = fft(sm3);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(233);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('Mayank morning 3');
[sm4,Fs] = audioread('Lunch1.wav');
S2 = fft(sm4);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(234);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('Mayank Afternoon 1');
[sm5,Fs] = audioread('Lunch2.wav');
S2 = fft(sm5);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(235);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('Mayank Afternoon 2');
[sm6,Fs] = audioread('Lunch3.wav');
S2 = fft(sm6);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(236);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('Mayank Afternoon 3');

%prerana fft
figure(3)
[sm7,Fs] = audioread('morning1p.wav');
S2 = fft(sm7);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(231);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('prerana morning 1');

[sm8,Fs] = audioread('morning2p.wav');
S2 = fft(sm8);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(232);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('prerana morning 2');

[sm9,Fs] = audioread('morning1p.wav');
S2 = fft(sm9);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(233);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('prerana morning 3');

[sm10,Fs] = audioread('Lunchp1.wav');
S2 = fft(sm10);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(234);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('prerana Afternoon 1');

[sm11,Fs] = audioread('Lunchp2.wav');
S2 = fft(sm11);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(235);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('prerana Afternoon 2');

[sm12,Fs] = audioread('Lunchp3.wav');
S2 = fft(sm12);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(236);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('prerana Afternoon 3');

[sm13,Fs] = audioread('morning1pj.wav');
S2 = fft(sm13);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
figure(4);
subplot(231);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('poojitha morning 1');

[sm14,Fs] = audioread('morning2pj.wav');
S2 = fft(sm14);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(232);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('poojitha morning 2');

[sm15,Fs] = audioread('morning3pj.wav');
S2 = fft(sm15);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(233);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('poojitha morning 3');

[sm16,Fs] = audioread('afternoon1pj.wav');
S2 = fft(sm16);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(234);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('poojitha afternoon 1');

[sm17,Fs] = audioread('afternoon2pj.wav');
S2 = fft(sm17);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(235);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('poojitha afternoon 2');

[sm18,Fs] = audioread('afternoon3pj.wav');
S2 = fft(sm18);
S = fftshift(S2);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
subplot(236);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('poojitha afternoon 3');


eng = zeros([length(voices),No]);

for i=1:length(voices)
    [s,Fs] = audioread(char(voices(1,i)));
    y = zeros([No,N+length(s)-1]);
    for j = 1:No
        y(j,1:N+length(s)-1) = conv(h(j,1:N),s);
    end
    for j = 1:No
        eng(i,j) = sigeng(y(j,1:N+length(s)-1))/sigeng(s);
    
    end
   
end

% eucm1p1 = sqrt(sum(((eng(1,1:No) - eng(4,1:No)) .^ 2)));
% eucm1p2 = sqrt(sum(((eng(1,1:No) - eng(5,1:No)) .^ 2)));
% eucm1p3 = sqrt(sum(((eng(1,1:No) - eng(6,1:No)) .^ 2)));
% eucm2p1 = sqrt(sum(((eng(2,1:No) - eng(4,1:No)) .^ 2)));
% eucm2p2 = sqrt(sum(((eng(2,1:No) - eng(5,1:No)) .^ 2)));
% eucm2p3 = sqrt(sum(((eng(2,1:No) - eng(6,1:No)) .^ 2)));
% eucm3p1 = sqrt(sum(((eng(3,1:No) - eng(4,1:No)) .^ 2)));
% eucm3p2 = sqrt(sum(((eng(3,1:No) - eng(5,1:No)) .^ 2)));
% eucm3p3 = sqrt(sum(((eng(3,1:No) - eng(6,1:No)) .^ 2)));
%  eucm12 = sqrt(sum(((eng(1,1:No) - eng(2,1:No)) .^ 2)));
%  eucm13 = sqrt(sum(((eng(1,1:No) - eng(3,1:No)) .^ 2)));
%  eucp12 = sqrt(sum(((eng(4,1:No) - eng(5,1:No)) .^ 2)));
%  eucp13 = sqrt(sum(((eng(4,1:No) - eng(6,1:No)) .^ 2)));
dist = zeros([18,18]);

for i = 1:length(voices)
    for j = 1:length(voices)
        dist(i,j) = sqrt(sum(((eng(i,1:No) - eng(j,1:No)) .^ 2)));
    end
end

%q1 = (sum(dist(19,1:6)))/6;
%q2 = (sum(dist(19,7:12)))/6;
%q3 = (sum(dist(19,13:18)))/6;



 



