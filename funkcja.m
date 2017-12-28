function [ Z ] = funkcja( X,Y )
%FUNKCJA Summary of this function goes here
%   Detailed explanation goes here
Z = X.*exp(-X.^2 - Y.^2);
end

