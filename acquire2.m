function [ S, t ] = acquire2( device,type , channel1,channel2, fsampl, nscans, range)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

s = daq.createSession('ni') %Will run for 1 second (1000 scans) at 1000 scans/second 
s.Rate = fsampl;    %Now, will run fsampl/second or fsampl [Hz]
s.NumberOfScans = nscans; % Number of scans  (nscans*fsampl = sampling time)  
chann = addAnalogInputChannel(s, device,channel1:channel2,voltage) %(s,'Dev1', 'ai0', 'Voltage')
chann(channel1).Range = [-range range]; % -5 5
chann(channel2).Range = [-range range];
[S, t]= startForeground(s);

end

