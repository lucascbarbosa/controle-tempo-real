function plot_x(x,x1,x2)
    plot(x)
    hold on
    plot(x1)
    hold on
    plot(x2)
    xlabel('t')
    ylabel('x(t)')
    legend('x_{1_{c}}','x_{2_{c}}','x_{1_{v}}','x_{2_{v}}','x_{1_{MPC}}','x_{2_{MPC}}')
    title("Estados em tempo contínuo")
    saveas(gcf,'imgs/plot_x.png')
end