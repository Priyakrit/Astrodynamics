clc; clear;
r = [5572 -3457 2376];
mag_r = norm(r);
v =[-4.7689 -5.6113 3.0535];
mag_v = norm(v);
mu = 398600.4418;

r_unit = r/mag_r;

e_vec = cross(v,cross(r,v))/mu-r_unit;
fprintf('The eccentricity of the orbit %0.8f\n', norm(e_vec))