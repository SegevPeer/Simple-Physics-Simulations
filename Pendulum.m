%pendulum- damped harmonic oscillator
%no small-angle approximation
%physical parameters
g=9.81; b=0.08; L=1; m=2;
w=g/L; k=b/L*m;
%time span
tspan=[0 20];
%center
o=[0 0];
%points definition for graph plotting
j=[0 0];%position final point
n=[0 0];%position initial point
a=[0 0];%velocity initial point
pv=[0 0];%velocity final point
x0=[pi/3;0];%initial conditions
f=@(t,x) [x(2);-k*x(2)-w*sin(x(1))];%pendulum ODE
[t,x]=ode45(f,tspan,x0);%solve the ODE
%time loop for animation
for i=1:length(t)
%animation of the pendulum
p=L*[sin(x(i,1)) -cos(x(i,1))];
subplot(2,1,1);
grid on
title('(Damped) Simple Pendulum');
axis([-1 1 -1.5 0.5]);
line1=line([o(1) p(1)],[o(2) p(2)]);
pin=viscircles([o(1) o(2)],0.01,'color','r');
ball=viscircles([p(1) p(2)],0.07,'color','r');
pause(0.01);
delete(line1);
delete(pin);
delete(ball);
%animation of the graphs
subplot(2,1,2);
grid on
title('Position & Velocity as function of time');
xlabel('Time (sec)');
ylabel('Amplitude (m,m/s)');
axis([0 20 -3 3]);
pv(1,1)=t(i);
pv(1,2)=x(i,2);
n(1,1)=t(i);
n(1,2)=x(i,1);
line2=line([j(1) n(1)],[j(2) n(2)]);
line3=line([a(1) pv(1)],[a(2) pv(2)],'color','r');
j(1,1)=t(i);
j(1,2)=x(i,1);
a(1,1)=t(i);
a(1,2)=pv(1,2);

end