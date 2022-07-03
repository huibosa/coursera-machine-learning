data = load('./ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

[X, mu, sigma] = featureNormalize(X);
X = [ones(m, 1), X];

alpha = 0.1;
num_iters = 400;
theta = zeros(3, 1);
[theta, ~] = gradientDescentMulti(X, y, theta, alpha, num_iters);

sample = [2300, 4];
sample = (sample - mu) ./ sigma;
sample = [1, sample];
price = sample * theta;
