clc; clear;
rp = 9100; %orbit 1 radius of periapsis
ra = 18900; % orbit 1 radius of apopasis
mu = 398600;

a = (rp+ra)/2;
e = (ra-rp)/(ra+rp);

T = 2*pi*a^(3/2)/sqrt(mu);
E1c = 2*atan(sqrt((1-e)/(1+e))*tand(150/2));
E1b = 2*atan(sqrt((1-e)/(1+e))*tand(45/2));
Meb = E1b - e*sin(E1b);
Mec = E1c - e*sin(E1c);


T_b = Meb/(2*pi)*T; % time passed since perigee to get to point B
T_c = Mec/(2*pi)*T; % time passed since perigee for C

Tof = T - (T_c - T_b);
a2 = (Tof*sqrt(mu)/(2*pi))^(2/3); % Semi major axis for phasing orbit based time to catch up
fprintf('Semi major axis for phasing orbit %f km\n',a2);

%% Position vectors for B and C

h1 = sqrt(mu*(1+e)*rp);

rb = h1^2/(mu*(1+e*cosd(45)));
rc = h1^2/(mu*(1+e*cosd(150)));
fprintf('Position Vector for B %f km \n',rb)

%% Orbit 2 elements
ra2 = 2*a2-rb;
e2 = (ra2-rb)/(ra2+rb);
h2 = sqrt(2*mu*ra2*rb/(ra2+rb));


%% Velocity Determinations for Point B

Vb1_parallel = h1/rb;
Vb1_perp = mu/h1*e*sind(45);

VB1 = norm([Vb1_parallel Vb1_perp]);
gamma_b1 = atand(Vb1_perp/Vb1_parallel);

VB2 = h2/rb; %No perpendicular velocity (since it is at perigee)
gamma_b2 = 0;% position 2 at perigee

Del_V = 2*sqrt(VB1^2+VB2^2-2*VB1*VB2*cosd(gamma_b2-gamma_b1)); % the multiplier two added since the Del V same for switching in an out of the trasnfer orbit
fprintf('Specific Angular Momentum for Orbit 1: %f km \n',h1)
fprintf('Specific Angular Momentum for Orbit 2: %f km \n',h2)
fprintf('Velocty Components for B in Orbit 1: [ %f\t %f ]km \n',[Vb1_parallel, Vb1_perp])
fprintf('Velocty Components for B in Orbit 2: [ %f\t %f ]km \n',[VB2, 0])
fprintf('The Delta V required for phasing operation: %f km/s\n',Del_V)


