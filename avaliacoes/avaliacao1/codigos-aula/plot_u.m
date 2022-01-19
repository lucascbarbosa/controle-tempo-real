function plot_u(u,u1,u2)
    plot(u)
    hold on
    plot(u1)
    hold on
    plot(u2)
    xlabel('t')
    ylabel('u(t)')
    legend('u_c','u_v','u_{MPC}')
    title("Sinais de controle de em tempo contínuo")
    saveas(gcf,'imgs/plot_u.png')
end
