% Scripts for section 3
data = load('./ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = size(X, 1);
n = size(X, 2);

[X, mu, sigma] = featureNormalize(X);

X = [ones(m, 1), X];

alpha = 1;
num_iters = 500;
theta = zeros(3, 1);
[~, J_history] = gradientDescent(X, y, theta, alpha, num_iters);
plot(1:num_iters, J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
