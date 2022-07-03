data = load('./ex1data1.txt');
X = data(:, 1);
y = data(:, 2);
m = length(y);

hold on;
plot(X, y, 'rx', 'MarkerSize', 10);

X = [ones(m, 1), X];
alpha = 0.01;
num_iters = 100000;
theta = [0; 0];
theta = gradientDescent(X, y, theta, alpha, num_iters);

plot(X(:, 2), X * theta);
