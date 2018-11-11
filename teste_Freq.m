

Npontos =  4000;
famostragem=20000;
freq = 1000;
k=0:1:Npontos-1;
t=k/famostragem;
sk= cos(2*pi*freq*t);

[~,~,freq_estim] = meas_freq(sk,t,famostragem,Npontos);

mean(sk,t,famostragem,Npontos,freq_estim);