

Npontos = 10000;
famostragem=10000;
freq = 100;
k=0:1:Npontos-1;
t=k/famostragem;
sk= 0.8*cos(2*pi*freq*t)+ 0.0014*randn(size(t));
sk1=cos(2*pi*freq*t +pi/2);

[~,spectrum,freq_estim] = meas_freq(sk,t,famostragem,Npontos);
enobs = meas_ENOB(spectrum)
meanf(sk,t,famostragem,Npontos,freq_estim);
THD = meas_THD(Npontos,spectrum);
delay = phase( sk1, sk)
