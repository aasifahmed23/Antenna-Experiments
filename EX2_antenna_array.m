%%
% Array Factor
clc; clear all; close all;
theta=[0:1:360]*(pi/180);
phi=[0:0.5:180]*(pi/180);
lambda= 0.001; % in meters
K0= 2*pi/lambda;
I0= 1e-6; % deault value 1 micro ampheres
N=9; % for a 20 element array use N=19
d= 1e-4; % in meters % use spacing less than lambda, suggested 0.0001, try 0.001 and 0.00001
alpha=-17*pi/180; % progressive phase shift on degrees, suggested 20 degrees
% alpha=-K0;
U0=alpha*d;
% cos_psi= sin(theta).*cos(phi);
cos_psi= sin(theta).*sin(phi);
% cos_psi= cos(theta);
U=K0*d*cos_psi;
AF=I0*(N+1)*sinc(((N+1)/2)*(U+U0))./sinc((U+U0)/2);
figure('Color',[0.97 0.97 0.97]);
colormap('jet');
polar(theta,AF);
figure('Color',[0.97 0.97 0.97]);
colormap('jet');
polar(phi,AF);
figure('Color',[0.97 0.97 0.97]);
colormap('jet');
plot(U,abs(AF))
%plot(U,abs(AF)/max(AF)) % Normalized
% ## Exp 1 - Try for different orientations of array elements. [ Array Axis along Y and Z axis] 
% ## Exp 2 - Try for different number of array elements. [200, 100 & 10] 
% ## Exp 3 - Try for different progressive phase shifts of excitations of array elements. [ 18, 180, -K0]
% ## Exp 4 - Try for different combinations of Exp 1, 2 and 3. 
% Array along Z axis, 100 elements, progressive phase shifts = 25 degrees etc 
% Array along Y axis, 200 elements, progressive phase shifts = -K0 degrees etc
% ## Exp 5 - Find HPBW, BWFN from Normalized plots, write some additional codes.