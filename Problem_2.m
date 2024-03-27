clc; clear;
re = 1.496*10^8; %radius of the earth in km
rm = 2.279*10^8; % radius of mars in km
mu = 1.327*10^11;% standard gravitation parameter for the fun

%% transfer orbit

a = 0.5*(re+rm);


T = 2*pi*a^(3/2)/sqrt(mu); % calculates the time in seconds
Td = T/86400;
% Coasting time in the hohmann orbit is 1/2 or the time period for the entire time

T_orbit = Td/2;
fprintf('Total time of flight %g days \n',T_orbit)

%% Calculating alpha

Tm = 2*pi*rm^(3/2)/sqrt(mu); %orbit period of mars in seconds
Tm = Tm/86400;

alpha = 180*(1- T_orbit/(Tm/2)); % calculating the initial mean anomaly of mars, by equating time since mean anomaly and time of flight

fprintf('Angular position or Mars w.r.t to Earth Sun axis, alpha = %g degrees\n',alpha)




