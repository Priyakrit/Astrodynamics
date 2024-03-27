clc;
clear;
%% Given Variables
a = 7016; % km apoapsis
e = 0.05; % eccentricity
i0 = 45 * pi/180; % radians orbital inclination
Omega0 = 0; % radians big omega, logitude of the ascending node
omega0 = 20 * pi/180; % radians small omega, argument of the periapsis
nu0 = 20 * pi/180; % radians true anomaly
mu = 398600; % km^3/s^2 body's mass * G
h = sqrt(a*mu*(1-(e^2))); % km^2/s angular momentum
%% Find Position at t0
r0 = (a*(1-e^2))/(1+e*cos(nu0)); % Calculate position, which in this case is initial posistion
r_x = r0 * (cos(Omega0) * cos(nu0) - sin(Omega0) * sin(nu0) * cos(i0)); % formula for x direction of position
r_y = r0 * (sin(Omega0) * cos(nu0) + cos(Omega0) * sin(nu0) * cos(i0)); % formula for y direction of position
r_z = r0 * (sin(nu0) * sin(i0)); % formula for z direction of position
r_vector0 = [r_x r_y r_z]; % position vector, r at t = 0
disp('The position at initial time is:');
disp(r_vector0);
%% Find Velocity at t0
v0 = sqrt(mu*((2/r0)-(1/a))); % Calculate velocity, which in this case is initial velocity
v_x = -mu/h * (cos(Omega0)*(sin(nu0) + e*sin(omega0)) + sin(Omega0)*(cos(nu0) + e*cos(omega0))*cos(i0)); % formula for x direction of velocity
v_y = -mu/h * (sin(Omega0)*(sin(nu0) + e*sin(omega0)) - cos(Omega0)*(cos(nu0) + e*cos(omega0))*cos(i0)); % formula for y direction of velocity
v_z = mu/h * ((cos(nu0) + e*cos(omega0))*sin(i0));
% formula for z direction of
v_vector0 = [v_x v_y v_z];
% velocity vector, v at t = 0
disp('The velocity at initial time is:');
disp(v_vector0);
%% What is the eccentric anomaly at t0
E0 = atan(sqrt(1-e^2)*sin(nu0)/(cos(nu0)+e)); % formula for eccentric anomaly
disp('The eccentric anomaly at initial time is:');
disp(E0*180/pi); % Convert from radians to degrees
%% What is the mean anomaly at t0
Me = E0 - e*sin(E0); % formula for mean anomaly
disp('The mean anomaly at initial time is:');
disp(Me*180/pi); % Convert from radians to degrees
%% Solve the first iteration for E1
E1 = E0 - (E0-e*sin(E0)-Me)/(1-e*cos(E0));
disp('The first iteration, E1 is:')
disp(E1*180/pi);