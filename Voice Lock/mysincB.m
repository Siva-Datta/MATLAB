function [h]=mysincB(wc,N,w)
k=(N-1)/2;
for n=1:k
    m=n-1;
    h(n)=2*(sin((wc)*(m-k))/(pi*(m-k)))*cos(w*(m-k));
end
for n=k+2:N
    m=n-1;
    h(n)=2*(sin((wc)*(m-k))/(pi*(m-k)))*cos(w*(m-k));
end
h(k+1)=2*wc/pi;




end