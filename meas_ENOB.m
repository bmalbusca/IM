% cálculo do número de bits efectivo que o aparelho utiliza para obter
% amostras que originam o espectro que é passado como argumento

function ENOB = calc_ENOB(spectrum)

    fundamental = 20*log10(max(spectrum));
    noise = 20*log10(sqrt(sum(spectrum.^2) - max(spectrum)^2));
    
    SINAD = fundamental - noise;
    
    ENOB = (SINAD - 1.76) / 6.02;
end