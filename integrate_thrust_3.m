% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [a] = integrate_thrust_3(t_burn) 
% ~~~~~~~~~~~~~~~~~~~~~~~
%{
  This function uses rkf45 to numerically integrate Equation 6.26 during
  the delta-v burn and then find the apogee of the post-burn orbit.

  The input data are for the first part of Example 6.15.

  mu        - gravitational parameter (km^3/s^2)
  RE        - earth radius (km)
  g0        - sea-level acceleration of gravity (m/s^2)
  T         - rated thrust of rocket engine (kN)
  Isp       - specific impulse of rocket engine (s) 
  m0        - initial spacecraft mass (kg)
  r0        - initial position vector (km)
  v0        - initial velocity vector (km/s)
  t0        - initial time (s)
  t_burn    - rocket motor burn time (s)
  y0        - column vector containing r0, v0 and m0
  t         - column vector of the times at which the solution is found (s)
  y         - a matrix whose elements are:
                 columns 1, 2 and 3:
                    The solution for the x, y and z components of the 
                    position vector r at the times t
                 columns 4, 5 and 6:
                    The solution for the x, y and z components of the 
                    velocity vector v at the times t
                 column 7:
                    The spacecraft mass m at the times t
  r1        - position vector after the burn (km)
  v1        - velocity vector after the burn (km/s)
  m1        - mass after the burn (kg)
  coe       - orbital elements of the post-burn trajectory
              (h e RA incl w TA a)
  ra        - position vector vector at apogee (km)
  va        - velocity vector at apogee (km)
  rmax      - apogee radius (km) 
  
  User M-functions required:  rkf45, coe_from_sv, rv_from_r0v0_ta 
  User subfunctions required: rates, output                           
%}
% ---------------------------------------------

%...Preliminaries:
global mu
deg     = pi/180;    
mu      = 398600;
RE      = 6378;
g0      = 9.807;

%...Input data:
r0      = [6678    0   0];
v0      = [  0   sqrt(mu/norm(r0)) 0];
t0      = 0;

m0      = 900;
T       = 2200*(10^-6);
Isp     = 8000;
%...end Input data

%...Integrate the equations of motion over the burn time:   
y0    = [r0 v0 m0]';
[t,y] = rkf45(@rates, [t0 t_burn], y0, 1.e-16);

%...Compute the state vector and mass after the burn:
r1  = [y(end,1) y(end,2) y(end,3)];
v1  = [y(end,4) y(end,5) y(end,6)];
m1  = y(end,7);
coe = coe_from_sv(r1,v1,mu);
e   = coe(2);  %eccentricity
TA  = coe(6);  %true anomaly (radians)
a   = coe(7);  %semimajor axis

%...Find the state vector at apogee of the post-burn trajectory:
if TA <= pi
    dtheta = pi - TA;
else
    dtheta = 3*pi - TA;
end    
[ra,va] = rv_from_r0v0_ta(r1, v1, dtheta/deg, mu);
rmax    = norm(ra);


%...Subfunctions:

%~~~~~~~~~~~~~~~~~~~~~~~~~
function dfdt = rates(t,f)
%~~~~~~~~~~~~~~~~~~~~~~~~~
%{
  This function calculates the acceleration vector using Equation 6.26.
  
  t          - time (s)
  f          - column vector containing the position vector, velocity
               vector and the mass at time t
  x, y, z    - components of the position vector (km)
  vx, vy, vz - components of the velocity vector (km/s)
  m          - mass (kg)
  r          - magnitude of the the position vector (km)
  v          - magnitude of the velocity vector (km/s)
  ax, ay, az - components of the acceleration vector (km/s^2)
  mdot       - rate of change of mass (kg/s)
  dfdt       - column vector containing the velocity and acceleration
               components and the mass rate
%}
% ------------------------
x  = f(1);  y = f(2);  z = f(3);
vx = f(4); vy = f(5); vz = f(6);
m  = f(7);

r    = norm([x y z]);
v    = norm([vx vy vz]);
ax   = -mu*x/r^3 + T/m*vx/v;
ay   = -mu*y/r^3 + T/m*vy/v;
az   = -mu*z/r^3 + T/m*vz/v;
mdot = -T*1000/g0/Isp;
    
dfdt = [vx vy vz ax ay az mdot]';

end %rates

end %integrate_thrust