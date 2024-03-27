clc; clear;
Re = 149.4*10^6;
Rj = 778.479*10^6;
rj = 71492;
mu_s = 132.7*10^9;
mu_j = 126.7*10^6;
Ra = Rj-rj-20000;
a1 = (Re+Ra)/2;
e1 = (Ra-Re)/(Re+Ra);
h1 = sqrt(a1*mu_s*(1-e1));
fprintf('Semi Major Axis of Orbit 1: %g km\n',a1)
Vj  = sqrt(mu_s/Rj);

V_1 = sqrt(mu_s*(2/Ra-1/a1));
V_inf = Vj-V_1;

%Hyperbolic Swing Trajectory
rp = rj + 200000;
e_h = 1 + (rp)*V_inf^2/mu_j;
fprintf('Eccentricy of Hyperbolic Trajectory = %g \n',e_h)
%turn angle
delta = 2*asind(1/e_h);
fprintf('Turn angle = %g degrees\n',delta)
del_1 = 180; %angle of incoming trajectory
del_2 = del_1+delta;
V_2 = [Vj + V_inf*cosd(del_2) V_inf*sind(del_2)];
fprintf('Velocity at outbound crossing %g uv %f us km/s\n',V_2)
del_V = [V_2(1)-V_1 V_2(2)];
del_V = norm(del_V);
fprintf('Delta V from Jupiters gravity: %g km/s\n',del_V)
% Angular momentum after hyperbolic
h2 = Rj*V_2(1);
fprintf('Specific Angular Momemntum after flyby: %g km2/s\n', h2)
a2 = -mu_s/2/(norm(V_2)^2/2-mu_s/Rj);
fprintf('Semi Major Axis of Orbit 2: %g km\n',a2)
e2 = sqrt(1 - h2^2/a2/mu_s);
fprintf('Eccentricity of new orbit: %g \n',e2)
% calculate the true anomaly of current position to find apse line change
theta = acosd((h2^2/mu_s/Rj-1)/e2);
fprintf('The true anomaly of sattellite position in orbit 2: %g degreees \n',theta)

% Orbit Comparision
fprintf('Ratio of semi-major axis of orbit 2 w.r.t to Orbit 1: %g\n', a2/a1)