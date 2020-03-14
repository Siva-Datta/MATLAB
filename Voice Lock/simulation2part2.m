voices = string({'Morning1.wav','Morning2.wav','Morning3.wav','Lunch1.wav','Lunch2.wav','Lunch3.wav','morning1p.wav','morning2p.wav','morning3p.wav','Lunchp1.wav','Lunchp2.wav','Lunchp3.wav','morning1pj.wav','morning2pj.wav','morning3pj.wav','afternoon1pj.wav','afternoon2pj.wav','afternoon3pj.wav','preranatest.wav'});%rectangular window

N = 1024*2*2+1;
No =16;
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
for i = 1:No/2
    h(i,1:N) = mysincB(pi/(4*No),N,(2*i-1)*pi/(4*No)).*w5;
    w = linspace(-pi,pi,512);
    H=freqz(h(i,1:N),1,w);
    hold on;
    plot(w,abs(H));
end

for i = (No/2)+1:No
    h(i,1:N) = mysincB(3*pi/(4*No),N,pi/4+(2*(i-No/2-1)+1)*pi*3/(4*No)).*w5;
    w = linspace(-pi,pi,512);
    H=freqz(h(i,1:N),1,w);
    plot(w,abs(H));
end
hold off
    



figure(2);
[sm1,Fs] = audioread('Morning1.wav');
S1 = fft(sm1);
S = fftshift(S1);
f =(-length(S)/2:length(S)/2-1)*Fs/length(S);
plot(f,abs(S)/length(S));
xlabel('frequency');
ylabel('magnitude spectrum');
title('Mayank morning 1');
%eucm2p2


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
dist = zeros([length(voices),length(voices)]);
for i = 1:length(voices)
    for j = 1:length(voices)
        dist(i,j) = sqrt(sum(((eng(i,1:No) - eng(j,1:No)) .^ 2)));
    end
end
k = 18;       
q1 = (sum(dist(18,1:6)))/6;
q2 = (sum(dist(18,7:12)))/6;
q3 = (sum(dist(18,13:17)))/5;

dist2 = zeros([length(voices),length(voices)]);
for i = 1:length(voices)
    for j = 1:length(voices)
        dist2(i,j) = sum(abs(eng(i,1:No)./eng(j,1:No)-ones([1,No])));
    end
end
k = 18;
q1o = (sum(dist2(k,1:6)))/6;
q2o = (sum(dist2(k,7:12)))/6;
q3o = (sum(dist2(k,13:17)))/5;

if(q1o < q2o)
    if(q1o<q3o)
        'mayank'
    else
        'poojitha'
    end
else
    if(q2o<q3o)
       'prerana'
    else
       'poojitha'
    end
end
    
    
        



 



