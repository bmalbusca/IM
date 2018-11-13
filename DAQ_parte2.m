% Autores: Bruno Figueiredo
%          Tarcisio Silva
%
% Turno: Terca-feira 17h
%
function [] = DAQ_parte2( device,type , channel1, channel2, fs, n, range)

%Adquire 2 sinais em simultaneo
[ S, t ] = acquire2( device,type , channel1,channel2, fsampl, n, range);

%Estima as frequencias 
[ ~ ,~, s_rms1 ] = meanf( S(1,:), t,fs, n, f_estim );
[ ~ ,~, s_rms2 ] = meanf( S(2,:), t,fs, n, f_estim );
 
%calcula o modulo da impedancia
Z = (s_rms2/(s_rms2-s_rms1))*100;  %impedacia conhecida de 100 ohm
%calcula o angulo da impedancia
angle = phase((S(1,:)- S(2,:)), S(2,:)); 
disp('modulo da impedancia')
disp(Z)
disp('Angulo  da impedancia')
disp(angle)

Sinal1=S(1,:);
Sinal2=S(2,:);

if n > ceil((f/fs)*5)
    x1 = Sinal1(1:ceil((f/fs)*5));
    x2 = Sinal2(1:ceil((f/fs)*5));
    y = t(1:ceil((f/fs)*5));
else
    x1=Sinal1;
    x2=Sinal2;
    y=t;
    
end

figure;

%figura do Sinal 1
subplot(2,1,1);
plot(x1,y);
title(['Frequ?ncia estimada =',num2str(f_estim),'Hz Diferen?a de fase=',num2str(angle),'V Valor eficaz=',...
    num2str(s_rms1),' N? amostras=',num2str(n),' f? amostragem=',num2str(fs),...
    'Hz low range=',num2str(-range),'V high range=',num2str(range),'V']);
xlabel('Tempo (s)');
ylabel('A [V]');

%figura do Sinal 2
subplot(2,1,2);
plot(x2,y);
title(['Frequ?ncia estimada =',num2str(f_estim),'Hz Diferen?a de fase=',num2str(angle),'V Valor eficaz=',...
    num2str(s_rms2),' N? amostras=',num2str(n),' f? amostragem=',num2str(fs),...
    'Hz low range=',num2str(-range),'V high range=',num2str(range),'V']);
xlabel('Tempo (s)');
ylabel('A [V]');
end