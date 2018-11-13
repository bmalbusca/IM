function PhDiff = phdiffmeasure(x, y)

%coloca com um vector coluna se necessario
if size(x, 2) > 1
    x = x';
end
if size(y, 2) > 1
    y = y';
end


% remove o componente DC 
x = x - mean(x);
y = y - mean(y);

% comprimento do sinal
N = length(x);


% fft do primeiro sinal
X = fft(x);
% fft do segundo sinal
Y = fft(y);
%difernca de fases
[~, indx] = max(abs(X));
[~, indy] = max(abs(Y));
PhDiff = angle(Y(indy)) - angle(X(indx));
end