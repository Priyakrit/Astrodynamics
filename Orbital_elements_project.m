clc; clear;
v = [17.304313393797138,-3.719285117117678, 0];
R = [778479000 0 0];
mu = 1.327000000000000e+11;
elements = coe_from_sv(v,R,mu);
fprintf('%g km2/s\n',elements(1));