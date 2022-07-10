data = load('ex2data1.txt');
X = data(:, [1, 2]);
y = data(:, 3);

%  Setup the data matrix appropriately
[m, n] = size(X);

% Add intercept term to X
X = [ones(m, 1) X];

% Initialize the fitting parameters
initial_theta = zeros(n + 1, 1);

lambda = 0;

%  Set options for fminunc
options = optimoptions(@fminunc, 'Algorithm', 'Quasi-Newton', 'GradObj', 'on', 'MaxIter', 1000);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost
[theta, J, exit_flag] = fminunc(@(t)(costFunction(t, X, y, lambda)), initial_theta, options);

% Print theta
% fprintf('Cost at theta found by fminunc: %f\n', cost);
% disp('theta:'); disp(theta);

% Plot Boundary
plotDecisionBoundary(theta, X, y);

hold on;

title(sprintf('lambda = %g', lambda));
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')
legend('y = 1', 'y = 0', 'Decision boundary');

hold off;
