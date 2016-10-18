# EFME 1. assignment
# Koray Koska, 1528624

function plotting(start, stop, delta, fontsize, linewidth)
  ## TASK 2: instructions see assignment

  x = start:delta:stop;
  plot(x, sin(x), '-r;sin(x);', 'linewidth', linewidth, x, cos(x), '--g;cos(x);', 'linewidth', linewidth);

  xlabel('x', 'fontsize', fontsize);
  ylabel('y', 'fontsize', fontsize);
  title('Functions', 'fontsize', fontsize);

  set(gca(), 'linewidth', linewidth, 'fontsize', fontsize);

  # hold on;
  # plot(x, cos(x), '--g;cos(x);');
  # hold off;
endfunction
