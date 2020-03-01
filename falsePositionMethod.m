function [iterNum,valOfX,valOfF] = falsePositionMethod(f,inter1,inter2,error)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if f(inter1)*f(inter2)>0 
    disp('The values at intervals do not have different signs')
else
    iterNum=[];
    valOfX=[];
    valOfF=[];
    n=1;
    p =(inter2*abs(f(inter1))+inter1*abs(f(inter2)))/(abs(f(inter1))+abs(f(inter2)));
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
         p =(inter2*abs(f(inter1))+inter1*abs(f(inter2)))/(abs(f(inter1))+abs(f(inter2))); 
        err = abs(f(p));
        n=n+1;
        iterNum(n)=n;
        valOfX(n)=p;
        valOfF(n)=f(p);
    end
end