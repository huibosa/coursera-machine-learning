alpha = 0.1;
num_iters = 50;
theta = zeros(3, 1);

[~, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

plot(1:num_iters, J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
