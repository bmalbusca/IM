function [] = DAQ_parte1b( device,type , channel, fs, n, range)

[ S, t ] = acquire( device,type , channel, fs, n, range);

[ freqs, spectrum, freq_pesada, deltaf]= meas_freq( S, t, fs, n);

[ s_mean ,s_alt, s_rms ] = meanf( S, t ,fs, n, freq_pesada);

deltatempo=(1/deltaf)*n;

print('Alcance: ',range)
print('Valor m?dio: ',s_mean)
print('Valor eficaz: ',s_rms)
print('Frequ?ncia: ',freq_pesada)
print('Resolu??o Temporal: ',deltatempo)
print('Resolu??o Espectral: ',deltaf)


if n > ceil((f/fs)*5)
    x = S(1:ceil((f/fs)*5));
    y = t(1:ceil((f/fs)*5));
else
    x=S;
    y=t;
end

figure;
%figura 1
subplot(2,1,1);
plot(x,y);
title(['frequencia=',num2str(freqs),'Hz Valor m?dio=',num2str(s_mean),'V Valor eficaz=',...
    num2str(s_rms),' N? amostras=',num2str(n),' f? amostragem=',num2str(fs),...
    'Hz low range=',num2str(-range),'V high range=',num2str(range),'V']);
xlabel('Tempo (s)');
ylabel('A [V]');
%figura 2
subplot(2,1,2);
semilogy(freqs,spectrum);
xlabel('f [Hz]');
ylabel('A [V]');
end