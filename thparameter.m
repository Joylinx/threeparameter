% func=@(x,xd)x(1)*(log(x(2)./abs(xd))-psi(0.5+(x(2)./abs(xd))))+x(3);
func=@(x,xd)x(1)*(log(x(2)./abs(xd))-psi(0.5+(x(2)./abs(xd))))+x(3);
Xfitfeature=zeros(41,3);
for i=1:41
yB=yData(:,i);
yB=yB+0.01*(yB==0);
zB=zData(:,i);
% options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',1e4,'MaxIterations',1e4,'FunctionTolerance',1e-10);
xfit=lsqcurvefit(func,[3.6 480 21],yB,zB);
Xfitfeature(i,:)=xfit;
Xfit=func(xfit,yB);
figure()
plot(yB,zB);
xlabel('B/mT');
ylabel('I/uA');
hold on;
plot(yB,Xfit);
xlabel('B/mT');
ylabel('I/uA');
hold off;
title(num2str(i));
end
interfacel=sqrt(1.05457266e-34./(4*(1.60217662*10^(-19))*0.001*(Xfitfeature(:,2))));
plot(xData(1,:),interfacel*1e9)
xlabel('Vbg/V');
ylabel('l/nm');
alphaaa=(4.3/5.8)*1e-5*(Xfitfeature(:,1).*2*pi*(pi*1.05457266e-34)/((1.60217662*10^(-19))^2));
plot(xData(1,:),alphaaa,'.')
xlabel('Vbg/V');
ylabel('alpha');
