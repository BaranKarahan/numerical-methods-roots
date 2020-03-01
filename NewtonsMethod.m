function [iterNum,valOfX,valOfF] = NewtonsMethod(f,df,point,error)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
valOfX(1)  =  point - (f(point)/df(point));
valOfF(1)  =  f(valOfX(1));
iterNum(1) =  1;
iter = 2;
while(abs(valOfF(iter-1))>error)
    valOfX(iter) = valOfX(iter-1) - (valOfF(iter-1) / df(valOfX(iter-1)));
    valOfF(iter) = f(valOfX(iter)); 
    iterNum(iter) = iter;
    iter = iter+1;
end




