function [ quantResults ] = quantized_phase( vect, bits )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[M,N]= size(vect);
if (M>1),
    vect=vect';
end
range = 360;
delta = roundVal(range/2*(bits));
levels = 2^bits;
base=-180;
quantValues=[base:delta:180]';

inputArray=repmat(vect, lenght(quantValues), 1);
quantArray=repmat(quantValues, 1, lenght(vect));

quantDiff=abs(inputArray-quantArray);
[Y,I]= min(quantDiff);
quantResults=quantArray(I);

function newVal = roundVal(num)
     num = num*1e4;
     num= round(num);
     newVal= num*1e-4;

end

