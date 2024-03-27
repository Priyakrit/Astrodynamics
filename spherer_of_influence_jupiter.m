clc; clear;
%Spheres of influence
mJ = 1898.13*10^24;
R = 778.479*10^6; %jupiters orbit radius (using the value for semi major axis assuming orbits nearly are circular)
mS = 1.989*10^30;

RSOI = R*(mJ/mS)^(2/5);

RSOI/71492