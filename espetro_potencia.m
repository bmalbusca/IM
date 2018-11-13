function [ espetro_potencia, Fk_potencia ] = espetro_potencia( espetro,Fk )
%   calcula espetro potencia atraves do espetro do sinal
N = length (espetro);

if(rem(N,2)==0)
    espetro_potencia = espetro(1:( ( (N)/2 ) +1 ));
    Fk_potencia = Fk(1:( ( (N)/2 ) +1 ));
    espetro_potencia = 2 * (espetro_potencia.^2); 
    espetro_potencia(1) = espetro(1)^2 ; 
    espetro_potencia( ((N)/2) +1) = espetro( ( (N)/2 ) +1)^2 ; 
else
    espetro_potencia = espetro(1:( ( (N-1)/2 ) +1 ));
    Fk_potencia = Fk(1:( ( (N-1)/2 ) +1 ));
    espetro_potencia = 2 * (espetro_potencia.^2); 
    espetro_potencia(1) = espetro(1)^2 ;
end


end
