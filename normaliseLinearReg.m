function [yNormalised] = normaliseLinearReg(y)

mu = 0;
sDeviation = 0;
;               %normailising
yNormalised= zeros(size(y));


mu2 = mean(y);
sDeviation2 = std(y);
yNormalised = (y-mu2)/sDeviation2;


end

