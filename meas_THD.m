function [THD]= meas_THD(sk,t,famostragem,Npontos)

[~,spectrum,~] = meas_freq(sk,t,famostragem,Npontos);

[harmonica,index]= max(spectrum);

spectrum(index)=0;

i=1;
sum=0;

while i< Npontos/2
    sum = sum + spectrum(i)^2;
    i=i+1;
end

THD = sqrt(sum)/harmonica;


