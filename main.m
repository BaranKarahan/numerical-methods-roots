%Baran Deniz Karahan            11/4/2019

%ErrMode = 0 sets error criteria as only 10^(-6) while...
%ErrMode = 2 also creates 10^(-8) and 10^(-10)
%The graphs 2 and 4 only works with UpperBound = 10
%To compare UpperBound = 2 and UpperBound = 10, set UpperBound = 10...
%and ErrMode = 2
%The graphs 6 and 7 only works with ErrMode=2 and UpperBound = 10
f = @(x) x^3 + 2*x^2 + 10*x - 20;
df = @(x) 3*x^2 + 4*x + 10;
UpperBound = 2;
%UpperBound = 10;

errMode = 0; % 0 to see only 10^(-6),1 to activate other error criteria
plotMode = 1; %This is used to draw graphs
err=10^(-6);
if errMode==1
    err2 = 10^(-8);
    err3 = 10^(-10);
    [bisN8,bisX8,bisF8] = bisectionMethod(f,0,UpperBound,err2);
    [falN8,falX8,falF8] = falsePositionMethod(f,0,UpperBound,err2);
    [modN8,modX8,modF8] = modifiedFalsePositionMethod(f,0,UpperBound,err2);
    [sacN8,sacX8,sacF8] = secantMethod(f,0,UpperBound,err2);
    [newN8,newX8,newF8] = NewtonsMethod(f,df,UpperBound,err2);
    [bisN10,bisX10,bisF10] = bisectionMethod(f,0,UpperBound,err3);
    [falN10,falX10,falF10] = falsePositionMethod(f,0,UpperBound,err3);
    [modN10,modX10,modF10] = modifiedFalsePositionMethod(f,0,UpperBound,err3);
    [sacN10,sacX10,sacF10] = secantMethod(f,0,UpperBound,err3);
    [newN10,newX10,newF10] = NewtonsMethod(f,df,UpperBound,err3);
elseif errMode==2
    [bisN2,bisX2,bisF2] = bisectionMethod(f,0,10,err);
    [falN2,falX2,falF2] = falsePositionMethod(f,0,10,err);
    [modN2,modX2,modF2] = modifiedFalsePositionMethod(f,0,10,err);
    [sacN2,sacX2,sacF2] = secantMethod(f,0,10,err);
    [newN2,newX2,newF2] = NewtonsMethod(f,df,10,err);
end   

[bisN,bisX,bisF] = bisectionMethod(f,0,UpperBound,err);
[falN,falX,falF] = falsePositionMethod(f,0,UpperBound,err);
[modN,modX,modF] = modifiedFalsePositionMethod(f,0,UpperBound,err);
[sacN,sacX,sacF] = secantMethod(f,0,UpperBound,err);
[newN,newX,newF] = NewtonsMethod(f,df,UpperBound,err);




%%For only looking for err
if errMode==0
	namesT = {'bisectionMethod','falsePositionMethod','modifiedFalsePositionMethod','secantMethod','NewtonsMethod'};
	stepsTookT = {bisN(length(bisN)),falN(length(falN)),modN(length(modN)),sacN(length(sacN)),newN(length(newN))};
	xValuesT = {bisX(end),falX(end),modX(end),sacX(end),newX(end)};
	fValuesT = {bisF(end),falF(end),modF(end),sacF(end),newF(end)};

