

Npontos =  4000;
famostragem=20000;
freq = 1000;
k=0:1:Npontos-1;
t=k/famostragem;
sk= cos(2*pi*freq*t);
sk1=cos(2*pi*freq*t +pi/2);

[~,spectrum,freq_estim] = meas_freq(sk,t,famostragem,Npontos);
meanf(sk,t,famostragem,Npontos,freq_estim);
THD = meas_THD(sk,t,famostragem,Npontos,spectrum);
delay = phase( sk1, sk)
