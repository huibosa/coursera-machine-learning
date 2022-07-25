load ('ex5data1.mat');
% m = Number of examples
m = size(X, 1);

p = 8;
% Map X onto Polynomial Features and Normalize
X_poly = polyFeatures(X, p);
[X_poly, mu, sigma] = featureNormalize(X_poly); % Normalize
X_poly = [ones(m, 1), X_poly]; % Add Ones
% Map X_poly_test and normalize (using mu and sigma)
X_poly_test = polyFeatures(Xtest, p);
X_poly_test = X_poly_test - mu; % uses implicit expansion instead of bsxfun
X_poly_test = X_poly_test ./ sigma; % uses implicit expansion instead of bsxfun
X_poly_test = [ones(size(X_poly_test, 1), 1), X_poly_test]; % Add Ones
% Map X_poly_val and normalize (using mu and sigma)
X_poly_val = polyFeatures(Xval, p);
X_poly_val = X_poly_val - mu; % uses implicit expansion instead of bsxfun
X_poly_val = X_poly_val ./ sigma; % uses implicit expansion instead of bsxfun
X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val]; % Add Ones

% lambda = 1;
lambda = 100;
[theta] = trainLinearReg(X_poly, y, lambda);

plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
plotFit(min(X), max(X), mu, sigma, theta, p);
xlabel('Change in water level(x)');
ylabel('Water flow out of the dam (y)');
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));

% hold on;

% [error_train, error_val] = learningCurve(X_poly, y, X_poly_val, yval, lambda);
% plot(1:m, error_train, 1:m, error_val);
% title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
% xlabel('Number of training examples')
% ylabel('Error')
% axis([0 13 0 100])
% legend('Train', 'Cross Validation')
