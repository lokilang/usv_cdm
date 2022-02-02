clear all, close all, clc;

% Designated heading angle
angle = rad2deg(0.03);

% State equations
A = [0 1; -8.31 -6.08];
B = [0; 8.31];
C = [1 0];

% Augmented state
Aa = [0 1 0; -8.31 -6.08 0; -1 0 0];
Ba = [0; 8.31; 0];

% Find the controllability matrix
M = [Ba Aa*Ba Aa^2*Ba];
% M = ctrb(Aa,Ba);

% Define the stability index and constant time
gamma = [2.5 2 2];
ts = 3;
tau = 1/3*ts;
alpha0 = (gamma(3)*gamma(2)^2*gamma(1)^3)/(tau^4);
alpha1 = alpha0*tau;
alpha2 = alpha0*[(tau^2)/gamma(1)];
alpha3 = alpha0*[(tau^3) / (gamma(2) * gamma(1)^2)];

P = [alpha3 alpha2 alpha1 alpha0];

phi = [Aa^3 + P(1,1)*Aa^2 + P(1,2)*Aa + P(1,3)*eye(3)];

Con = inv(M)*phi;
K = [0 0 1]*Con;
