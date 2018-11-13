function [ delay ] = phase( x, y)
%  calculo da diferenca de fase

PhDiff = phdiffmeasure(x, y);
%passar para angulo em graus
PhDiff = PhDiff*180/pi;

delay = PhDiff;

end

