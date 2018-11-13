% Autores: Bruno Figueiredo
%          Tarcisio Silva
%
% Turno: Terca-feira 17h
%
function ENOB = calc_ENOB(spectrum)
    %Numero de bits efectivos utilizados para medir as amostras

    fundamental = 20*log10(max(spectrum));
    noise = 20*log10(sqrt(sum(spectrum.^2) - max(spectrum)^2));
    
    SINAD = fundamental - noise;
    
    ENOB = (SINAD - 1.76) / 6.02;
end