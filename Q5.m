clc; clear;
% calculating the orbital inclination of a sun synchronous orbit
r = 6378.166; % radius of the earth in km
ra = r+600;
rp = r+300;
mu = 398600.4418;

e = (ra-rp)/(ra+rp);
a = (ra+rp)/2;

T = 2*pi*sqrt(a^3/mu);
omega_dot = 2*pi/(365.26*86400); %RAAN change in radians/s
cos_i = omega_dot/(-3/2*(0.0010826*sqrt(mu)*r^2)/((1-e^2)*a^3.5));
i = acosd(cos_i);

fprintf('The orbital inclination is %0.8f degrees \n',i)