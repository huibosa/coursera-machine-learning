data = load('ex2data1.txt');
X = data(:, [1, 2]);
y = data(:, 3);

%  Setup the data matrix appropriately
[m, n] = size(X);

% Add intercept term to X
X = [ones(m, 1) X];

% Initialize the fitting parameters
initial_theta = zeros(n + 1, 1);

%  Set options for fminunc
options = optimoptions(@fminunc, 'Algorithm', 'Quasi-Newton', 'GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta
% fprintf('Cost at theta found by fminunc: %f\n', cost);
% disp('theta:'); disp(theta);

% Plot Boundary
plotDecisionBoundary(theta, X, y);
% Add some labels
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')
% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;
