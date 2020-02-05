%
% Math 210 -- Chartier
% Assignment 2
%
% Program: buffon.m
% Author:  (include your name)
%
% Buffon's Needle Experiment
% with L = D = 1
%
% Description: This program simulates Buffon's Needle experiment
% in the clase where L = D = 1. 
%-------------------------------------------------------------------
%-------------------------------------------------------------------
%

L=3;  % length of the needle
D=4;  % distance between thex lines
drops=530;
trials = 10000; % Number of times to repeat experiment
fprintf('\n=============================\n');
fprintf('Buffon''s Needle Experiment\n');
fprintf('=============================\n\n');

fprintf('Total drops   Estimate for Pi\n');
fprintf('=============================\n');

crossings=0;
estimates = zeros([trials drops]);
for t=1:trials
    crossings = 0;
    n = drops;
    for i=1:n
      vertical_position = rand*D;
      theta = pi*rand;
      if (vertical_position <= L*sin(theta))
        crossings = crossings+1;
      end
      if (mod(i,floor(n/10))==0) 
%           fprintf('%8d   %10.5f\n', i, (2*L*i)/(D*crossings));
      end
      estimates(t, i) = (2*L*i)/(D*crossings);
    end
end
% fprintf('\nFinal Estimate after %8d drops: %10.5f\n', n, (2*L*n)/(D*crossings));
% fprintf('Length of Needle       = %d\n',L);
% fprintf('Distance between Lines = %d\n\n',D);

difference = abs(estimates - pi);
prob = sum(0.00070734641 >= difference(:,drops))/trials * 100;
disp(prob)  % Display proportion of all attepmts that got less than 0.000707 off of pi
