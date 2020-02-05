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

L=1;  % length of the needle
D=1;  % distance between thex lines
drops=5000;
trials = 30; % Number of times to repeat experiment
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
          fprintf('%8d   %10.5f\n', i, (2*L*i)/(D*crossings));
      end
      estimates(t, i) = (2*L*i)/(D*crossings);
    end
end
fprintf('\nFinal Estimate after %8d drops: %10.5f\n', n, (2*L*n)/(D*crossings));
fprintf('Length of Needle       = %d\n',L);
fprintf('Distance between Lines = %d\n\n',D);

difference = estimates - pi;
numconverged = zeros([5000 1]);

% Check to see if there is any point where 50% of the trials have it near
% 3.1
for drop=1:drops
    numconverged(drop) = sum(difference(:, drop) > -0.1 & difference(:, drop) < 0.1)/drops;
end
converged_indexes = numconverged >= 0.5;
drop_indexes = [1:drops];
firstconverge = min(drop_indexes(converged_indexes));
disp(firstconverge);
disp(numconverged)
% Visualize approximations of pi
c = parula(100);
figure
hold on
for kk=1:trials
  plot([1:n], estimates(kk,1:n))
end
xlabel('Number Drops')
ylabel('Estimate')
ylim([0,6]);
hline = refline([0 pi]);
vline = refline([firstconverge 0]);
box on

