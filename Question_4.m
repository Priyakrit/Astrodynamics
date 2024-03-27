clc; clear;
mu = 398600;
r1 = [ 3600 4600 3600];
r2 = [-5900 6140 5200];
dt = 30*60;
string = 'pro';
%...
%...Algorithm 5.2:
[v1, v2] = lambert(r1, r2, dt, string);
R1 = norm(r1);
V1 = norm(v1);
a = 1/(2/R1-(V1^2/mu));
epsilon = -mu/(2*a);
fprintf('Specific Energy of the orbit = %0.4f km2/s2\n',epsilon)