elseif errMode==1
%%%%%%For err,err2,err3 at the same time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    namesT = {'bisectionMethodFor10^(-6)','bisectionMethodFor10^(-8)','bisectionMethodFor10^(-10)'...
        ,'falsePositionMethodFor10^(-6)','falsePositionMethodFor10^(-8)','falsePositionMethodFor10^(-10)'...
        ,'modifiedFalsePositionMethodFor10^(-6)','modifiedFalsePositionMethodFor10^(-8)','modifiedFalsePositionMethodFor10^(-10)'...
        ,'secantMethodFor10^(-6),','secantMethodFor10^(-8),','secantMethodFor10^(-10),'...
        ,'NewtonsMethodFor10^(-6)','NewtonsMethodFor10^(-8)','NewtonsMethodFor10^(-10)'};
    stepsTookT = {bisN(length(bisN)),bisN8(length(bisN8)),bisN10(length(bisN10)) ...
        ,falN(length(falN)),falN8(length(falN8)),falN10(length(falN10))...
        ,modN(length(modN)),modN8(length(modN8)),modN10(length(modN10))...
        ,sacN(length(sacN)),sacN8(length(sacN8)),sacN10(length(sacN10))...
        ,newN(length(newN)),newN8(length(newN8)),newN10(length(newN10))};

    xValuesT = {bisX(length(bisX)),bisX8(length(bisX8)),bisX10(length(bisX10)) ...
        ,falX(length(falX)),falX8(length(falX8)),falX10(length(falX10))...
        ,modX(length(modX)),modX8(length(modX8)),modX10(length(modX10))...
        ,sacX(length(sacX)),sacX8(length(sacX8)),sacX10(length(sacX10))...
        ,newX(length(newX)),newX8(length(newX8)),newX10(length(newX10))};
    fValuesT = {bisF(length(bisF)),bisF8(length(bisF8)),bisF10(length(bisF10)) ...
        ,falF(length(falF)),falF8(length(falF8)),falF10(length(falF10))...
        ,modF(length(modF)),modF8(length(modF8)),modF10(length(modF10))...
        ,sacF(length(sacF)),sacF8(length(sacF8)),sacF10(length(sacF10))...
        ,newF(length(newF)),newF8(length(newF8)),newF10(length(newF10))};
else
    namesT = {'bisectionMethod(0,2)','bisectionMethod(0,10)','falsePositionMethod(0,2)','falsePositionMethod(0,10)','modifiedFalsePositionMethod(0,2)','modifiedFalsePositionMethod(0,10)'...
        ,'secantMethod(0,2)','secantMethod(0,10)','NewtonsMethod(0,2)','NewtonsMethod(0,10)'};
	stepsTookT = {bisN(length(bisN)),bisN2(length(bisN2)),falN(length(falN)),falN2(length(falN2)),modN(length(modN)),modN2(length(modN2))...
        ,sacN(length(sacN)),sacN2(length(sacN2)),newN(length(newN)),newN2(length(newN2))};
	xValuesT = {bisX(end),bisX2(end),falX(end),falX2(end),modX(end),modX(end),sacX(end),sacX(end),newX(end),newX(end)};
	fValuesT = {bisF(end),bisF2(end),falF(end),falF2(end),modF(end),modF2(end),sacF(end),sacF2(end),newF(end),newF2(end)};
    AbsErrorT = {abs(bisF(end)),abs(bisF2(end)),abs(falF(end)),abs(falF2(end)),abs(modF(end)),abs(modF2(end)),abs(sacF(end))...
        ,abs(sacF2(end)),abs(newF(end)),abs(newF2(end))};
    
    
end
namesOfMethods = namesT.';
stepsTook = stepsTookT.';
xValues = xValuesT.';
fValues = fValuesT.';
if errMode==2
    AbsError = AbsErrorT.';
    T = table(namesOfMethods,stepsTook,xValues,fValues,AbsError);
else
    T = table(namesOfMethods,stepsTook,xValues,fValues);
end
display(T);

if UpperBound == 10
    mostSteps = 114; %for upperBound = 10
    mostStepINC = (1:114); %for upperBound = 10
else
    mostSteps = 24; %for upperBound = 2
    mostStepINC = (1:24);%for upperBound = 2
end
limitResultF = zeros([1,mostSteps]);
limitResultX = ones([1,mostSteps]).*1.36880806070;



%First graph comparing results of each graph in each step.
if plotMode==1
    axes
    hold on
    pl0 = plot(mostStepINC,limitResultF,'b');
    pl1 = plot(bisN,bisF,'r');
    pl2 = plot(falN,falF,'g');
    pl3 = plot(modN,modF,'m');
    pl4 = plot(sacN,sacF,'k');
    pl5 = plot(newN,newF,'Color',[.61 .51 .74]);
    title('Values of f(Xn)');
    xlabel('attempts(n)');
    ylabel('f(Xn)');
    legend([pl0,pl1,pl2,pl3,pl4,pl5],{'result','bisection','falsePosition','modifiedFal','secant','newton'});
end
%Second graph comparing results of each graph in each step, improved for easier visualization.
%IMPORTANT: This is only for upperBound = 10 case!
if plotMode==2
    axes
    hold on
    pl0 = plot(mostStepINC(3:47),limitResultF(3:47),'b');
    pl1 = plot(bisN(3:end),bisF(3:end),'r');
    pl2 = plot(falN(3:47),falF(3:47),'g');
    pl3 = plot(modN(3:47),modF(3:47),'m');
    pl4 = plot(sacN(3:end),sacF(3:end),'k');
    pl5 = plot(newN(3:end),newF(3:end),'Color',[.61 .51 .74]);
    title('Values of f(Xn)');
    xlabel('attempts(n)');
    ylabel('f(Xn)');
    legend([pl0,pl1,pl2,pl3,pl4,pl5],{'result','bisection','falsePosition','modifiedFal','secant','newton'});
