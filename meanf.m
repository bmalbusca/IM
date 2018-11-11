function [ s_mean ,s_alt, s_rms ] = meanf( Sk, t,fs, n, f_estim )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
j = 1;
sum = 0;
sum3 = 0;
while j < n 
   
    sum = sum + Sk(j);
   sum3 = sum3 + (Sk(j))^2;
    j = j + 1;
end

s_mean = sum/n %result with an normal conditon
s_rms2 = sqrt(sum3/n)

npontos = ceil(fs/f_estim) ;
nperiodos = n / npontos;
np_inteiros = round(nperiodos);
n_avg = np_inteiros * npontos;


i = 1;
sum1 = 0;
sum2 = 0;
while (i < n_avg) 

    sum1 = sum1 + (Sk(i));
    sum2 = sum2 + (Sk(i))^2;
    i = i + 1;
end
s_rms = sqrt(sum2/n_avg)
s_alt = sum1/n_avg

