% Autores: Bruno Figueiredo
%          Tarcisio Silva
%
% Turno: Terca-feira 17h
%
function [ S, t ] = acquire( device,voltage , channel, fsampl, nscans, range)
% Funcao que adquire 1 sinal - usada nas funcoes DAQ_parte1
%   

s = daq.createSession('ni') %Will run for 1 second (1000 scans) at 1000 scans/second 
s.Rate = fsampl;    %Now, will run fsampl/second or fsampl [Hz]
s.NumberOfScans = nscans; % Number of scans  (nscans*fsampl = sampling time)  
chann = addAnalogInputChannel(s, device,channel,voltage) %(s,'Dev1', 'ai0', 'Voltage')
chann(channel).Range = [-range range]; % -5 5

[S, t]= startForeground(s);

end

