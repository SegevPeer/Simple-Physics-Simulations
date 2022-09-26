%solving and presenting the solution for diffusion equation for simple case
%in one dimension, constant diffusion coefficient and initial conditions
x=linspace(0,1,20);
t=linspace(0,2,5);
m=0;%symmetry of the problem
sol=pdepe(m,@PDEfun,@PDEICfun,@PDEBCfun,x,t);%solution of the PDE
u=sol(:,:,1);
%subplot-1 surface plot
subplot(2,1,1);
surf(x,t,u);
title('change in concentration as function of distance & time');
xlabel('Distance x');
ylabel('Time t');
zlabel('concentration');
%subplot-2 plot of change in concentration in different times
subplot(2,1,2);
p=plot(x,u(1,:),x,u(2,:),x,u(3,:),x,u(4,:),x,u(5,:));
axis([0 1 0 3]);
title('change in concentration as function of distance in different times');
xlabel('Distance x');
ylabel('Concentration');
grid on;
legend('t=0','t=0.5','t=1','t=1.5','t=2');
%the diffusion equation
function [c,f,s]=PDEfun(x,t,u,dudx)
c=3;% 1/c is the diffusion coefficient
%both of the arguments below are matlab's syntax for the PDE
f=dudx;
s=0;
end
%the initial condition function
function u0=PDEICfun(x)
u0=0.8; %initial condition= concentration is equal at any point x in time t=0;
end
%the boundry condition function
function [pL,qL,pR,qR]=PDEBCfun(xL,uL,xR,uR,t)
%all of the arguments below are boundry condition in matlab's syntax
pL=uL;
qL=1;
pR=uR-0.8;
qR=1;
end