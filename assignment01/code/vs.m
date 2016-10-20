% # EFME 1. assignment
% # Koray Koska, 1528624

function [loopsTime, vectorizedTime] = vs(A, u_0, v_0, M, N)
% # with loops

tic;
for x = 1:M
    for y = 1:N
        % ## TASK 3.1: calculate f(x,y)
        f(x,y) = A * sin(u_0 * x + v_0 * y);
    end
end
toc;
loopsTime = toc;

% # show loop result
figure;
subplot(1,2,1), imshow(f, []);
title('Loops', 'fontsize', 16);

% #-----------------------------------------

% # with matrices
% ## TASK 3.2: create matrices yi and xi in a single line of code
% #
% # matrices yi and xi should look as follows:
% #
% # yi = 1 2 3 4 ... 512
% #      1 2 3 4 ... 512
% #      . . . . ... ...
% #
% # xi = 1   1   1   1   ... 1
% #      2   2   2   2   ... 2
% #      3   3   3   3   ... 3
% #      .   .   .   .   ... .
% #      512 512 512 512 ... 512
% #
yi = repmat([1:N], M, 1);
xi = yi';

tic;
% ## TASK 3.3: Calculate f in a single line of code with the help of yi and xi.
f = A * sin(u_0 * xi + v_0 * yi);
toc;
vectorizedTime = toc;

% # show matrices result
subplot(1,2,2), imshow(f, []);
title('Matrices', 'fontsize', 16);

end
