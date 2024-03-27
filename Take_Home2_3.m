clc;clear;
mu_s = 1.327*10^11;
mu_e = 398600;
Isp = 295;
g0 = 0.009807;

Re = 149.6*10^6;
Rm = 227.9*10^6;
r_e = 6378;
h = 285;

v_inf = sqrt(mu_s/Re)*(sqrt(2*Rm/(Re+Rm))-1);
Vc = sqrt(mu_e/(r_e+h));

Del_V = Vc*(sqrt(2+(v_inf/Vc)^2)-1);
beta = acosd(1/(1+((r_e+h)*v_inf^2/mu_e)));

ratio = 1 -exp(-Del_V/(Isp*g0));
fprintf('The Delta V required to transition to departure hyperbola: %f km/s\n',Del_V)
fprintf('Position of the perigee of the departure hyperbola is %f degrees\n',beta)
fprintf('The percentage of mass that must be porpellant: %f \n',ratio*100)