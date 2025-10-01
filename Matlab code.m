% Sample discrete data (x and y values)
x = [0 1 2 3 4 5];           % Example x-values
y = [0 0.8 0.9 0.1 -0.8 -1]; % Example y-values (e.g., y = sin(x))

% Trapezoidal Rule
I_trap = trapz(x, y);

% Simpson's Rule (requires evenly spaced x and odd number of points)
if mod(length(x),2) == 1 && all(diff(x) == diff(x(1:2)))
    I_simp = simpson_rule(x, y);
else
    I_simp = 'Simpson''s rule requires evenly spaced x and odd number of points';
end

% Display results
disp(['Trapezoidal Rule Approximation: ', num2str(I_trap)]);
disp(['Simpson''s Rule Approximation: ', num2str(I_simp)]);

% --- Simpson's Rule Function for discrete data ---
function I = simpson_rule(x, y)
    n = length(x);
    h = x(2) - x(1);
    I = y(1) + y(n);
    for i = 2:2:n-1
        I = I + 4*y(i);
    end
    for i = 3:2:n-2
        I = I + 2*y(i);
end
    I = I * h / 3;
end

