function [freqs spectrum]= meas_freq( S, t,fs,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

freqs = fs*ceil((0:(n/2)-1))/n;
ff = abs(fft(S) / n);
% All the values shall be duplicated, except the first and last values.
spectrum = ff(1:n / 2) * 2;
figure();
plot(freqs',spectrum)

end

