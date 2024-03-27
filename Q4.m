clc; clear;

% MATLAB Code to find the eccentricity and velodity, given radius at apogee and perigee
alt_apogee = 2000;
alt_perigee = 500;
mu = 398600.4418;

ra = 6378.1366 + alt_apogee;
rp = 6378.1366 +alt_perigee;

e = (ra-rp)/(ra+rp);
fprintf('The eccentricity for the orbit is %.8f \n', e)

a = (ra+rp)/2;
va = sqrt(mu/a)*sqrt((1-e)/(1+e));
vp = sqrt(mu/a)*sqrt((1+e)/(1-e));

fprintf('The mimimum velocity occurs at the apogee,v_apogee = %.8f km/s \n',va)
fprintf('The maximum velocity occurs at the perigee,v_perigee = %.8f km/s \n',vp)
T = 2*pi*sqrt(a^3/mu);

fprintf('The time period for given orbit is %0.8f s \n',T)
