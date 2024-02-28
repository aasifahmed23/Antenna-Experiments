function [ quantResults ] = quantized_amp( vect, bits )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
% vect=[0.996;0.961;.895;.804;.697;.583;.471;.367;.276;.201];
% bits=5;
[M,N]= size(vect);
if (M>1),
    vect=vect';
end
range = 1.0;
delta = roundVal(range/2^(bits));
levels = 2^bits;
base=0;
quantValues=[0:delta:1]';
inputArray=repmat(vect, length(quantValues), 1);
quantArray=repmat(quantValues, 1, length(vect));
quantDiff=abs(inputArray-quantArray);
[Y,I]= min(quantDiff);
quantResults=quantArray(I);


function newVal = roundVal(num)
     num = num*1e5;
     num= round(num);
     newVal= num*1e-5;
end


end
