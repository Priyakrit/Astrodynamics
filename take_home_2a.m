clc; clear;
r = [5572 -3457 2376];
mag_r = norm(r);
v =[-4.7689 -5.6113 3.0535];
mag_v = norm(v);
mu = 398600.4418;
%% Part A
a = 1/(2/mag_r-(mag_v^2/mu));
fprintf('Semi Major Axis = %0.8f km\n',a)
%% PART B
r_unit = r/mag_r;
e_vec = cross(v,cross(r,v))/mu-r_unit;
fprintf('The eccentricity of the orbit %0.8f\n', norm(e_vec))
%% PART C
h = cross(r,v);
i = acosd(h(3)/norm(h));
fprintf('The angle of inclination %0.8f\n', i)
%% PART D
N = cross ([0 0 1],h);
omega = acosd(N(1)/norm(N));
fprintf('Longitude of Ascending Node %0.8f degree\n', omega)
%% PART E
w = acosd(dot(N,e_vec)/(norm(N)*norm(e_vec)));
fprintf('Argument of Periapsis %0.8f degree\n', w)
%% Part F
nu = acosd(dot(r,e_vec)/(norm(r)*norm(e_vec)));
fprintf('True Anomaly %0.8f degree\n', nu)