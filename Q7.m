clc; clear;
SPE = -10; %specific energy for the orbit, in km2/s2
h = 70000; % specific angular momentum km2/s
mu = 398600.4418; %km3/s2 https://iau-a3.gitlab.io/NSFA/NSFA_cbe.html#GME2009 source
r = 6378;

%% calculating a from SPE
a = -mu/(2*SPE);
fprintf('The semi-major axis is %0.8f km \n',a)

%% eccentricity from relations between h and a
e = sqrt(1-h^2/(a*mu));
fprintf('The eccentricity for the orbit is %0.8f\n',e)

%% Radius of apogee and perigee from a and e
ra = a*(1+e);
rp = a*(1-e);

fprintf('Apogee altitude is %g km \n',ra-r)
fprintf('Perigee altitude is %g km \n',rp-r)

