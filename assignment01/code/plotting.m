% # EFME 1. assignment
% # Koray Koska, 1528624

function plotting(start, stop, delta, fontsize, linewidth)
  % ## TASK 2: instructions see assignment

  x = start:delta:stop;
  figure;
  plot(x, sin(x), '-r', 'linewidth', linewidth);
  hold on;
  plot(x, cos(x), '--g');
  legend('sin(x)', 'cos(x)');
  hold off;

  xlabel('x', 'fontsize', fontsize);
  ylabel('y', 'fontsize', fontsize);
  title('Functions', 'fontsize', fontsize);

  set(gca(), 'linewidth', linewidth, 'fontsize', fontsize);

  % x, cos(x), '--g;cos(x);', 'linewidth', linewidth
end
