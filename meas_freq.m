% Autores: Bruno Figueiredo
%          Tarcisio Silva
%
% Turno: Terca-feira 17h
%
function [freqs ,spectrum ,freq_pesada,deltaf]= meas_freq( S, t,fs,n)
%Calcula o a frequencia do sinal atraves de da media pesada

%frequencias da ftt sem replicas
freqs = fs*round((0:(n/2)-1))/n;
ff = abs(fft(S)) / n;
%espectro DFT
spectrum = ff(1:n / 2) * 2;
spectrum(1)=0;
figure();
plot(freqs',spectrum)
title('FFT single-sided spectrum')
xlabel('f [Hz]') 

%Espectro de potencia
[ p_spectrum, p_freqs] = espetro_potencia( spectrum,freqs );
p_spectrum(1)=0;
figure();
plot(p_freqs',p_spectrum)
title('single-sided power spectrum')
xlabel('f [Hz]')    

%metodo da media pesada
deltaf = fs/n
[~,index]= max(p_spectrum);
mfreq = deltaf * index

res = 0;
div = 0;
j = index -3 ;

while j<= index+3 
    
    res = res + (p_spectrum(j)* ((j-1)*deltaf));
    div = div +p_spectrum(j) ;  
    j=j + 1; 
end

freq_pesada = res/div



