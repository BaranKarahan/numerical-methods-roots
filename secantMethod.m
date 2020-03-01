function [iterNum,valueOfX,valueOfF] = secantMethod(f,inter1,inter2,error)
x(1)=inter1;
x(2)=inter2;
iteration=0;
    iterNum=[];
    valueOfX=[];
    valueOfF=[];
 
for i=3:1000
   x(i) = x(i-1) - (f(x(i-1)))*((x(i-1) - x(i-2))/(f(x(i-1)) - f(x(i-2))));
    iteration=iteration+1;
    iterNum(i-2)=iteration;
    valueOfX(i-2)=x(i);
    valueOfF(i-2)=f(x(i));
    checkNum = abs(f(x(i)));
    if checkNum<error
        break
    end
end
