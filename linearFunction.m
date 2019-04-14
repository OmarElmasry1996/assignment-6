function [  ] = linearFunction( data )


x1 = data(1:17999,4:18); %18features 
y1 = data(1:17999,3); % price

[row column1] = size(x1);
m = row;

thetas1 = randn(column1+1,1);
htheta1 = thetas1;

x0 = ones(m,1);
xFeatures1 = [x0 x1];
[ yNormalised1 ] = normaliseLinearReg(y1);       

[ cost1,thetas1 ] = gradientDescent( xFeatures1,thetas1,m,yNormalised1 );

z = [1:2000];

figure()
plot(z,cost1);

end

