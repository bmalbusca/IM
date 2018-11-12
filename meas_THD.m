function [THD]= meas_THD(Npontos,spectrum)

[harmonica,index]= max(spectrum);

spectrum(index)=0;

i=1;
sum=0;

while i< Npontos/2
    sum = sum + spectrum(i)^2;
    i=i+1;
end
p_ruido = (abs(sum))^2
THD = sqrt(sum)/harmonica;


