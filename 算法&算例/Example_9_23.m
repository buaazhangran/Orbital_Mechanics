function Example_9_23
% ~~~~~~~~~~~~~~~~~~~
%{
% This program numerically integrates Euler's equations of motion
% for the spinning top (Example 9.23, Equations (a)). The
% quaternion is used to obtain the time history of the top's
% orientation. See Figure 9.26.
% User M-functions required: rkf45, q_from_dcm, dcm_from_q, dcm_to_euler
% User subfunction required: rates
%}
%----------------------------------------------
clear all; close all; clc
%...Data from Example 9.15:
g = 9.807; % Acceleration of gravity (m/s^2)
m = 0.5; % Mass in kg
d = 0.05; % Distance of center of mass from pivot point (m)
A = 12.e-4; % Moment of inertia about body x (kg-m^2)
B = 12.e-4; % Moment of inertia about body y (kg-m^2)
C = 4.5e-4; % Moment of inertia about body z (kg-m^2)
wspin = 1000*2*pi/60; % Spin rate (rad/s)
theta = 60; % Initial nutation angle (deg)
z = [sind(theta) 0 cosd(theta)]; % Initial z-axis direction:
p = [0 1 0]; % Initial x-axis direction
% (or a line defining x-z plane)
y = cross(z,p); % y-axis direction (normal to x-z plane)
x = cross(y,z); % x-axis direction (normal to y-z plane)
i = x/norm(x); % Unit vector along x axis
j = y/norm(y); % Unit vector along y axis
k = z/norm(z); % Unit vector along z axis
QXx = [i; j; k]; % Initial direction cosine matrix
q0 = q_from_dcm(QXx);% Initial quaternion
w0 = [0 0 wspin]'; % Initial body-frame angular velocities (rad/s)
t0 = 0; % Initial time (s)
tf = 2; % Final time (s)
f0 = [q0; w0]; % Initial conditions vector
% (quaternion & angular velocities):
[t,f] = rkf45(@rates, [t0,tf], f0); % RKF4(5) numerical ODE solver.
% Time derivatives computed in
% function 'rates' below.
q = f(:,1:4); % Solution for quaternion at 'nsteps' times from t0 to tf
wx = f(:,5); % Solution for angular velociites
wy = f(:,6); % at 'nsteps' times
wz = f(:,7); % from t0 to tf
for m = 1:length(t)
QXx = dcm_from_q(q(m,:));% DCM from quaternion
[prec(m) nut(m) spin(m)] = dcm_to_euler(QXx); % Euler angles from DCM
end
plotit
%~~~~~~~~~~~~~~~~~~~~~~~~~
function dfdt = rates(t,f)
%~~~~~~~~~~~~~~~~~~~~~~~~~
q = f(1:4); % components of quaternion
wx = f(5); % angular velocity along x
wy = f(6); % angular velocity along y
wz = f(7); % angular velocity along z
q = q/norm(q); % normalize the quaternion
Q = dcm_from_q(q); % DCM from quaternion
%...Body frame components of the moment of the weight vector
% about the pivot point:
M = Q*[-m*g*d*Q(3,2)
m*g*d*Q(3,1)
0];
%...Skew-symmetric matrix of angular velocities:
Omega = [ 0 wz -wy wx
-wz 0 wx wy
wy -wx 0 wz
-wx -wy -wz 0];
q_dot = Omega*q/2; % time derivative of quaternion
%...Euler's equations:
wx_dot = M(1)/A - (C - B)*wy*wz/A; % time derivative of wx
wy_dot = M(2)/B - (A - C)*wz*wx/B; % time derivative of wy
wz_dot = M(3)/C - (B - A)*wx*wy/C; % time derivative of wz
%...Return the rates in a column vector:
dfdt = [q_dot; wx_dot; wy_dot; wz_dot];
end %rates
%~~~~~~~~~~~~~~
function plotit
%~~~~~~~~~~~~~~
figure(1) % Euler angles
subplot(311)
plot(t, prec )
xlabel('time (s)')
ylabel('Precession angle (deg)')
axis([-inf, inf, -inf, inf])
grid
subplot(312)
plot(t, nut)
xlabel('time (s)')
ylabel('Nutation angle (deg)')
axis([-inf, inf, -inf, inf])
grid
subplot(313)
plot(t, spin)
xlabel('time (s)')
ylabel('Spin angle (deg)')
axis([-inf, inf, -inf, inf])
grid
end %plotit
end %Example_9_23
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
