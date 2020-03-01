function [iterNum,valOfX,valOfF] = bisectionMethod(f,inter1,inter2,error)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if f(inter1)*f(inter2)>0 
    disp('The values at intervals do not have different signs')
else
    iterNum=[];
    valOfX=[];
    valOfF=[];
    n=1;
    p = (inter1 + inter2)/2;
    err = abs(f(p));
    iterNum(n)=n;
    valOfX(n)=p;
    valOfF(n)=f(p);
    while err > error
        if f(inter1)*f(p)<0 
            inter2 = p;
        else
            inter1 = p;
        end
         p = (inter1 + inter2)/2; 
        err = abs(f(p));
        n=n+1;
        iterNum(n)=n;
        valOfX(n)=p;
        valOfF(n)=f(p);
    end
end

