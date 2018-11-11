function [ delay ] = phase( x, y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes her

PhDiff = phdiffmeasure(x, y);
PhDiff = PhDiff*180/pi;

delay = PhDiff;

end

