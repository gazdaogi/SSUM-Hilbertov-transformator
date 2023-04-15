clear,clg
%%%%%%%%%%%%% tacka b: sinteza Hilbertovog transformatora
% Copyright (c) ATTI Ognjen Jovanovic 2023.
% All rights reserved.
M=32;          % duzina impulsnog odziva
N=M-1;         %red diferencijatora
f=[0.1 0.7];
A=[1 1];
h=remez(N,f,A,'Hilbert');
[H,w]=freqz(h,1,1024); Hd=abs(H);
plot(w,Hd),title('Hilbertov transformator u opsegu od 0.1pi-0.7pi,reda M=32')
xlabel('osa ucestanosti (0-pi)'), pause
%%%%%%%%%%%%%% tacka c: signal na izlazu Hilbertovog transformatora
fod=2000; Tod=1/fod;
t=0:Tod:500*Tod;
x=cos(2*pi*70*t);	% sinusoida koja se dovodi na ulaz
y=filter(h,1,x);	% signal na izlazu
broj_tac=80;
n=0:broj_tac-1;		% osa indeksa za crtanje
kasnjenje=(M-1)/2;	% kasnjenje filtra
subplot(211),plot(n,x(1:broj_tac))
title('Signal na ulazu u Hilbertov transformator')
subplot(212),plot(n,y(1:broj_tac))
title('Signal na izlazu Hilbertovog transformatora'),pause
subplot(212),plot(n,y(1+kasnjenje:broj_tac+kasnjenje))
title('Signal na izlazu, pomeren za (M-1)/2')
