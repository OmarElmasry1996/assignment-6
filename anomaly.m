clc
clear all
close all

DataTable = readtable('house_prices_data_training_data.csv');
x = table2array(DataTable(1:17999,4:21));

[ rows columns ] = size(x);
train = x(1:11999,:);
test = x(12000:17999,:);


mu = mean(train);
sigma = std(train);

threshold = 0.999;
count = 0;


for j = 1:columns
    
    a(j) = normpdf( train(2,j),mu(j),sigma(j) );
    product = prod(a);
    
    if product > threshold || product < 1 - threshold
        
        count = count + 1;
        
        
    end
    
    
    
    
end

    