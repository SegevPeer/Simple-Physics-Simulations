%falling ball
%physical parameters
m=1; g=-9.81; b=0.05;
k=b/m;
h=400;
v0=0;
tspan=[0 10];%time span
y0=[h;v0];%initial condition
f=@(t,y) [y(2);g-k*y(2)];%ODE
[t,y]=ode45(f,tspan,y0);%solve the ODE
p=[0 h];%point of the initial condition
j=[0 0];%position final point
n=[0 0];%position initial point
a=[0 0];%velocity initial point
pv=[0 0];%velocity final point
%time loop for the animations
for i=1:length(t)
p(1,2)=y(i,1);
subplot(3,1,1);
ball=viscircles([0 p(1,2)],3);
axis([-100 100 0 500]);
title('Animation of falling ball');
ylabel('Heigth (m)');
grid on
pause(0.001);
delete(ball);
subplot(3,1,2);
grid on
axis([0 10 0 500]);
title('Position as function of time');
xlabel('Time (sec)');
ylabel('Position (m)');
n(1,1)=t(i);
n(1,2)=y(i,1);
line2=line([j(1) n(1)],[j(2) n(2)]);
j(1,1)=t(i);
j(1,2)=y(i,1);
subplot(3,1,3);
grid on
axis([0 10 -200 0]);
title('Velocity as function of time');
xlabel('Time (sec)');
ylabel('Velocity (m/s)');
pv(1,1)=t(i);
pv(1,2)=y(i,2);
line3=line([a(1) pv(1)],[a(2) pv(2)],'color','r');
a(1,1)=t(i);
a(1,2)=pv(1,2);
end