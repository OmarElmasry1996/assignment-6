clc
clear all
close all

DataTable = readtable('house_prices_data_training_data.csv');
x = table2array(DataTable(1:17999,4:21));

[x_normalised] = normalise(x);

Corr_x = corr(x_normalised);

x_cov = cov(x_normalised); 

[rows columns] = size(x);

U = zeros(columns);         %eigen values
S = zeros(columns);         %diagonal eigen values
V = zeros(columns);

[U S V] =  svd(x_cov);

a = zeros(size(1,columns));
    
    
for k = 1:18                %%%%%DIMENSION REDUCTION

    
    numerator = trace(S(1:k,1:k));
    denomenator = trace(S);
    a(k) = 1 - (numerator/denomenator);
  
    
    if a(k) <= 0.001
       
        break
    end
    
end


R =  U(:,1:k)' * x_normalised';
approx_data = U(:,1:k)*R;

error = (1/columns)*(sum((approx_data' - x_normalised).^2))/sum(x_normalised.^2);

linearFunction(approx_data');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%