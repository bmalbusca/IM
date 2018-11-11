function [] = parte1a( device,type , channel, fs, n, range)

[ S, t ] = acquire( device,type , channel, fs, nscans, range);

[ freqs, spectrum, freq_pesada, deltaf]= meas_freq( S, t, fs, n);

[ s_mean ,s_alt, s_rms ] = meanf( S, t ,fs, n, freq_pesada);

deltatempo=(1/deltaf)*n;

print('Alcance: ',range)
print('Valor médio: ',s_mean)
print('Valor eficaz: ',s_rms)
print('Frequência: ',freqs)
print('Resolução Temporal: ',deltatempo)
print('Resolução Espectral: ',deltaf)

end