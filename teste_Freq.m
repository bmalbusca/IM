

Npontos = 2048;
famostragem=2048;
freq = 90;
k=0:1:Npontos-1;
t=k/famostragem;
sk=square(2*pi*freq*t);

meas_freq(sk,t,famostragem,Npontos);