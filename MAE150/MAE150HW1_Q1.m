clear all; clc
%% Figure A
x = [3,3,4,4,5,5,6,6,3];
y = [2,4,4,3,3,4,4,2,2];
plot(x,y)
hold on

%% Q1.1 Translation
tx = 3;
ty = 1;
x1 = x + tx;
y1 = y + ty;
plot(x1,y1)

%% Q1.2 Reflection
refx = -1;
refy = 1;
x2 = refx*x1;
y2 = refy*y1;
plot(x2,y2)

%% Q1.3 Scale
sx = 0.6;
sy = 0.6;
pivx = 6;
pivy = -3;
xp = x2 - pivx;
yp = y2 - pivy;
xs = sx * xp;
ys = sy * yp;
x3 = xs + pivx;
y3 = ys + pivy;
plot(x3,y3)

%% Q1.4 Rotation 45deg CCW = -45deg CW
angle = -pi/4;
pivx2 = 7;
pivy2 = -2;
xp2 = x3 - pivx2;
yp2 = y3 - pivy2;
xr = xp2*cos(angle) + yp2*sin(angle);
yr = -xp2*sin(angle) + yp2*cos(angle);
x4 = xr + pivx2;
y4 = yr + pivy2;
plot(x4,y4)
hold off
