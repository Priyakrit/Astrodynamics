clc; clear;
r1 = [50200 114100 5100]*10^3; % m
r2 = [85600 115300 0]*10^3;
r3 = [56300 112800 3600]*10^3;
r4 = [81400 98800 -4100]*10^3;
m1 = 4.62e18; %kg
m2 = 2.06*m1;
m3 = 5.67*m1;
m4 = 6.72*m1;
mass = [m1 m2 m3 m4];

mu = 1.32712440041e19; % in terms of m
G = 6.6743e-11; %Nm2/kg2
% force between 1 and 3
F13 = G*m1*m3/(norm(r3-r1))^2; %N
% Force between sun and asteroids
Forces_sun = [mu*m1/(norm(r1))^2 mu*m2/(norm(r2))^2 mu*m3/(norm(r3))^2 mu*m4/(norm(r4))^2]; %N

Ratio = min(Forces_sun)/F13