end
%Third graph comparing Xn in each step.
if plotMode==3
	axes
	hold on
	pl0 = plot(mostStepINC,limitResultX,'b');
	pl1 = plot(bisN,bisX,'r');
	pl2 = plot(falN,falX,'g');
	pl3 = plot(modN,modX,'m');
	pl4 = plot(sacN,sacX,'k');
	pl5 = plot(newN,newX,'Color',[.61 .51 .74]);
	title('Values of Xn');
	xlabel('attempts(n)');
	ylabel('Xn');
	legend([pl0,pl1,pl2,pl3,pl4,pl5],{'result','bisection','falsePosition','modifiedFal','secant','newton'});
end
%Fourth graph comparing Xn in each step, improved for easier visualization.
%IMPORTANT: This is only for upperBound = 10 case!
if plotMode==4
	axes
	hold on
	pl0 = plot(mostStepINC(3:47),limitResultX(3:47),'b');
	pl1 = plot(bisN(3:end),bisX(3:end),'r');
	pl2 = plot(falN(3:47),falX(3:47),'g');
	pl3 = plot(modN(3:47),modX(3:47),'m');
	pl4 = plot(sacN(3:end),sacX(3:end),'k');
	pl5 = plot(newN(3:end),newX(3:end),'Color',[.61 .51 .74]);
	title('Values of Xn');
	xlabel('attempts(n)');
	ylabel('Xn');
	legend([pl0,pl1,pl2,pl3,pl4,pl5],{'result','bisection','falsePosition','modifiedFal','secant','newton'});
end
%%%%%Fifth graph comparing different absolute values for each method
if plotMode==5
    subplot(3,2,1)
    hold on;
    pl_11 = plot(bisN10,bisX10,'b');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);
    end
    pl_12 = plot(bisN8,bisX8,'r');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);
    end
    pl_13 = plot(bisN,bisX,'g');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);
    end
    title('Subplot 1: Bisection Method')
    legend([pl_11,pl_12,pl_13],{'10^(-6)','10^(-8)','10^(-10)'});
    if UpperBound == 10
        legend('Location','northeast')
    else
        legend('Location','southheast')
    end
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('Xn');
    
    subplot(3,2,2)
    hold on;
    pl_21 = plot(falN10,falX10,'b');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    pl_22 = plot(falN8,falX8,'r');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    pl_23 = plot(falN,falX,'g');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    title('Subplot 2: False Position Method')
    legend([pl_21,pl_22,pl_23],{'10^(-6)','10^(-8)','10^(-10)'});
    if UpperBound == 10
        legend('Location','northeast')
    else
        legend('Location','southheast')
    end
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('Xn');

    subplot(3,2,3)
    hold on;
    pl_31 = plot(modN10,modX10,'b');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    pl_32 = plot(modN8,modX8,'r');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    pl_33 = plot(modN,modX,'g');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    title('Subplot 3: Modified False Position Method')
    legend([pl_31,pl_32,pl_33],{'10^(-6)','10^(-8)','10^(-10)'});
    if UpperBound == 10
        legend('Location','northeast')
    else
        legend('Location','southheast')
    end
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('Xn');
    
    subplot(3,2,4)
    hold on;
    pl_41 = plot(sacN10,sacX10,'b');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    pl_42 = plot(sacN8,sacX8,'r');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    pl_43 = plot(sacN,sacX,'g');
    if(UpperBound==2)
        ylim([1 1.55]);
    else
        ylim([0 6]);        
    end
    title('Subplot 4: Secant Method')
    legend([pl_41,pl_42,pl_43],{'10^(-6)','10^(-8)','10^(-10)'});
    if UpperBound == 10
        legend('Location','northeast')
    else
        legend('Location','southheast')
    end
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('Xn');
    
    subplot(3,2,5)
    hold on;
    pl_51 = plot(newN10,newX10,'b');
    if(UpperBound==2)
    ylim([1 1.55]);
    else
        ylim([0 6]);    
    end
    pl_52 = plot(newN8,newX8,'r');
    if(UpperBound==2)
    ylim([1 1.55]);
    else
        ylim([0 6]);    
    end
    pl_53 = plot(newN,newX,'g');
    if(UpperBound==2)
    ylim([1 1.55]);
    else
        ylim([0 6]);    
    end
    title('Subplot 5: Newtons Method')
    legend([pl_51,pl_52,pl_53],{'10^(-6)','10^(-8)','10^(-10)'});
    if UpperBound == 10
        legend('Location','northeast')
    else
        legend('Location','southheast')
    end
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('Xn');
end

