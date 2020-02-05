% Name: simulateStephCurry.m
% Author: Tim Chartier for Math 210, Davidson College
%
numberOfExperiments = 100;
shootingPercentage = .453;
targetNumberMadeShots = 11; numberOfShots = 13;
goodOrBetterThanCurry = 0;

for i=1:numberOfExperiments
    madeShots = 0;
    for j = 1:numberOfShots
        % Pick a random number
        randomNumber = rand;
        
        % see if shot made
        if (randomNumber <= shootingPercentage)
            madeShots = madeShots + 1;
        end
    end
    if (madeShots >= targetNumberMadeShots)
        goodOrBetterThanCurry = goodOrBetterThanCurry + 1;
    end
end

estimatedProbability = goodOrBetterThanCurry/numberOfExperiments*100;

fprintf('We made at least 11 of 13 shots %4.2f%% of the time.\n',estimatedProbability);