%% File for running multiple iteration for curtis algorithm
clc; clear;
Me = 4.183594015275927;
T = 5848.511538089154;
to = 294.1709774281926;
ratio = 1;
ecc = 0.05;

if Me < pi
    E=Me+ ecc/2;
else
    E=Me - ecc/2;
end

while abs(ratio) > 1.0e-6
    ratio = (E-ecc*sin(E)-Me)/(1-ecc*cos(E));
    E = E - ratio;
end

fprintf('The eccentric anomaly was %.8f rad\n',E)

