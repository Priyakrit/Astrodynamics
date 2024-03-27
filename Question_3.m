clc; clear;
r1 = [50200 114100 5100];
r2 = [85600 115300 0];
r3 = [56300 112800 3600];
r4 = [81400 98800 -4100];
m1 = 1;
m2 = 2.06*m1;
m3 = 5.67*m1;
m4 = 6.72*m1;
mass = [m1 m2 m3 m4];
fprintf('Distance between 1 & 2 %0.8f km\n',norm(r2-r1))
fprintf('Distance between 1 & 3 %0.8f km\n',norm(r3-r1))
fprintf('Distance between 1 & 4 %0.8f km\n',norm(r4-r1))
fprintf('Distance between 2 & 3 %0.8f km\n',norm(r2-r3))
fprintf('Distance between 2 & 4 %0.8f km\n',norm(r2-r4))
fprintf('Distance between 3 & 4 %0.8f km\n\n',norm(r3-r4))
%% gravitation forces
fprintf('Force between 1 & 2 %g x G*M1^2 \n',m1*m2/(norm(r2-r1))^2)
fprintf('Force between 1 & 3 %g x G*M1^2 \n',m1*m3/(norm(r3-r1))^2)
fprintf('Force between 1 & 4 %g x G*M1^2 \n',m1*m4/(norm(r4-r1))^2)
fprintf('Force between 2 & 3 %g x G*M1^2 \n',m2*m3/(norm(r3-r2))^2)
fprintf('Force between 2 & 4 %g x G*M1^2 \n',m2*m4/(norm(r4-r2))^2)
fprintf('Force between 3 & 4 %g x G*M1^2 \n\n',m3*m4/(norm(r4-r3))^2)

%% COM
COM = (r1 + m2*r2 +m3*r3 + m4*r4)/sum(mass);
fprintf('Centre of mass %0.8f x + %0.8f y + %0.8f z km\n', COM)
%% Velocity
mu = 1.32712440041e19/(1000)^3; %converting m3/s2 to km3/s2 value of sun from https://iau-a3.gitlab.io/NSFA/NSFA_cbe.html#GME2009
v = sqrt(mu/norm(COM));
fprintf('Velocity of the asteroid system %0.8f km/s\n', v)
%% Angular Momentum
m = 4.62e18;
M = m*sum(mass);
H = M*v*norm(COM);
fprintf('Total Angular Momentum of the asteroid system %0.8g kg*km2/s\n\n', H)

%% gravity between sun and asteroids

mu = 1.32712440041e19; % in terms of m
G = 6.6743e-11; %Nm2/kg2
% force between 1 and 3
F13 = G*m1*m3*m^2/(norm(r3-r1)*1000)^2; %N
% Force between sun and asteroids
Forces_sun = m*[mu*m1/(norm(r1)*1000)^2 mu*m2/(norm(r2)*1000)^2 mu*m3/(norm(r3)*1000)^2 mu*m4/(norm(r4)*1000)^2]; %N

Ratio = min(Forces_sun)/F13;



