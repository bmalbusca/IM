function [freqs ,spectrum ,freq_pesada]= meas_freq( S, t,fs,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

freqs = fs*round((0:(n/2)-1))/n;
ff = abs(fft(S)) / n;
% All the values shall be duplicated, except the first and last values.
spectrum = ff(1:n / 2) * 2;
figure();
plot(freqs',spectrum)   

deltaf = fs/n;
[~,index]= max(spectrum);
mfreq = deltaf * index

res = 0;
div = 0;
j = index -3 ; 

while j< index+3 
    
    res = res + (spectrum(j)* (j*deltaf));
    div = div +spectrum(j) ;  
    j=j + 1; 
end

freq_pesada = res/div



