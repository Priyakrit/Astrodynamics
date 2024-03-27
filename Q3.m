clc; clear;
%position and velocity from initial orbital elements
mu = 398600.4418; %km3/s2 https://iau-a3.gitlab.io/NSFA/NSFA_cbe.html#GME2009 source
a = 7016; %semi major axis in km
ecc = 0.05; % eccentricity of the orbit
i = 45; % orbital inclination in degrees (is constant)
omega = 0; % longitude of ascending node (is constant)
w = 20; %argument of periapsis (is constant)
nu = 20;% true anomaly

E = 2*atan2(sqrt(1-ecc)*sind(nu/2),sqrt(1+ecc)*cosd(nu/2));
if E <0
    E = E+360;
end
fprintf('Eccentric Anomaly is %0.8f radians\n', E)

r = a*(1-ecc*cosd(E));
fprintf('Radius at t0 is %0.8f km\n', r)

%% velocity calculations
% specific angular momentum
h = sqrt(a*mu*(1-ecc^2)); % im km2/s
% velocity
v = h/r;
fprintf('Velocity at t0 = %0.8f km/s\n',v)

%% mean anomaly
E_degrees = E*180/pi;
Me = E_degrees - ecc*sind(E_degrees);
Me = Me*pi/180;
fprintf('Mean Anomaly is %0.8f radians\n',Me)

%% Time perios calculation
T = 2*pi*sqrt((a^3/mu)); %% formula from curtis
% find t_o to be implemented in curtis algorithm
t_o = Me*T/(2*pi);

t_new = t_o + 3600;
Me_new = t_new/T*2*pi; %new guess for mean anomaly

if Me_new>pi
    Enew = Me_new -ecc/2;
else
    Enew = Me_new +ecc/2;
end

Enew = Enew-(Enew-ecc*sin(Enew)-Me_new)/(1-ecc*cos(Enew));

fprintf('The new eccentric anomaly after 1 iteration %0.8f radians\n',Enew)


