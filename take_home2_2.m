clc; clear;
mu = 398600;
rb = 16000; %Position of B in km in j hat direction
e2 = 0.5;% eccentricity of orbit 2

h2 = sqrt(mu*rb*(1+e2));
v2 = h2/rb;
ra = 10000; % radius of circular orbit 1
v1 = sqrt(mu/ra);
% state vector for b

rb = [0 rb 0];
vb = [0 0 v2]; %since B is at perigee the velocity is perpendicular to the radius, in jhat direction
t = 3600; % time change to calculate the mean anomaly change

% no analytical solution to Me = E - e*sinE exists, therefore root finding
% using rv_from_r0v0_ta.m

[rc, vc] = rv_from_r0v0(rb, vb, t);

% For interception the of b by A at point C  use lamberts problem to find
% velocity components at point A and C for satellite A

ra = [10000 0 0];
[va3, vC3] = lambert(ra, rc, t, 'pro');% velocity determination of position A in orbit 3 and C in orbit 3

% Velocity vector for A in orbit 1
va1 = [0 v1 0];

Del_VA = norm(va3-va1);

