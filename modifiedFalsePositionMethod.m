function [stepNum,xValue,yValue] = modifiedFalsePositionMethod(f,a,b,error)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%if f(inter1)*f(inter2)>0 
%    disp('The values at intervals do not have different signs')
%else
    checkLeft = 0;
    checkRight = 0;
    stepNum=[];
    xValue=[];
    yValue=[];
    n=1;
    inter1=a;
    inter2=b;
    p =(inter2*abs(f(inter1))+inter1*abs(f(inter2)))/(abs(f(inter1))+abs(f(inter2)));
    err = abs(f(p));
    stepNum(n)=n;
    xValue(n)=p;
    yValue(n)=f(p);
    while err > error
        
        if f(inter1)*f(p)<0 
            inter2 = p;
            intervalAt=0;
        else
            inter1 = p;
            intervalAt=1;
        end

        leftPoint = f(inter1);
        rightPoint = f(inter2);
        
        if(intervalAt==0)
            if(checkRight==1)
                leftPoint=leftPoint/2;
                checkRight=0;
            else
                checkRight=1;
            end
            checkLeft = 0;
        else
            if(checkLeft==1)
                rightPoint=rightPoint/2;
                checkLeft=0;
            else
                checkLeft=1;
            end
            checkRight=0;
        end
        
         p =(inter2*abs(leftPoint)+inter1*abs(rightPoint))/(abs(leftPoint)+abs(rightPoint)); 
        err = abs(f(p));
        n=n+1;
        stepNum(n)=n;
        xValue(n)=p;
        yValue(n)=f(p);
    end
%end