if plotMode==6
    subplot(3,2,1)
    hold on;
    pl_11 = plot(bisN10,bisF10,'b');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);
    end
    pl_12 = plot(bisN8,bisF8,'r');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);
    end
    pl_13 = plot(bisN,bisF,'g');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    title('Subplot 1: Bisection Method')
    legend([pl_11,pl_12,pl_13],{'10^(-6)','10^(-8)','10^(-10)'});
    legend('Location','southeast')
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');
    
    subplot(3,2,2)
    hold on;
    pl_21 = plot(falN10,falF10,'b');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    pl_22 = plot(falN8,falF8,'r');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    pl_23 = plot(falN,falF,'g');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    title('Subplot 2: False Position Method')
    legend([pl_21,pl_22,pl_23],{'10^(-6)','10^(-8)','10^(-10)'});
    legend('Location','southeast')
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)'); 
    
    subplot(3,2,3)
    hold on;
    pl_31 = plot(modN10,modF10,'b');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    pl_32 = plot(modN8,modF8,'r');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    pl_33 = plot(modN,modF,'g');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    title('Subplot 3: Modified False Position Method')
    legend([pl_31,pl_32,pl_33],{'10^(-6)','10^(-8)','10^(-10)'});
    legend('Location','southeast')
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');
 
    subplot(3,2,4)
    hold on;
    pl_41 = plot(sacN10,sacF10,'b');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    pl_42 = plot(sacN8,sacF8,'r');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    pl_43 = plot(sacN,sacF,'g');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    title('Subplot 4: Secant Method')
    legend([pl_41,pl_42,pl_43],{'10^(-6)','10^(-8)','10^(-10)'});
    legend('Location','southeast')
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');    
    
    subplot(3,2,5)
    hold on;
    pl_51 = plot(newN10,newF10,'b');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    pl_52 = plot(newN8,newF8,'r');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    pl_53 = plot(newN,newF,'g');
    if(UpperBound==2)
        ylim([-5.5 5.5]);
    else
        ylim([-20 20]);        
    end
    title('Subplot 5: Newtons Method')
    legend([pl_51,pl_52,pl_53],{'10^(-6)','10^(-8)','10^(-10)'});
    legend('Location','southeast')
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');
end


if plotMode==7
    subplot(3,2,1)
    hold on;
    pl_112 = plot(bisN2,abs(bisF2),'r');
    pl_111 = plot(bisN,abs(bisF),'b');
    title('Subplot 1: Bisection Method')
    legend([pl_111,pl_112],{'(0,2)','(0,10)'});
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');

    subplot(3,2,2)
    hold on;
    pl_122 = plot(falN2,abs(falF2),'r');    
    pl_121 = plot(falN,abs(falF),'b');
    title('Subplot 2: False Position Method')
    legend([pl_121,pl_122],{'(0,2)','(0,10)'});
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');
    
    subplot(3,2,3)
    hold on;
    pl_132 = plot(modN2,abs(modF2),'r');
    pl_131 = plot(modN,abs(modF),'b');
    title('Subplot 3: Modified False Position Method')
    legend([pl_131,pl_132],{'(0,2)','(0,10)'});
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');    
    
    subplot(3,2,4)
    hold on;
    pl_142 = plot(sacN2,abs(sacF2),'r');
    pl_141 = plot(sacN,abs(sacF),'b');
    title('Subplot 4: Secant Method')
    legend([pl_141,pl_142],{'(0,2)','(0,10)'});
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');   
    
    subplot(3,2,5)
    hold on;
    pl_152 = plot(newN2,abs(newF2),'r');
    pl_151 = plot(newN,abs(newF),'b');
    title('Subplot 1: Newtons Method')
    legend([pl_151,pl_152],{'(0,2)','(0,10)'});
    legend('Orientation','horizontal')
    xlabel('attempts(n)');
	ylabel('f(Xn)');       
    
end




