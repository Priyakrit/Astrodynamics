clc; clear;
mu = 398600;
m0 = 900; % mass of the satellite in kg
r0 = 6678; % radius of circular orbit km
vo = sqrt(mu/r0);
r = 42164;
isp = 8000;
g = 0.009807;
T = 2200*10^-6;

t = m0*g*isp/T*(1-exp(sqrt(mu)/(isp*g)*(sqrt(1/r)-sqrt(1/r0))));% time of burn untill GEO is seconds
t_days = t/86400;

mp = T/(isp*g)*t; %mass of propellant used in kg
fprintf('Time of burn untill GEO: %f s\n',t)
fprintf('Mass of Propellant burned %f kg\n',mp)
