function plot_j(out)
figure;
plot((out.j_real - out.j_ideal)/out.j_ideal, '-o');
hold on;
plot((out.j_real1 - out.j_ideal1)/out.j_ideal1, '-o');
plot((out.j_real2 - out.j_ideal2)/out.j_ideal2, '-o');
grid;
xlabel('Time(seconds)');
ylabel('Cost');
title('Instant cost comparison');
legend('C', 'V', 'MPC');
hold off;
end

