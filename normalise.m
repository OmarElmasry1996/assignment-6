function [ x_normalised ] = normalise(x)


x_normalised = x;

mu = zeros(1,size(x,2));
stdev= zeros(1,size(x,2));

columns = size(x,2);

for i=1:columns

    mu(1,i) = mean(x(:,i)); 
    stdev(1,i) = std(x(:,i));
    x_normalised(:,i) = (x(:,i)-mu(1,i))/stdev(1,i);


end


