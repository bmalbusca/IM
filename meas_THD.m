% Autores: Bruno Figueiredo
%          Tarcisio Silva
%
% Turno: Terca-feira 17h
%
function [THD]= meas_THD(Npontos,spectrum)
%Calculo da THD de um sinal

%Elimininar a harmonica fundamental
[harmonica,index]= max(spectrum);
spectrum(index)=0;

%sumatorio da harmonicas dos ruido
i=1;
sum=0;

while i< Npontos/2
    sum = sum + spectrum(i)^2;
    i=i+1;
end

%THD - racio entre ruido e o sinal
p_ruido = (abs(sum))^2
THD = sqrt(sum)/harmonica;


