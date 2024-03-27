% Finding orbital parameter from radius and velocity
%% Setting initial Conditions and Assumptions
clc; clear;
Ix = [1 0 0];
Iy = [0 1 0];
Iz = [0 0 1];

mu = 398600.4418; %km3/s2 https://iau-a3.gitlab.io/NSFA/NSFA_cbe.html#GME2009 source
r = [5572 -3457 2376];
mag_r = sqrt(r(1)^2+r(2)^2+r(3)^2);
v =[-4.7689 -5.6113 3.0535];
fprintf('Orital Parameters for orbit with conditions \n R = ')
disp(r)
fprintf('V =    ')
disp(v)

%% Angular Momentum

h = cross(r,v);
format long
fprintf('Magnitude of Specific angular momentum %.8f km2/s \n', norm(h))

%% eccentricity calculations

e = cross(v,h)/mu-(r/mag_r);
ecc = sqrt(e(1)^2+e(2)^2+e(3)^2);
fprintf('Eccentricity %.8f\n', ecc)

%% semi latus rectum

p = norm(h)^2/mu;
fprintf('Semi latus rectum P = %.8f km\n', p)

%% semi major axis

a = p/(1-ecc^2);
fprintf('Semi major Axis a = %.8f km\n', a)

%% Longitude of ascending node

n = cross(Iz,h);
omega = atan2d(dot(n,Iy),dot(n,Ix));
fprintf('Longitude of ascending node (omega) = %.8f degree\n', omega)

%% Orbital Inclination

i = atan2d(dot(h,cross(n,Iz)),norm(n)*dot(h,Iz));
fprintf('Orbital Inclination angle i = %.8f degrees\n', i);

%% Argument of Periapsis

w = atan2d(dot(e,cross(h,n)),norm(h)*dot(e,n));
fprintf('Argument of Periapsis w = %.8f degrees\n',w)

%% True Anomaly 

nu = atan2d(dot(r,cross(h,e)),norm(h)*dot(r,e));
if nu <0
    nu = nu +360;
end
fprintf('True anomaly v (nu) = %.8f degrees\n',nu)

%% Orbital Period

T = 2*pi*sqrt(a^3/mu);
fprintf('Orbital period is %.8f s\n',T)

%% Eccentric Anomaly Calculations

E = 2*atan2d(sqrt(1-ecc)*sind(nu/2),sqrt(1+ecc)*cosd(nu/2));
if E <0
    E = E+360;
end
fprintf('Orbital Anomaly is %0.8f degrees\n', E)

Echeck = 2*atan2d(sqrt(1+ecc)*sind(E/2),sqrt(1-ecc)*cosd(E/2));

% Compare Echeck to nu to verify calculations are correct and you haven't completely lost your mind